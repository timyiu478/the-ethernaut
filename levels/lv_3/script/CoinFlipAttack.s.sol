// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {CoinFlipAttack} from "../src/CoinFlipAttack.sol";

contract CoinFlipAttackScript is Script {
    CoinFlipAttack public coinFlipAttack;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        coinFlipAttack = new CoinFlipAttack();

        vm.stopBroadcast();
    }
}
