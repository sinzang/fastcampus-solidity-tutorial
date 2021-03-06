contract ERC20TokenComplete {

    string public constant name = "Token Name";
    string public constant symbol = "SYM";
    uint8 public constant decimals = 18;

    uint256 public totalSupply ;

    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    address owner; // 토큰 발행자

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor(
        uint256 _totalSupply
    ) public {
        owner = msg.sender;
        totalSupply = _totalSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        Transfer(address(this), msg.sender, totalSupply);
        assert(true);
    }

    function transfer(address to, uint amount)  public {
        require(balanceOf[msg.sender] >= amount); // 보내는 사람의 보유량 확인
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        Transfer(msg.sender, to, amount);
    }

    function burn(uint amount) onlyOwner public {
        require(totalSupply >= amount); // 전체 보유량 확인
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        Burn(msg.sender, amount);
    }

    function addPublish(uint amount) onlyOwner public{
        totalSupply += amount * 10 ** uint(decimals); // totalSupply = totalSupply + amount * 10 ** uint(decimals);
        balanceOf[msg.sender] +=  amount * 10 ** uint(decimals);
    }
}
