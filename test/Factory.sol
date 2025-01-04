// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
什么是工厂模式：工厂模式是拥有一个合约工厂，该合约将承担创建其他合约的任务。
为什么：
    同一个合约的多个实例；
    节约部署成本，可以先部署工厂，之后在使用时用来部署其他合约；
    提高合约安全性；

*/
//import3中方式：1，本地；2.网络url(需要是public);3.通过包引入@公司名/包名

import {HelloWorld} from "./test1.sol";

contract HelloWorldFactory {
    HelloWorld[] hws;
    function createHelloWorld() public {
        HelloWorld hw = new HelloWorld();
        hws.push(hw);
    }

    function getHelloWorldByIndex(uint256 _index) view public returns (HelloWorld) {
        return hws[_index];
    }

    function callSayHelloFactory(uint256 _index, uint256 _id) 
    public view 
    returns (string memory){
        return hws[_index].sayHello(_id);
    }

    function callSetHelloWorldFromFactory(uint256 _index, string memory newString,uint256 _id) 
    public {
        hws[_index].setHelloWorld(newString,_id);
    }
}