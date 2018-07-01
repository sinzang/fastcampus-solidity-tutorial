contract ERC20Token {

    string public constant name = "Token Name";
    string public constant symbol = "SYM";
    uint8 public constant decimals = 0;

    uint256 public totalSupply ;

    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    mapping (address => bool) public blackList;

    function ERC20Token(
        uint256 _totalSupply
    ) public {
        totalSupply = _totalSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        Transfer(address(this), msg.sender, totalSupply);
        assert(true);
    }

    function transfer(address to, uint amount) public {
        require(!blackList[to]); // 블랙리스트 등록 유무확인
        require(balanceOf[msg.sender] >= amount); // 보내는 사람의 보유량 확인
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        Transfer(msg.sender, to, amount);
    }

    function burn(uint amount) public {
        require(totalSupply >= amount); // 전체 보유량 확인
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        Burn(msg.sender, amount);
    }

    function addPublish(uint amount) public{
        totalSupply += amount * 10 ** uint(decimals);
        balanceOf[msg.sender] += totalSupply;
    }

    function blockListRegistry(address to) public {
        blackList[to] = true;
    }
    
    function blockListUnRegistry(address to) public {
        blackList[to] = false;
    }
}
