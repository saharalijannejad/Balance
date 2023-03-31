//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract MintERC20Token  {

    string public name;
string public symbol;
uint8 public decimals;
uint256 public totalSupply;

mapping(address => uint256) public balanceOf;
mapping(address => mapping(address => uint256)) public allowance;

constructor(
    string memory _name,
    string memory _symbol,
    uint8 _decimals,
    uint256 _totalSupply
) {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    totalSupply = _totalSupply;
    balanceOf[msg.sender] = _totalSupply;
}

event Transfer(address indexed _from, address indexed _to, uint256 _value);
event Approval(address indexed _owner, address indexed _spender, uint256 _value);
event Mint(address indexed _to, uint256 _value);

function mint(uint256 _amount, address _to) external returns (bool success) {
    balanceOf[_to] += _amount;
    totalSupply += _amount;
    emit Mint(_to, _amount);
    return true;
}

function transfer(address _to, uint256 _value) external returns (bool success) {
    require(_to != address(0), "Invalid address");
    require(balanceOf[msg.sender] >= _value, "Insufficient balance");
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    emit Transfer(msg.sender, _to, _value);
    return true;
}

function approve(address _spender, uint256 _value) external returns (bool success) {
    require(_spender != address(0), "Invalid address");
    allowance[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
}

function transferFrom(address _from, address _to, uint256 _value) external returns (bool success) {
    require(_to != address(0), "Invalid address");
    require(balanceOf[_from] >= _value, "Insufficient balance");
    require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");
    balanceOf[_from] -= _value;
    balanceOf[_to] += _value;
    allowance[_from][msg.sender] -= _value;
    emit Transfer(_from, _to, _value);
    return true;
}

}