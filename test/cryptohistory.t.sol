// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "forge-std/Test.sol";
import "../src/utils.sol";
import "../src/cryptohistory.sol";

contract cryptohistoryTest is Test {
    //
    cryptohistory internal ch;

    string internal what;
    uint40 internal when;

    string internal constant jsonHeader = "data:application/json;base64,";
    string internal constant textHeader = "data:text/plain;base64,";

    string internal constant svg1 =
        '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: white; font-family: serif; font-size: 11px; }</style><rect width="100%" height="100%" fill="black" /><text x="11" y="22" class="base">';
    string internal constant svg2 = "</text></svg>";

    string internal constant json1 = '{"name": "cryptohistory", "description": "';
    string internal constant json2 = '", "image": "data:image/svg+xml;base64,';
    string internal constant json3 = '", "attributes": {"timestamp": "';
    string internal constant json4 = '"}, "content": {"mimeType": "text/plain", "hash": "';
    string internal constant json5 = '", "uri": ""}}';

    function setUp() public {
        vm.warp(2_000_000_000); // now-ish

        what = "setec astronomy";
        when = uint40(block.timestamp);

        ch = new cryptohistory(what);
    }

    function testInitial() public {
        assertEq(ch.name(), "cryptohistory");
        assertEq(ch.symbol(), "ch");

        assertEq(ch.balanceOf(address(ch)), 1);
        assertEq(ch.ownerOf(1), address(ch));

        assertEq(ch.what(), what);
        assertEq(ch.when(), when);

        string memory expected = string(
            abi.encodePacked(
                jsonHeader,
                utils.encode(
                    bytes(
                        string(
                            abi.encodePacked(
                                json1,
                                what,
                                json2,
                                utils.encode(bytes(abi.encodePacked(svg1, what, svg2))),
                                json3,
                                utils.uint256ToString(uint256(when)),
                                json4,
                                "c6b42eaac2358c82dd4f81d90d9857df6d8a61a48a2364484fdb37c2befebd12",
                                json5
                            )
                        )
                    )
                )
            )
        );

        assertEq(ch.tokenURI(1), expected);
    }
}
