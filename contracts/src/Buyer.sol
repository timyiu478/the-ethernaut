// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IShop {
    
    function isSold() external view returns (bool);
    function buy() external;
}

contract Buyer {
    address shop;

    function price() external view returns (uint256) {
        return IShop(shop).isSold() ? 2 : 10000;
    }

    function buyFromShop(address _shop) public {
        shop = _shop;
        IShop(shop).buy();
    }
}
