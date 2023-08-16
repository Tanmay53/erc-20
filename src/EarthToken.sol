// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import { ERC20 } from "@openzeppelin/token/ERC20/ERC20.sol";

contract EarthToken is ERC20 {
    constructor(uint initialSupply) ERC20("EarthToken", "ET") {
        _mint(msg.sender, initialSupply);
    }
}