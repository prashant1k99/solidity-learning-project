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
}