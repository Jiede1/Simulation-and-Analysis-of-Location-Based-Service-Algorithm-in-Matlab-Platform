%%%%模型一里，推荐给用户的经纬度，以及细类别%%%%
import containers.Map
key=keys(tuijianall);
tuijianall_wei=Map();
%for i=1:length(tuijianall)
for i=1:1576
   user=char(key(i));
   city=char(tuijianall(user));  %用户去过的city
   index1=find(VarName7==str2num(user));%用户去过的地点id对应的行
   id=VarName8(index1);%用户去过的地点id
   [h,index2]=ismember(id,VarName1);  
   index2=index2(find(index2));
   [h1,index2_1]=ismember(VarName4(index2),{city});  %基于推荐城市，找出用户对应行
   index2_1=find(index2_1);
   if sum(h1)~=0  %如果推荐city是用户去过的
       length(index2_1)
       tf=VarName6(index2_1);  %用户在推荐城市里面，去过的细类别
       %下面这代码寻找出现次数最多的细类别
       table=tabulate(tf);  % 返回一个矩阵：第一列为元素值，第二列为相应元素出现个数，第三列为相应元素个数占所有元素个数百分比
       [n,m]=size(table);
       if n==1
            [maxCount,idx]=max(cell2mat(table(:,2)));%获取出现次数最多的元素的下标，idx存放出现次数最多元素在table中的下标，若有多个元素则返回第一个元素的下标
       else
            [maxCount,idx]=max(cell2mat(table(:,2)));
       end
       bestxi=table(idx); %用户去最多的细类别地点
       %求经纬度
       [h,index3]=ismember(tf,bestxi);
       index3=find(index3==1);
       weizhi=index2_1(index3);
       tuijianall_wei(user)={VarName2(weizhi),VarName3(weizhi),bestxi};
   else   
       table=tabulate(id); 
       [maxCount,idx]=max(table(:,2));
       bestid=table(idx);   %最好的地点id
       pindex=find(VarName1==bestid)
       tuijianall_wei(user)={VarName2(pindex),VarName3(pindex),VarName6(pindex)}
   end
end
    