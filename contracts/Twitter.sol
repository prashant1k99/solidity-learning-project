// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 1️⃣ Create a Twitter Contract ✅
// 2️⃣ Create a mapping between user and tweet ✅
// 3️⃣ Add function to create a tweet and save it in mapping ✅
// 4️⃣ Create a function to get Tweet ✅ 
// 5️⃣ Add array of tweets ✅

contract Twitter {

    mapping(address => string[]) public tweets;

    // the parameter string can be long so we add memory keyword to degine that we should store this parameter in memory
    function crateTweet(string memory _tweet) public {
        tweets[msg.sender].push(_tweet);
    }

    function getTweet(address _owner, uint _i) public view returns (string memory) {
        return tweets[_owner][_i];
    }

    function getAllTweets(address _owner) public  view returns (string[] memory) {
        return tweets[_owner];
    }
}