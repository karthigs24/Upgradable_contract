// contracts/ERC20BasicV3.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract ERC20BasicV3 {
    string public constant name = "Apple";
    string public constant symbol = "BSC";
    uint8 public constant decimals = 18;
    //uint256 public constant transfertoken;

    event Approval(
        address indexed tokenOwner,
        address indexed spender,
        uint256 tokens
    );
    event Transfer(address indexed from, address indexed to, uint256 tokens);

    mapping(address => uint256) balances;

    mapping(address => uint256) public count;
    mapping(address => uint256) public transferedtime;
    //mapping(address => uint256) public transfertoken;
    mapping(address => mapping(address => uint256)) allowed;
    uint256 totalSupply_;

    // address receiver;

    using SafeMath for uint256;

    //  constructor(uint256 total) public {
    // totalSupply_ = total;
    // balances[msg.sender] = totalSupply_;
    //   }

    function initialize(address admin) public {
        // _admin = admin;
    }

    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

    function balanceOf(address tokenOwner) public view returns (uint256) {
        return balances[tokenOwner];
    }

    function transfer(address receiver, uint256 numTokens)
        public
        returns (bool)
    {
        require(numTokens <= balances[msg.sender]);
        uint256 sample1 = (balances[msg.sender] * 1) / 100;
        uint256 sample2 = (balances[msg.sender] * 75) / 10000;
        uint256 sample3 = (balances[msg.sender] * 50) / 10000;
        if (numTokens >= sample1) {
            balances[receiver] = balances[receiver].add(numTokens) + sample1;
        } else if (numTokens < sample1 && numTokens >= sample2) {
            balances[receiver] = balances[receiver].add(numTokens) + sample2;
        } else if (numTokens < sample2 && numTokens >= sample3) {
            balances[receiver] = balances[receiver].add(numTokens) + sample3;
        }
        /*if(transferedtime[msg.sender] == 0)
        {
        transferedtime[msg.sender] = block.timestamp;
         }*/
        /// require(transferedtime[msg.sender] < block.timestamp);//0 < 4.17 4.20 < 4.19
        // if( transferedtime[msg.sender] < block.timestamp){
        //     count[msg.sender] = 1;
        //     // count[msg.sender] = count[msg.sender] + 1;
        //     transferedtime[msg.sender] = block.timestamp + 180;
        // }
        // else if(transferedtime[msg.sender] <= block.timestamp + 180){
        //     require( count[msg.sender] < 3,"you are not able to do 4 transcation");
        //     count[msg.sender] ++;
        // }

        // transferedtime[msg.sender] = block.timestamp + 180;//added 3 min 4.51
        // require(count[msg.sender] < 2,"You are allowed to transfer only two time");//2<2 dont
        // balances[msg.sender] = balances[msg.sender].sub(numTokens);//100-10 = 90
        // balances[receiver] = balances[receiver].add(numTokens);//b[bharath] = 0 +10 = 10
        // count[msg.sender] = count[msg.sender] + 1;// 1+1 = 2
        // if(count[msg.sender] == 2){
        //     count[msg.sender] = 0;
        // }
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }

    function approve(address delegate, uint256 numTokens)
        public
        returns (bool)
    {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    function allowance(address owner, address delegate)
        public
        view
        returns (uint256)
    {
        return allowed[owner][delegate];
    }

    function transferFrom(
        address owner,
        address buyer,
        uint256 numTokens
    ) public returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);

        balances[owner] = balances[owner].sub(numTokens);
        allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numTokens);
        balances[buyer] = balances[buyer].add(numTokens);
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}

library SafeMath {
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}
