// SPDX-License-Identifier: MIT
// Define the version of solidity compiler
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

// Mapping: In JS terms it's like key value pair, where you set value at an address of a particular key
contract Mapping {
    // Mapping from address to uint
    mapping(address => uint) public myMap;

    function get(address _addr) public view returns (uint) {
        // Mapping always returns a value.
        // If the value was never set, it will return the default value.
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public {
        // Update the value at this address
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        // Reset the value to the default value
        delete myMap[_addr];
    }
}

// Arrays:
contract Array {
    // Several ways to initialize an array
    // This is a dynamic array, it can be resized
    uint[] public dynamicArr;
    uint[] public dynamicArr2;
    // Fixed sized array, all elements initiialize to 0
    uint[10] public myFixzedSizeArr;
    string[5] public names;

    // To add data to array
    function addToDynamicArray(uint value) public {
        dynamicArr.push(value);
    }

    // To fetch the length of the Array
    function getDynamicArrayLength() public view returns (uint) {
        return dynamicArr.length;
    }

    // Fetch value at a particulary index
    function get(uint i) public view returns (uint) {
        return dynamicArr[i];
    }

    // Get the complete array
    function getArr() public view returns (uint[] memory) {
        return dynamicArr;
    }

}

// Structs: Similar to Object definition in JS
contract TeslaRegistry {
    // Defines the schema of Tasla Object
    struct Tesla {
        string model;
        uint256 year;
        string color;
        uint256 mileage;
        string vin;
    }

    Tesla[] public teslas;

    // To add data to the object:
    function addTesla(string memory model, uint256 year, string memory color, uint256 mileage, string memory vin) public  {
        // Here we create new Object for the tesla Model
        Tesla memory newTesla = Tesla({
            model: model,
            year: year,
            color: color,
            mileage: mileage,
            vin: vin
        });

        // Here we push the newly created tesla model in the array
        teslas.push(newTesla);
    }
}

// Require: It is used to create conditions in Solidity
// if (true) { continue; } otherwise { REVERT; }

contract SimpleToken {
    uint256 public maxPerMint = 3;

    function mint(uint256 amount)  public {
        require(amount <= maxPerMint, "No more then 3 allowed");

        // ....
        // mint the coin
    }
}