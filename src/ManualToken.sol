// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

contract ManualToken {
    mapping(address => uint) private s_balances;

    function name() public pure returns(string memory) {
        return "Manual Token";
    }

    function decimals() public pure returns(uint) {
        return 18;
    }

    function totalSupply() public pure returns(uint) {
        return 1e18;
    }

    function balanceOf(address owner) public view returns(uint) {
        return s_balances[owner];
    }

    function transfer(address to, uint amount) public {
        uint previousBalances = balanceOf(msg.sender) + balanceOf(to);
        s_balances[msg.sender] -= amount;
        s_balances[to] += amount;
        require(previousBalances == balanceOf(msg.sender) + balanceOf(to));
    }
}