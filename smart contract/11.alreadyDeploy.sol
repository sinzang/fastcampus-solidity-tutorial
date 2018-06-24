interface AlreadyDeployContract {
    function getSimpleA() returns (uint);
}

contract Sample{
    AlreadyDeployContract a = AlreadyDeployContract(배포된 컨트랙트 주소);

    funntion getA() view returns(uint) {
        return a.getSimpleA();
    }

}
