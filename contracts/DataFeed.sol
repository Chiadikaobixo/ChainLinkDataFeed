// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract DataFeed {
    AggregatorV3Interface internal ethereum;
    
    /**
     * @dev Initializes the Goerli Testnet proxy 
     * `0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e` for the ETH / USD
    */
    constructor() {
        ethereum = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
    }
    
    /**
     @dev returns the price of ethereum to usd
    */
    function getEthPrice() public view returns (int $){
        (
           ,
           int256 answer,
           ,
           ,
           
        ) = ethereum.latestRoundData();
        // scale down the answer by 10 ** 8 in order to get price in USD
        $ = answer / 1e8;
        return $;
    }
}
