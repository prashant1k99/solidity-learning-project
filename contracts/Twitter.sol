// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 1️⃣ Add id to Tweet Struct to make every Tweet Unique
// 2️⃣ Set the id to be the Tweet[] length 
// HINT: you do it in the createTweet function
// 3️⃣ Add a function to like the tweet
// HINT: there should be 2 parameters, id and author
// 4️⃣ Add a function to unlike the tweet
// HINT: make sure you can unlike only if likes count is greater then 0
// 4️⃣ Mark both functions external

contract Twitter {

    // Define olut struct
    struct Tweet {
        uint256 id;
        address author;
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
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    function likeTweet(address author, uint256 id) external {
        require(tweets[author][id].id == id, "Tweet does not exists");
        tweets[author][id].likes++;
    }

    function unlikeTweet(address author, uint256 id) external {
        require(tweets[author][id].id == id, "Tweet does not exists");
        require(tweets[author][id].likes > 0, "Tweet has no likes");
        tweets[author][id].likes--;
    }

    function changeTweetLength(uint16 newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLength;
    }

    function getTweet(address author, uint _i) public view returns (Tweet memory) {
        return tweets[author][_i];
    }

    function getAllTweets(address author) public  view returns (Tweet[] memory) {
        return tweets[author];
    }
}