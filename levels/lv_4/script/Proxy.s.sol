// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {TelephoneProxy} from "../src/Proxy.sol";

contract ProxyScript is Script {

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        new TelephoneProxy();

        vm.stopBroadcast();
    }
}
