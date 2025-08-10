// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract FakeTimeZone {
    address slot_0;  
    address slot_1;  
    uint256 storedTime; // map to Preservation's owner state variable

    function setTime(uint256 _time) public {
        storedTime = _time;
    }
}
