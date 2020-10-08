// SPDX-License-Identifier: MIT

pragma solidity ^0.7.2;

contract Lottery {
    address public manager;
    address payable[] public players;
    
    constructor() {
        // automatically get address of person calling the function;
        manager = msg.sender;
    }
    
    function enter() public payable {
        // must pass requirement or the function wont run
        require(msg.value > .01 ether); // msg.value: amount of ether in wei
        
        players.push(msg.sender);
    }
    
    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }
    
    function pickWinner() public restricted {
        uint index = random() % players.length;
        players[index].transfer(address(this).balance);
        players = new address payable[](0);
    }
    
    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
    
    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }
}