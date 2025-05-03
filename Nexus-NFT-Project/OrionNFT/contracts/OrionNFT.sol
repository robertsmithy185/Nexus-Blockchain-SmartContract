// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OrionNFT is ERC721, Ownable {
    uint256 private _tokenIdCounter;
    uint256 public constant MAX_SUPPLY = 50;

    constructor(address initialOwner) ERC721("OrionNFT", "ORN") Ownable(initialOwner) {
        _tokenIdCounter = 1;
    }

    function mint(address to) public onlyOwner returns (uint256) {
        require(_tokenIdCounter <= MAX_SUPPLY, "Max supply reached");
        uint256 tokenId = _tokenIdCounter;
        _tokenIdCounter++;
        _safeMint(to, tokenId);
        return tokenId;
    }

    function totalSupply() public view returns (uint256) {
        return _tokenIdCounter - 1;
    }
}
