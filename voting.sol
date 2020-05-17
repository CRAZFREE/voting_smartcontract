pragma solidity ^0.5.0;
contract voting{
    uint id=0;
    struct candidate{
        uint c_id;
        string c_name;
        uint c_vote;
    }
    constructor() public{
        addCandidate("Bob Marely");
        addCandidate("Juic Wrld");
    }
    mapping(uint=>candidate) public vote;
    event candidateadded(uint c_id,string c_name,uint c_vote);
    event votecast(uint c_id,uint c_vote);
    function addCandidate(string memory _c_name) public{
        id++;
        vote[id]=candidate(id,_c_name,0);
        emit candidateadded(id,_c_name,0);
    }
    function vote_c(uint s_id) public{
        candidate memory _cid = vote[s_id];
        _cid.c_vote++;
        vote[s_id]=_cid;
        emit votecast(s_id,_cid.c_vote);

    } 
}