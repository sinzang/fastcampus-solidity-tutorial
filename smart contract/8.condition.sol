contract Sample{
    function test(uint a) view returns(uint) {
        if (a == 1) {
            return 1;
        } else {
            return 10;
        }
    }
}
