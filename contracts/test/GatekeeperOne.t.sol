// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

contract GateKeepOneTest is Test {

    function setUp() public {
    }

    function test_gatekey() public {
        address gatekey = 0xB1473Ba227C4645501E0e05f4839b00ED8320d33;

        console.log(uint160(gatekey));
        console.log(uint16(uint160(gatekey)));

        assertEq(true, true);
    }
}
