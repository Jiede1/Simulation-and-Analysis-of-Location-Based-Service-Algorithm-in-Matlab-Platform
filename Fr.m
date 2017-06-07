function [ fr,FC,RC ] = Fr( VarName1,VarName5,VarName6 )
%通过Fr算出每个地点的语义信息向量
%传入导数为VarName1,VarName5,VarName6
clc;
D=length(VarName1)   %所有地点
R=cat(2,VarName5,VarName6 ); %连接VarName5,VarName6,大小为(length(VarName5),2)的矩阵
FC=zeros(length(VarName1),4);
num_k=zeros(1,4);
RC=zeros(length(VarName1),4);
z=[];  %储存粗细类别所出现的所有字眼

for i=1:length(VarName1)  
    temp=char(R(i,:));
    for p=1:4
        %temp(p)
        if ~ismember(temp(p),z)  %判断某元素是否在z中
            z=[z,temp(p)];
        end
    end
end
z;
z_num=zeros(1,length(z));  %对应于z，每个字眼出现过的地点数
for i=1:length(VarName1)  
    temp=char(R(i,:));
    for p=1:4
        ans=sum(temp(p)==z);
        if ans~=0
            z_num(find((temp(p)==z)))=z_num(find((temp(p)==z)))+1;
        end
    end
end
    
for i=1:length(VarName1)   
    k=char(R(i,:));  %代表一个地点的粗细类别描述文字
    for k_index=1:4
        a1=find(k==k(k_index)); %一个地点的字出现的次数
        %length(a1)
        FC(i,k_index)=1/length(a1); 
        find(k(k_index)==z);
        if find(k(k_index)==z)   
            %find(k(k_index)==z)
            RC(i,k_index)=log(D/z_num(find(k(k_index)==z)));
        end
    end
end
fr=FC.*RC;
end

