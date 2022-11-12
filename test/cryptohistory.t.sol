// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "forge-std/Test.sol";
import {cryptohistory} from "../src/cryptohistory.sol";

contract cryptohistoryTest is Test {
    //

    cryptohistory internal ch;

    function setUp() public {
        ch = new cryptohistory();
    }

    function testInitial() public {
        assertEq(ch.name(), "cryptohistory");
        assertEq(ch.symbol(), "ch");
    }
}
