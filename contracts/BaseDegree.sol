// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract BaseDegree {
    string name;
    string regno;
    string prog;
    string branch;
    string gender;
    uint64 cpi;
    string nationality;
    string category;

    constructor(
        string memory _name,
        string memory _regno,
        string memory _prog,
        string memory _branch,
        string memory _gender,
        uint64 _cpi,
        string memory _nationality,
        string memory _category
    ) {
        name = _name;
        regno = _regno;
        prog = _prog;
        branch = _branch;
        gender = _gender;
        cpi = _cpi;
        nationality = _nationality;
        category = _category;
    }
}
