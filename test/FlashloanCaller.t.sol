// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {FlashloanCaller} from "../src/FlashloanCaller.sol";

contract FlashloanCallerTest is Test {
    FlashloanCaller public flashloanCaller;

    function setUp() public {
        flashloanCaller = new FlashloanCaller();
    }

    function test_blue() public {
        address usdc = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
        uint256 amount = 1 * 10 ** 6;

        flashloanCaller.flashloanBlue(usdc, amount);
    }

    function test_balancer() public {
        address usdc = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
        uint256 amount = 1 * 10 ** 6;

        flashloanCaller.flashloanBalancer(usdc, amount);
    }

    function test_aave() public {
        address usdc = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
        uint256 amount = 1 * 10 ** 6;

        flashloanCaller.flashloanAave(usdc, amount);
    }
}
