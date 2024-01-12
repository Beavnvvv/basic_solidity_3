<a name="uM9KJ"></a>
### Bigbank.sol
<a name="aEdVk"></a>
### (Compared to bank.sol,Two additional functions have been implemented)
<a name="s32e2"></a>
##### 1.仅 >0.001 ether(用modifier权限控制)可以存款
![图片.png](https://cdn.nlark.com/yuque/0/2024/png/27181615/1705037852954-784ee9cf-bd68-4bb7-81a2-4c24a66d26eb.png#averageHue=%23232539&clientId=u83991dc2-e752-4&from=paste&height=182&id=rQKwm&originHeight=273&originWidth=1163&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=40836&status=done&style=none&taskId=u16b209ea-eeb9-48b2-83f6-433d20e9181&title=&width=775.3333333333334)
<a name="pJmVD"></a>
##### 2.把管理员转移给 Ownable 合约,只有 Ownable 可以调用BigBank 的withdraw().
![图片.png](https://cdn.nlark.com/yuque/0/2024/png/27181615/1705037939070-f37ca30b-d906-449a-8aac-d2fb0c43008a.png#averageHue=%2324273b&clientId=u83991dc2-e752-4&from=paste&height=103&id=u1d8a35af&originHeight=155&originWidth=646&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=19427&status=done&style=none&taskId=uc80ece3c-31bd-476d-9ca7-cb548358cae&title=&width=430.6666666666667)<br />![图片.png](https://cdn.nlark.com/yuque/0/2024/png/27181615/1705037925158-284e2b42-697e-4275-be61-244c77d216c2.png#averageHue=%23232438&clientId=u83991dc2-e752-4&from=paste&height=276&id=u69a2e2e6&originHeight=414&originWidth=787&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=34876&status=done&style=none&taskId=u6cc3c3ca-f1c9-42d5-b95e-bcd3fb1e1ab&title=&width=524.6666666666666)
