// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract Hello {
    string public helloString = "Hello World!!!";

    // Variables:

    // Address- This can be wallet address, contract address, etc..
    address myTestWalletAddres = 0x08f6f49896C590652648e522a3832F95F154c0C0;

    // String-
    string myString = "Ohiyo!!!";

    // Boolean-
    bool isReady = true;

    // Numbers: uint || int [here number after datatype means the memory size in bits, example value for uint8 can go till ( 2 ** 8 )- 1 = 255 ] 
    uint8 MAX_SUPPLY = 10;

    // 1 days here means a timestamp = 86400
    uint256 WAIT_TIME = 1 days;

    // Visibilities:
    
    // Public : with this scope, it is accessible from inside the Contract as well as outside.
    function get() public view returns (bool) {
        return isReady;
    }

    // Private : Accessible from within the scope of this Contract.
    uint8 private myPrivateVar;
    function myPrivateFunction() private {
        // Function implementation here:
    }

    // Internal: It can only be used within Contract and others inheriting the contract. [Example Below]

    // External: It can only be accessed outside of the contract. It can only be used by Wallet, example metamask. and is used to save gas fees [Example Below]
}

// Internal
contract BasicCalculator {
    uint256 public result;

    function add(uint256 a, uint256 b) internal {
        result = a + b;
    }

    function sub(uint256 a, uint256 b) internal {
        result = a - b;
    }
}

contract AdvanceCalculator is BasicCalculator {
    function mul(uint256 a, uint256 b) internal {
        result = a * b;
    }

    function divide(uint256 a, uint256 b) internal {
        result = a / b;
    }

    function performOperation(uint256 a, uint256 b, uint8 operation) public {
        if (operation == 0) add(a, b);
        else if (operation == 1) sub(a, b);
        else if (operation == 2) mul(a, b);
        else if (operation == 3) divide(a, b);
        else revert("Invalid Operation");
    }
}

// External:
contract VeryAdvanceCalculator is BasicCalculator {
    function mul(uint256 a, uint256 b) internal {
        result = a * b;
    }

    function divide(uint256 a, uint256 b) external {
        result = a / b;
    }

    function performOperation(uint256 a, uint256 b, uint8 operation) public {
        if (operation == 0) add(a, b);
        else if (operation == 1) sub(a, b);
        else if (operation == 2) mul(a, b);
        // else if (operation == 3) divide(a, b); <- cannot be used because of external scoping
        else revert("Invalid Operation");
    }
}