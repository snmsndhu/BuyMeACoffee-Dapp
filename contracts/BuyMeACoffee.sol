// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract BuyMeACoffee {
    event NewMemo (
        address indexed from,
        uint256 timestamp,
        string name,
        string message
    );

    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }
    
    Memo [] memos;

    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function BuyCoffee(string memory _name, string memory _message) public payable {
        require(msg.value > 0, "Can't buy coffee with 0 eth ");

        memos.push(Memo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        ));
    }

}