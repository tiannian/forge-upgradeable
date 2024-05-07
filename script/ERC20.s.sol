// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";
import {MyToken} from "src/MyToken.sol";

contract ERC20Script is Script {
    function setUp() public {}

    function run() public {
        address proxy = Upgrades.deployTransparentProxy(
            "MyToken.sol", 0xC870736B475F83aD46f8c3Fe3d11576cb0CF5262, abi.encodeCall(MyToken.initialize, ())
        );

        console.log("address %s", proxy);

        vm.broadcast();
    }
}
