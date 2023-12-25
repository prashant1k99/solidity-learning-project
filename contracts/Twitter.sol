// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 1️⃣ Add a function called changeTweetLength to change max tweet length ✅
// HINT: use newTweetLength as input for function 
// 2️⃣ Create a constructor function to set an owner of contract ✅
// 3️⃣ Create a modifier called onlyOwner ✅
// 4️⃣ Use onlyOwner on the changeTweetLength function ✅

contract Twitter {

    // Define olut struct
    struct Tweet {
        address auther;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    uint16 private MAX_TWEET_LENGTH = 280;
    address public owner;

    mapping(address => Tweet[]) public tweets;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You do not have access to the execution");
        _;
    }

    function crateTweet(string memory _tweet) public {
        // if tweet length <= 280 then we are good, otherwise we revert
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Exceeds the character limit for a single tweet");

        Tweet memory newTweet = Tweet({
            auther: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    function changeTweetLength(uint16 newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLength;
    }

    function getTweet(uint _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }

    function getAllTweets() public  view returns (Tweet[] memory) {
        return tweets[msg.sender];
    }
}