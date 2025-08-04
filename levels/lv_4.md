---
title: "Telephone"
tags: ["Proxy"]
reference: https://ethernaut.openzeppelin.com/level/0x2C2307bb8824a0AbBf2CC7D76d8e63374D2f8446
---

# Description

Claim ownership of the contract below to complete this level.

- Things that might help


```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        if (tx.origin != msg.sender) {
            owner = _owner;
        }
    }
}
```

# Solution

1. What is `tx.origin`?

In Solidity, tx.origin is a global variable that refers to the original external account (EOA) that initiated the transaction — even if the transaction passes through multiple smart contracts.

We can make `tx.origin != msg.sender` by calling `changeOwner` via a proxy contract?
