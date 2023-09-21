// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {
    string public name;
    string public symbol;
    uint256 public totalSupply;
    address public owner;

    mapping(address => uint256) public balances;

    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _initialSupply * 10**18; // Total supply is stored in wei (18 decimals)
        owner = msg.sender;
        balances[msg.sender] = totalSupply; // Assign the initial supply to the contract creator
    }

    function mint(address recipient, uint256 value) public {
        require(msg.sender == owner, "Only the owner can mint tokens");
        require(value > 0, "Mint value must be greater than 0");

        totalSupply += value;
        balances[recipient] += value;
    }

    function burn(address target, uint256 value) public {
        require(msg.sender == owner, "Only the owner can burn tokens");
        require(balances[target] >= value, "Insufficient balance to burn");

        totalSupply -= value;
        balances[target] -= value;
    }
}
