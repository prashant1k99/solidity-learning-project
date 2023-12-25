// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 1️⃣ Define a Tweet Struct with author, content, timestamp, likes ✅
// 2️⃣ Add the struct to array ✅
// 3️⃣ Test Tweets ✅

contract Twitter {

    // Define olut struct
    struct Tweet {
        address auther;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping(address => Tweet[]) public tweets;

    function crateTweet(string memory _tweet) public {
        Tweet memory newTweet = Tweet({
            auther: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    function getTweet(address _owner, uint _i) public view returns (Tweet memory) {
        return tweets[_owner][_i];
    }

    function getAllTweets(address _owner) public  view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}