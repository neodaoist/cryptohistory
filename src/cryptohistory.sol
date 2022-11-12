// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import {ERC721} from "solmate/tokens/ERC721.sol";

contract cryptohistory is ERC721 {
    //

    constructor() ERC721("cryptohistory", "ch") {}

    function tokenURI(uint256 id) public view override returns (string memory) {}
}
