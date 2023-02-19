// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import {ERC721} from "solmate/tokens/ERC721.sol";
import "./utils.sol";

///////////////////////////////////////////////////////////////////////////////////
//                                                                               //
//                           __         __    __       __                        //
//    .----.----.--.--.-----|  |_.-----|  |--|__.-----|  |_.-----.----.--.--.    //
//    |  __|   _|  |  |  _  |   _|  _  |     |  |__ --|   _|  _  |   _|  |  |    //
//    |____|__| |___  |   __|____|_____|__|__|__|_____|____|_____|__| |___  |    //
//              |_____|__|                                            |_____|    //
//                                                                               //
///////////////////////////////////////////////////////////////////////////////////

/// @title cryptohistory v1.1
contract cryptohistory is ERC721 {
    //
    string public what;
    uint40 public when;
    // TODO add who

    constructor(string memory _what) ERC721("cryptohistory", "ch") {
        what = _what;
        when = uint40(block.timestamp);

        _mint(address(this), 1);
    }

    function tokenURI(uint256 /*tokenId*/ ) public view override returns (string memory) {
        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                utils.encode(
                    bytes(
                        string(
                            abi.encodePacked(
                                '{"name": "cryptohistory", "description": "',
                                what,
                                '", "image": "data:image/svg+xml;base64,',
                                utils.encode(
                                    bytes(
                                        string(
                                            abi.encodePacked(
                                                '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: white; font-family: serif; font-size: 11px; }</style><rect width="100%" height="100%" fill="black" /><text x="11" y="22" class="base">',
                                                what,
                                                "</text></svg>"
                                            )
                                        )
                                    )
                                ),
                                '", "attributes": {"timestamp": "',
                                utils.uint256ToString(uint256(when)),
                                '"}, "content": {"mimeType": "text/plain", "hash": "',
                                // TODO fix hash encoding
                                // utils.bytes32ToString(sha256(bytes(what))),
                                "c6b42eaac2358c82dd4f81d90d9857df6d8a61a48a2364484fdb37c2befebd12",
                                '", "uri": ""}}'
                            )
                        )
                    )
                )
            )
        );
    }
}
