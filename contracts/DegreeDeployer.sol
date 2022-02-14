// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./BaseDegree.sol";

contract DegreeDeployer {
    BaseDegree[] public degreesArray;
    mapping(string => uint256) regnoToIndex;
    address public owner;
    string public owner_name;
    string public purpose;

    constructor() {
        owner = msg.sender;
        owner_name = "MNNIT Allahabad";
        purpose = "Student Degrees";
    }

    modifier isOwner() {
        require(msg.sender == owner);
        _;
    }

    function createDegree(
        string memory _name,
        string memory _regno,
        string memory _prog,
        string memory _branch,
        string memory _gender,
        uint64 _cpi,
        string memory _nationality,
        string memory _category
    ) public isOwner {
        BaseDegree new_degree = new BaseDegree(
            _name,
            _regno,
            _prog,
            _branch,
            _gender,
            _cpi,
            _nationality,
            _category
        );
        degreesArray.push(new_degree);
        regnoToIndex[_regno] = degreesArray.length - 1;
    }

    function viewDegreeUsingIndex(uint256 index)
        public
        view
        returns (BaseDegree)
    {
        return degreesArray[index];
    }

    function viewDegreeUsingRegno(string memory _regno)
        public
        view
        returns (BaseDegree)
    {
        return viewDegreeUsingIndex(regnoToIndex[_regno]);
    }

    function viewDegreeDetails(string memory _regno)
        public
        view
        returns (
            BaseDegree,
            string memory,
            string memory,
            string memory,
            string memory,
            string memory,
            uint64,
            string memory,
            string memory
        )
    {
        BaseDegree deg = viewDegreeUsingRegno(_regno);
        return (
            deg,
            deg.name(),
            deg.regno(),
            deg.prog(),
            deg.branch(),
            deg.gender(),
            deg.cpi(),
            deg.nationality(),
            deg.category()
        );
    }
}
