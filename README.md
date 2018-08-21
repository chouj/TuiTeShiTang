# 用MATLAB爬豆瓣推特食堂收集贴，随机推送。
#### 一个MATLAB爬网页的例子

可在本地以Timer设定自动运行，code如下
```
cd {ttst.m所在文件夹路径}

ttst = timer                                 ...
(   'Name'          , 'tuiteshitang'        ...
,   'TimerFcn'      , @(varargin)evalin('base','ttst')  ...
,   'BusyMode'      , 'drop'            ...
,   'ExecutionMode' , 'fixedRate'      ...
,   'Period'        ,  86400               ...
,   'StartDelay'    ,  0                ...
);
start(ttst)
```

或者丢去Thingspeak APP的MATLAB analysis自动执行。

## 致谢

感谢 [@Jessica_ET](https://twitter.com/Jessica_ET/status/147195489635409921) 搜集整理，已获其授权。

## 案例
Telegram Channel [#推特食堂 @aiqing](https://t.me/aiqing)

## 谢谢支持

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.me/Mesoscale)
[![Donate](https://img.shields.io/badge/Donate-WeChat-brightgreen.svg)](https://github.com/chouj/donate-page/blob/master/simple/images/WeChatQR.jpg?raw=true)
[![Donate](https://img.shields.io/badge/Donate-AliPay-blue.svg)](https://github.com/chouj/donate-page/blob/master/simple/images/AlipayQR.jpg?raw=true)
