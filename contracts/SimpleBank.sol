pragma solidity ^0.4.26;

contract SimpleBank {

  mapping (address => uint) balances;

  address public sellerAddr;
  address public buyerAddr;
  
  event LogDepositMade(address accountAddress, address recaddress, uint amount);

  constructor (address rec) public {
    sellerAddr = msg.sender;
    balances[msg.sender] = 100;
    buyerAddr = rec;
    balances[buyerAddr] = 100;
  }

  function sell(uint dep_amt) public returns (uint) {
    if(balances[buyerAddr] >= dep_amt && msg.sender != buyerAddr) {
        balances[buyerAddr] -= dep_amt;
        balances[msg.sender] += dep_amt;
    }
    emit LogDepositMade(msg.sender, buyerAddr, dep_amt);
    return balances[msg.sender];
  }

  function refund(uint withdrawAmount) public returns (uint remainingBalance) {
    if(balances[msg.sender] >= withdrawAmount) {
      balances[msg.sender] -= withdrawAmount;
      balances[buyerAddr] += withdrawAmount;
    }
    return balances[msg.sender];
  }

  function buyerAccount() public view returns (uint) {
    return balances[buyerAddr];
  }

  function sellerAccount() public view returns (uint) {
    return balances[msg.sender];
  }

}