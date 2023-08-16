// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import { Test, console } from "forge-std/Test.sol";
import { DeployEarthToken } from "../script/DeployEarthToken.s.sol";
import { EarthToken } from "../src/EarthToken.sol";

contract EarthTokenTest is Test {
    EarthToken public earthToken;
    DeployEarthToken public deploy;

    address abhi = makeAddr('abhi');
    address jeet = makeAddr('jeet');

    uint public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deploy = new DeployEarthToken();
        earthToken = deploy.run();

        vm.prank(msg.sender);
        earthToken.transfer(abhi, STARTING_BALANCE);
    }

    function testAbhiBalance() public view {
        assert(STARTING_BALANCE == earthToken.balanceOf(abhi));
    }

    function testAllowanceOfToken() public {
        uint initialAllowance = 1000;

        vm.prank(abhi);
        earthToken.approve(jeet, initialAllowance);

        uint transferAmount = 500;

        vm.prank(jeet);
        earthToken.transferFrom(abhi, jeet, transferAmount);

        assertEq(earthToken.balanceOf(abhi), STARTING_BALANCE - transferAmount);
        assertEq(earthToken.balanceOf(jeet), transferAmount);
    }

    function testInitialSupply() public {
        assertEq(earthToken.totalSupply(), deploy.INITIAL_SUPPLY());
    }

    function testTransfer() public {
        uint256 amount = 100;
        address sender = msg.sender;
        uint initialBalance = earthToken.balanceOf(sender);
        address recipient = address(0x1);  // Replace with an actual address

        vm.prank(sender);
        earthToken.transfer(recipient, amount);

        assertEq(earthToken.balanceOf(sender), initialBalance - amount);
        assertEq(earthToken.balanceOf(recipient), amount);
    }

}