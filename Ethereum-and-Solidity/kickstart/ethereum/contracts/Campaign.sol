// SPDX-License-Identifier: MIT

pragma solidity ^0.7.2;

contract CampaignFactory {
    address[] public deployedCampaigns;
    
    // this function will deploy a Campaign contract from the CampaignFactory contract;
    function createCampaign(uint minimum) public {
        address campaign = address(new Campaign(minimum, msg.sender)); // deploys Campaign and returns the address
        deployedCampaigns.push(campaign);
    }
    
    function getDeployedCampaigns() public view returns (address[] memory) {
        return deployedCampaigns;
    }
}

contract Campaign {
    
    struct Request {
        string description;
        uint value;
        address payable recipient;
        bool complete;
        uint approvalCount;
        mapping(address => bool) approvals;
    }
    
    address public manager;
    uint public minimumContribution;
    mapping(address => bool) public approvers;
    uint public approversCount;
    mapping(uint => Request) public requests;
    uint public requestCount;
    
    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
    
    constructor(uint minimum, address creator) {
        manager = creator;
        minimumContribution = minimum;
    }
    
    function contribute() public payable {
        require(msg.value > minimumContribution);
        if (!approvers[msg.sender]) {
            approvers[msg.sender] = true;
            approversCount++;
        }
    }
    
    function createRequest(string memory description, uint value, address payable recipient) public restricted {
        Request storage request = requests[requestCount];
        request.description = description;
        request.value = value;
        request.recipient = recipient;
        request.complete = false;
        request.approvalCount = 0;
        
        requestCount++;
    }
    
    function approveRequest(uint index) public {
        Request storage request = requests[index];
        
        require(approvers[msg.sender]); // checks if current user is a contrubuter)
        require(!request.approvals[msg.sender]); // check if current user already voted
        
        request.approvals[msg.sender] = true;
        request.approvalCount++;
    }
    
    function finalizeRequest(uint index) public restricted {
        Request storage request = requests[index];
        
        require(!request.complete); // make sure request is not already completed
        require(request.approvalCount > (approversCount / 2)); 
        
        request.recipient.transfer(request.value);
        request.complete = true;
    }

    function getSummary() public view returns (uint, uint, uint, uint, address) {
        return (
            minimumContribution,
            address(this).balance,
            requestCount,
            approversCount,
            manager
        );
    }

    function getRequestCount() public view returns (uint) {
        return requestCount;
    }
}