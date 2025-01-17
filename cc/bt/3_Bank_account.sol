// SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.0;

contract Bank {
    
    uint256 balance = 0;
    address public accHolder;

    constructor() {
        accHolder = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "deposit amount should be greater than 0");
        require(msg.sender == accHolder, "you are not account owner");

        balance += msg.value;
    }

    function showBalance() public view returns (uint256) {
        require(msg.sender == accHolder, "you are not account owner");
        return balance;
    }

    function withdraw() public payable {
        require(balance > 0, "you don'thave enough balance");
        require(msg.sender == accHolder, "you are not account owner");
        payable(msg.sender).transfer(balance);
        balance = 0;
    }
}
