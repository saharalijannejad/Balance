// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC1155Token is ERC1155, Ownable {
    mapping(uint256 => uint256) private _totalSupply;
    mapping(uint256 => string) private _tokenURIs;

    constructor(string memory baseURI) ERC1155(baseURI) {}

    function mint(
        address account,
        uint256 id,
        uint256 amount,
        bytes memory data
        
    ) public onlyOwner {
        _mint(account, id, amount, data);
        _totalSupply[id] += amount;
    }

    function burn(
        address account,
        uint256 id,
        uint256 amount
    ) public onlyOwner {
        _burn(account, id, amount);
        _totalSupply[id] -= amount;
    }

    function setTokenURI(uint256 tokenId, string memory newURI) external onlyOwner {
        _tokenURIs[tokenId] = newURI;
    }

    function uri(uint256 tokenId) public view virtual override returns (string memory) {
        return _tokenURIs[tokenId];
    }

   
}
