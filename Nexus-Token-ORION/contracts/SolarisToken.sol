// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SolarisToken is ERC20, Ownable {
    constructor() ERC20("SolarisToken", "SLX") Ownable(msg.sender) {
        _mint(msg.sender, 1_000_000 * 10**decimals());  // Total Supply: 1M
    }
}
