pragma solidity ^0.4.24;

contract ERC20TokenComplete {

    string public constant name = "mmmmmmmmm";
    string public constant symbol = "mung";
    uint8 public constant decimals = 0;

    uint256 public totalSupply ;

    mapping(address => uint256) public balance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    address owner; // 토큰 발행자

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor (
        uint256 _totalSupply
    ) public {
        owner = msg.sender;
        totalSupply = _totalSupply * 10 ** uint256(decimals);
        balance[msg.sender] = totalSupply;
        emit Transfer(address(this), msg.sender, totalSupply);
        assert(true);
    }

    function transfer(address to, uint amount)  public returns(bool) {
        require(balance[msg.sender] >= amount); // 보내는 사람의 보유량 확인
        balance[msg.sender] -= amount;
        balance[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }

    function burn(uint amount) onlyOwner public {
        require(totalSupply >= amount); // 전체 보유량 확인
        balance[msg.sender] -= amount;
        totalSupply -= amount;
        emit Burn(msg.sender, amount);
    }

    function addPublish(uint amount) onlyOwner public{
        totalSupply += amount * 10 ** uint(decimals); // totalSupply = totalSupply + amount * 10 ** uint(decimals);
        balance[msg.sender] +=  amount * 10 ** uint(decimals);
    }
}
