// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OrionNFT is ERC721, ERC721URIStorage, Ownable {
    uint256 private _tokenIdCounter;

    // Konstruktor dengan parameter initialOwner untuk Ownable
    constructor(address initialOwner) 
        ERC721("OrionNFT", "ONFT")
        Ownable(initialOwner)
    {
        _tokenIdCounter = 0;
    }

    // Mengganti nama parameter tokenURI menjadi uri untuk menghindari shadowing
    function mintNFT(address to, string memory uri) 
        public 
        onlyOwner 
        returns (uint256) 
    {
        _tokenIdCounter++;
        uint256 newTokenId = _tokenIdCounter;
        _safeMint(to, newTokenId);
        _setTokenURI(newTokenId, uri);
        return newTokenId;
    }

    // Override function tokenURI
    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        // _exists sudah tersedia dari ERC721
        require(_ownerOf(tokenId) != address(0), "ERC721: URI query for nonexistent token");
        return super.tokenURI(tokenId);
    }

    // Override function _burn
    function _burn(uint256 tokenId) 
        internal 
        virtual
        override(ERC721, ERC721URIStorage) 
    {
        super._burn(tokenId);
    }

    // Override function supportsInterface
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}