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

        assertEq(ch.balanceOf(address(ch)), 1);
        assertEq(ch.ownerOf(1), address(ch));
        // assertEq(ch.tokenURI(1), '{"name": "cryptohistory", "image": "<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="black" /><text x="10" y="20" class="base">cryptohistory</text></svg>", "description": "cryptohistory", "attributes": {"timestamp": "1668244271", "content": {"mimeType": "image/svg+xml", "hash": "XYZ", "uri": ""}}');
    }
}
