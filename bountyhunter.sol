pragma solidity ^0.8.0;

contract BountyBoard {
    struct Bounty {
        string task;
        uint256 reward;
        bool completed;
    }

    Bounty[] public bounties;

    function addBounty(string memory _task, uint256 _reward) public {
        bounties.push(Bounty(_task, _reward, false));
    }

    function completeBounty(uint256 _index) public {
        require(_index < bounties.length, "Invalid index");
        require(!bounties[_index].completed, "Bounty already completed");
        
        bounties[_index].completed = true;
    }
    
    function getBounty(uint256 _index) public view returns (string memory, uint256, bool) {
        require(_index < bounties.length, "Invalid index");
        Bounty memory bounty = bounties[_index];
        return (bounty.task, bounty.reward, bounty.completed);
    }
}
