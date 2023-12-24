// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

// 1️⃣ Make a contract called Calculato ✅
// 2️⃣ Create Result variable to store result ✅
// 3️⃣ Create functions to add, subtract, and multiply to result ✅
// 4️⃣ Create a function to get result ✅

contract MyCalculator {
    uint256 result = 0;

    function add(uint256 num) public {
        result += num;
    }

    function subtract(uint256 num) public {
        result -= num;
    }

    function multiply(uint256 num) public {
        result *= num;
    }

    function get() public view returns (uint) {
        return result;
    }
}