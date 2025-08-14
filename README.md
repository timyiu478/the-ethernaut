# The Ethernaut

The Ethernaut is a Web3/Solidity-based wargame offered by OpenZeppelin, inspired by overthewire.org, played in the Ethereum Virtual Machine. Each level is a smart contract that needs to be 'hacked'. 

---

# Challenges

| Level  | Name                   | Description | Link              | Tags     |
|----|--------------------------------|------------------|---------| ------ |
| 0 | Hello Ethernaut | Learn how to play this game | [View](levels/lv_0.md) | `Tutorials` |
| 1 | Fallback | Bypass contribution check by becoming owner | [View](levels/lv_1.md) | `Fallback` |
| 2 | Fal1Out | Incorrect "Constructor" | [View](levels/lv_2.md) | `Constructor` |
| 3 | CoinFlip | Deterministic and replicatable algorithm | [View](levels/lv_3.md) | `Foundry` |
| 4 | Telephone | Use Proxy to change msg.sender | [View](levels/lv_4.md) | `Proxy` |
| 5 | Token | Unsigned integer overflow attack | [View](levels/lv_5.md) | `Overflow` |
| 6 | Delegation | Beaware the execution context | [View](levels/lv_6.md) | `delegatecall` |
| 7 | Force | Force send eth by self destroy | [View](levels/lv_7.md) | `selfdestruct` |
| 8 | Vault | All variables are public | [View](levels/lv_8.md) | `Variables`, `Storage` |
| 9 | King |  Deny to receive ether | [View](levels/lv_9.md) | `Receive` |
| 10 | Re-entrancy | Use Check-Effect-Interactions Pattern to prevent external call interrupting the execution flow | [View](levels/lv_10.md) | `Receive`, `Check-Effect-Interactions` |
| 11 | Elevator | Use the view function modifier on an interface for preventing state modifications | [View](levels/lv_11.md) | `Stateful function` |
| 12 | Privacy | Type Casting can't provide privacy | [View](levels/lv_12.md) | `Storage`, `Type Casting` |
| 15 | NaughtCoin | Incompleted Authorization Controls | [View](levels/lv_15.md) | `ERC20`, `Inheritance` |
| 16 | Preservation | Exploit delegatecall storage layout miss-match vulnerability | [View](levels/lv_16.md) | `Storage`, `delegatecall` |
| 17 | Recovery | Recover missing contract address | [View](levels/lv_17.md) | `Contract Creation`, `Etherscan` |
| 19 | Alien Codex | Enable to overwrite entire contract storage by underflowing the array length field   | [View](levels/lv_19.md) | `Overflow`, `Underflow`, `Storage`, `Inheritance` |
| 20 | Deny | DoS by Gas Limit Exhaustion   | [View](levels/lv_20.md) | `Gas Limit Exhaustion` |
| 21 | Shop | State modification can happen outside from the view function call chain  | [View](levels/lv_21.md) | `View Function` |
| 26 | Double Entry Point | First on-chain forta detection bot for education purpose | [View](levels/lv_26.md) | `Forta` |
| 27 | Good Samaritan | Custom error throwed by attacker contract | [View](levels/lv_27.md) | `Custom Error` |
| 29 | Switch | Learn how to hard code calldata and bypass function modifier | [View](levels/lv_29.md) | `calldata` |
| 30 | HigherOrder | Dirty Higher Order Bits exploit | [View](levels/lv_30.md) | `calldata` |
