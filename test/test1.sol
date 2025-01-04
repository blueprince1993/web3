// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// this is my first contract

contract HelloWorld {
    //结构体：struct 结构体
    //array 数组
    //mapping k-v 映射

    struct Info {
        string phrase;
        uint256 id;
        address addr;
    }

    Info[] infos;
    mapping (uint256 => Info) infoMapping;
    //1.
    //基本数据类型 bool(只允许true、false)、unit(经常用uint8 uint256)、int、bytes（最高bytes32）、address
    bool boolVar = true;
    uint256 uintVar = 10;
    uint a = 10;//uint = uint256
    int256 b = 10;
    bytes8 bytesVar = "hello";
    //bytes相当于数组
    address addressVar = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;


    string strVal = "Hello World";
    function sayHello(uint256 _id) public view returns(string memory) {
        if (infoMapping[_id].addr==address(0x0)) {
            return addInfo(strVal);
        }
        return addInfo(infoMapping[_id].phrase);
    }
    function setHelloWorld(string memory newString,uint256 _id) public {
        Info memory info = Info(newString,_id,msg.sender);
        infoMapping[_id]=info;
    }
/*
    function sayHello(uint256 _id) public view returns(string memory) {
        for(uint256 i=0; i < infos.length;i++) {
            if (infos[i].id == _id) {
                return addInfo(infos[i].phrase);
            }
        }
        return addInfo(strVal);
    }


    function setHelloWorld(string memory newString,uint256 _id) public {
        Info memory info = Info(newString,_id,msg.sender);
        infos.push(info);
    }
*/

    //pure 单纯计算
    function addInfo(string memory helloWorldStr) internal pure returns(string memory){
        return string.concat(helloWorldStr," from romeo's contract.");
    }
    //2.存储模式
    /*
    1.storage 永久储存：永久存在区块链、合约里
    暂时存储：
    2.memory
    3.calldata 和memory一样，但是运行时无法修改
    4.stack
    5.codes
    6.logs

    */

}