function [l,y]=getFindDate(filename,datetype)
%读数据，只读findDate并转化为单位为天
%输入：excel文件，要求第E列为故障发现时间
data=importdata(filename);
Mydata(:,1)=data(:,5);
for i=1:length(Mydata)
    if(length(Mydata{i,1})<=10)
        FindDate{i,1}=datestr(floor(datenum(Mydata{i,1},'yyyy/mm/dd')),'yyyy/mm/dd');
    else
        FindDate{i,1}=datestr(floor(datenum(Mydata{i,1},'yyyy/mm/dd HH:MM:SS')),'yyyy/mm/dd');
    end
end
%排序
FindTime=sortrows(FindDate,1);

tmp=datenum(FindTime);
j=1;
for i=1:length(tmp)
    tmp2{j,1}=datestr(tmp(i,1),'yyyy-mm-dd');
    j=j+1;
end
findDate=datenum(tmp2);
firstDay=min(findDate);
len=length(findDate);
lastDate=max(findDate)-firstDay;
date=findDate-firstDay;
mt=zeros(lastDate,1);
if(strcmp(datetype,'month'))
    l=ceil(lastDate/30);
end
if(strcmp(datetype,'week'))
    l=ceil(lastDate/7);
end
if(strcmp(datetype,'day'))
    l=lastDate;
end

for i=1:lastDate
    for j=1:len
        if date(j,1)<=i
            mt(i,1)=mt(i,1)+1;
        else
            break;
        end
    end
end
mttmp(1,1)=mt(1,1);
if(strcmp(datetype,'month'))
    for i=31:30:length(mt)
        mttmp((i+29)/30,1)=mt(i,1);
    end
end
if(strcmp(datetype,'week'))
    for i=8:7:length(mt)
        mttmp((i+6)/7,1)=mt(i,1);
    end
end
if(strcmp(datetype,'day'))
    mttmp=mt;
end
clear mt;
mt=mttmp;
clear mttmp;
y(:,1)=mt;
end
