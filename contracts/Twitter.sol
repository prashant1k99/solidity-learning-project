// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 1️⃣  Use require to limit the length of the tweet to be only 280 characters ✅
// HINT: use bytes to length of tweet

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
        // if tweet length <= 280 then we are good, otherwise we revert
        require(bytes(_tweet).length <= 280, "Exceeds the character limit for a single tweet");

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