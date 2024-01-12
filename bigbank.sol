// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract bank {
    address public owner;
    address[] private users;
    uint[3] private tops;
    address[3] private topuser;
    mapping(address => uint) private balances;

    constructor(address _owner) {
        owner = _owner;
    }

    function deposit(address user, uint amount) internal virtual returns (bool) {
        users.push(user);
        balances[user] += amount;

        if (balances[user] > tops[0] && user != topuser[0]) {
            tops[2] = tops[1];
            topuser[2] = topuser[1];
            tops[1] = tops[0];
            topuser[1] = topuser[0];
            tops[0] = balances[user];
            topuser[0] = user;
        } else if (balances[user] > tops[0] && user == topuser[0]) {
            tops[0] = balances[user];
        } else if (balances[user] > tops[1] && user != topuser[1]) {
            tops[2] = tops[1];
            topuser[2] = topuser[1];
            tops[1] = balances[user];
            topuser[1] = user;
        } else if (balances[user] > tops[1] && user == topuser[1]) {
            tops[1] = balances[user];
        } else if (balances[user] > tops[2]) {
            tops[2] = balances[user];
            topuser[2] = user;
        }

        return true;
    }

    function withdraw(uint amount) public  {
        if (msg.sender == owner) {
            payable(msg.sender).transfer(amount);
        } else {
            require(amount < balances[msg.sender]);
            payable(msg.sender).transfer(amount);
        }
        balances[msg.sender] = 0;
    }

    function Top1() public view returns (address) {
        return topuser[0];
    }

    function Top2() public view returns (address) {
        return topuser[1];
    }

    function Top3() public view returns (address) {
        return topuser[2];
    }

    function balance() public view returns (uint) {
        return balances[msg.sender];
    }

    receive() external payable{
        deposit(msg.sender, msg.value);
    }
}

contract bigbank is bank {
    constructor(address _owner) bank(_owner) {}

    function owner_ownable(address ownable) private {
        require(msg.sender == owner, "go away");    
        owner = ownable;
    }

    modifier richman(uint amount) {
        require(amount > 0.001 ether, "Poor guy, go away");
        _;
    }

    function deposit(address user, uint amount) internal override richman(amount) returns (bool){
        super.deposit(user, amount);
        return true;
    }

    function bigbank_deposit(uint amount) public {
        super.deposit(msg.sender, amount);
    }

    function bigbank_withdraw(uint amount) public {
    }


}

contract Ownable {
    address public ownable;

    constructor(address _ownable) {
        ownable = _ownable;
    }

    receive()external payable {
        payable(ownable).transfer(msg.value);

    }
}


