%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 用MATLAB爬豆瓣推特食堂收集贴，随机推送。

% 致谢：
%     感谢 Twitter.com/Jessica_ET 搜集整理，已获其授权。

% 案例：
%     https://t.me/aiqing

% Author: github.com/chouj
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% @Jessica_ET的四个收集贴的链接
url=['https://www.douban.com/note/190136724/';'https://www.douban.com/note/607284464/';'https://www.douban.com/note/320118483/';'https://www.douban.com/note/472532878/'];

% 随机爬一个贴
try
    douban=urlread(url(randi(4,1),:),'TimeOut',60);
    douban=urlread(url(randi(4,1),:),'TimeOut',60);
catch
    pause(60);
    douban=urlread(url(randi(4,1),:),'TimeOut',60);
    douban=urlread(url(randi(4,1),:),'TimeOut',60);
end

% 正则出所有条目
items=regexp(douban,'\d\d?\d?\.(.*?)<br>','tokens');
n=0;
for i=1:length(items)
    clear temp
    temp=cell2mat(items{i});
    if strcmp(temp(1:6),'douban')==0
        n=n+1;
        newitem(n)=items{i};
    end
end

% 根据一个随机的条目，生成推送内容
index=randi(length(newitem),1);
index=randi(length(newitem),1);
itemimg=regexp(cell2mat(newitem(index)),'<img src="(.*?)"','tokens');
if isempty(itemimg)==1 %有照片
    itemcontent=regexp(cell2mat(newitem(index)),'(.*?)\Wvia','tokens');
    itemcontributor=regexp(cell2mat(newitem(index)),'via @(.*?)\W','tokens');
    string=[cell2mat(itemcontent{1}),'<br>(via <a href="https://twitter.com/',cell2mat(itemcontributor{1}),'">@',cell2mat(itemcontributor{1}),'</a>，感谢<a href="https://twitter.com/Jessica_ET/status/147195489635409921">@Jessica_ET</a>搜集整理)'];
else
    itemcontent=regexp(cell2mat(newitem(1)),'(.*?)\Wvia','tokens');
    itemcontributor=regexp(cell2mat(newitem(index)),'via @(.*?)\W','tokens');
    string=[cell2mat(itemcontent{1}),'<br>(via <a href="https://twitter.com/',cell2mat(itemcontributor{1}),'">@',cell2mat(itemcontributor{1}),'</a>，感谢<a href="https://twitter.com/Jessica_ET/status/147195489635409921">@Jessica_ET</a>搜集整理)<br><b>照片</b>：<img src="',cell2mat(itemimg{1}),'">'];
end

% 调用IFTTT的Webhook推送
options = weboptions('RequestMethod','post','Timeout',60);

try
        response = webwrite('https://maker.ifttt.com/trigger/{EventName}/with/key/{YourKey}', 'value1',string, options);
catch
        pause(60);
        response = webwrite('https://maker.ifttt.com/trigger/{EventName}/with/key/{YourKey}', 'value1',string, options);
end




