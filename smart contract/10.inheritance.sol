contract Sample1 {
    uint a = 10;

    function getA() view returns(uint) {
        return a;
    }
}

contract Sample2 is Sample1{
    function getSimpleA() returns (uint) {
        return getA();
    }
}
