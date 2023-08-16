// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import { Script } from "forge-std/Script.sol";
import { EarthToken } from "../src/EarthToken.sol";

contract DeployEarthToken is Script {
    uint public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns(EarthToken) {
        vm.startBroadcast();
        EarthToken earthToken = new EarthToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return earthToken;
    }
}