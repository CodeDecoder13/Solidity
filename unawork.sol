// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

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
 // Coded By Rhuzz
