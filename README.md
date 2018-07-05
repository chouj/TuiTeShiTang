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

感谢 Twitter.com/Jessica_ET 搜集整理，已获其授权。

## 案例
Telegram Channel [#推特食堂 @aiqing](https://t.me/aiqing)
