// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IForta {
    function setDetectionBot(address detectionBotAddress) external;
    function notify(address user, bytes calldata msgData) external;
    function raiseAlert(address user) external;
}

interface ICryptoVault {
    function underlying() external returns (address);
}

contract OnChainBot {
    address forta;
    address vault;
    address owner;
    
    constructor() {
        owner = msg.sender;
    }

    function setUp(address _forta, address _vault) external {
        forta = _forta;
        vault = _vault;
    }


    // expect msgData is msg.data of delegateTransfer function
    function handleTransaction(address user, bytes calldata msgData) external {
        require(user == owner);

        bytes4 expectSelector = bytes4(keccak256("delegateTransfer(address,uint256,address)"));

        require(expectSelector == bytes4(msgData[:4]), "Invalid msgData");

        (address to, uint256 val, address origSender) = abi.decode(msgData[4:], (address, uint256, address));

        if (origSender == vault) {
            IForta(forta).raiseAlert(owner);
        }
    }

}
