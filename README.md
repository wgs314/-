# -
这是一个小白基于metamask和remix的交互做的打卡合约
# Web3 Check-In Smart Contract

一个基于 Solidity 的去中心化打卡（Check-In）智能合约。

用户通过 MetaMask 钱包调用合约，实现每日一次链上打卡，并记录累计打卡次数。

## Features

* ✅ Wallet-based check-in
* ✅ One check-in per day
* ✅ On-chain user record storage
* ✅ Query total check-in count
* ✅ Query today's check-in status
* ✅ Event emission for frontend integration

## Contract Structure

```
CheckIn
│
├── UserInfo
│   ├── lastCheckInDay
│   └── totalCheckIns
│
├── checkIn()
│   └── Write Function
│
├── getCheckInCount()
│   └── Read Function
│
└── hasCheckedInToday()
    └── Read Function
```

## Functions

### checkIn()

执行每日打卡。

* 类型：Write Function
* 需要：MetaMask 交易确认
* 消耗：Gas

执行流程：

1. 获取当前区块链时间
2. 判断用户今天是否已经打卡
3. 更新用户数据
4. 触发 CheckInSuccess 事件

### getCheckInCount(address userAddr)

查询某个钱包地址的累计打卡次数。

* 类型：Read Function
* 不消耗 Gas

示例：

```
Input:
0xYourWalletAddress

Output:
5
```

### hasCheckedInToday(address userAddr)

查询钱包地址今天是否已经打卡。

* 类型：Read Function
* 不消耗 Gas

返回：

```
true  -> 今日已打卡
false -> 今日未打卡
```

## Deployment

### Requirements

* MetaMask Wallet
* Remix IDE
* Solidity Compiler 0.8.20+

### Steps

1. 打开 Remix IDE
2. 创建 `CheckIn.sol`
3. 粘贴 Solidity 合约代码
4. 使用 Solidity 0.8.20+ 编译
5. 连接 MetaMask（Injected Provider）
6. 部署合约

## Usage Flow

```
User
 |
 | Connect MetaMask
 |
 v
checkIn()
 |
 | Blockchain Transaction
 |
 v
Smart Contract
 |
 v
Blockchain Storage
 |
 v
Read Functions
```

## Security Considerations

部署生产环境前需要检查：

* 业务逻辑正确性
* 权限控制
* 数据存储设计
* Gas 消耗
* 时间逻辑
* 智能合约安全漏洞

## Future Improvements

未来可以扩展：

* ERC20 Token 打卡奖励
* 连续签到 Streak 系统
* NFT 成就徽章
* React + ethers.js 前端 DApp
* Proxy 合约升级架构

## License

MIT License
