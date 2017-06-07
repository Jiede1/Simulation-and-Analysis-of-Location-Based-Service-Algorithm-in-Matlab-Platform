%用户数50844,城市90632

%%算法流程：
%%1.新建一个变量dict，储存已经被用于聚类的地点
%%2.遍历地点
%%3.对于一个地点且地点不在dict里
%%  求出其与所有其他地点的Sd（l_i,l_j）---地点距离相似度
%%  求出该地点与其他地点的Sm（l_i,l_j）---语义相似度
%%  取出1000个与该地点相似度最高的地点      
%%4.聚类地点成功，形成了“地点组”
%%5.对于任一用户
%%  对于任一地点组
%%  求出用户在该地点组的签到次数
%%  形成该用户的地点组向量
%%6.对于任一用户
%%  遍历所有其他用户
%%  求出S（u,v）
%%  根据S（u,v）的大小求出该用户的推荐用户top3
%%  求出推荐用户去过的城市集合
%%  遍历这些城市集合
%%      求出S（u,i）
%%      求出最高的S（u,i），i就是用户u的推荐城市

tic;
import containers.Map
%D=length(VarName1); % 地点数
%统计用户去过了哪些城市
%for i=1:50843
%    t=find(VarName7==i);
%    
%end
%统计所有出现过的字，出现次数
%Z=[cell2mat(VarName5);cell2mat(VarName14)];
%z1=unique(cell2mat(VarName5));
%size(z1)
%z2=unique(cell2mat(VarName14));
%size(z2)
%zi=unique([z1;z2]);
%size(zi)
%zi_cishu=Map();
%for i=1:length(zi)
%    zi_cishu(char(zi(i)))=length(find(Z==zi(i)));
%end
%clear i;
%function d=randnorepeat(m,n)
%生成一列在[1,n]范围内的m个不重复的整数
%p=randperm(n);
%d=p(1:m);
%end
%遍历城市
dictcity=[];
dict_city_Map=Map();  %用于储存聚类后的地点，形成地点组
time=1;
R=cat(2,VarName2,VarName3);
id0=unique(VarName1);
for i=1:90632  %遍历地点
    cityid=id0(i);
    if ~ismember(cityid,dictcity)
        simi=zeros(90632,1);  %储存地点cityid地点与其他地点的相似度
        dictcity1=cityid;
        tic;
        for j=1:90632
            %citywait=id0(j);
            LAT1=R(i,1);LON1=R(i,2);
            LAT2=R(j,1);LON2=R(j,2);
            Sd=distance_similarity(LAT1,LON1,LAT2,LON2,1);  %计算两个地点距离相似度，alpha=1
            Sm=sum(fr(i,:).*fr(j,:))/(sqrt(sum(fr(i,:)))*sqrt(sum(fr(j,:))));%计算两个地点语义相似度
            S=Sd*Sm;  %两个地点最终的相似度
            simi(j)=S;
        end
        toc;
        lenc=floor(0.6*(length(simi)-i));  %取出simi减去i后中60%的元素
        lenc       
        [sort_city,indexall]=sort(simi,1,'descend');  %降序
        length(indexall) 
        if length(indexall)>=lenc
            index=indexall(1:lenc);
        else
            index=indexall(:);
        end
        tf=ismember(VarName1(index),dictcity); %VarName1(index)是否在dictcity里
        op=find(tf==0);
        g=VarName1(index);
        dictcity=unique([dictcity;g(op)]);
        dictcity1=unique([dictcity1;g(op)]);
        dict_city_Map(num2str(time))=dictcity1;  %储存的是地点id
        time=time+1;
        dictcity1=[];
        clear simi;
        length(dictcity)
    end
    if length(dictcity)==90632
        break;
    end
end
clear i;
clear j;
clear k;
clear R;
1
%用户的地点组向量
DZXL=zeros(50844,length(dict_city_Map));
for i=1:50844
    quguo=find(VarName7==i);
    for j=1:length(dict_city_Map)  %遍历地点组
        cityuser=dict_city_Map(num2str(j));
        DZXL(i,j)=sum(ismember(cityuser,VarName8(quguo)));
    end
    clear quguo;
end
clear i;
clear j;
clear cityuser;
2

tuijianall=Map();  %最终的推荐地点

for u=1:20000
    %储存与用户u最接近的3个用户
    tic;
    SS=zeros(5,1);
    vall=[u,randi([1,50844],1,4)];
    parfor v_index=1:5
        v=vall(v_index);
        s=sum(DZXL(u,:).*DZXL(v,:))/(sqrt(sum(DZXL(u,:)))*sqrt(sum(DZXL(v,:))));
        if ~isnan(s)
            SS(v_index)=s;
        end
    end
    [Suv,userindex]=sort(SS,1,'descend');  %Suv是用户的相似度数值
    lenu=3;  %取出S中3个元素
    usersimi=vall(userindex(1:lenu));  %相似的3个用户
    bestsui=-inf;  %用户u与地点i的相似度,也是最终的推荐地点
    tuijian=[];   %最终的推荐地点id
    cv=zeros(3,1);  %用户v的总签到次数
    cityall=[];  %相似的3个用户去过的所有地点城市
    ind=ismember(VarName7,usersimi);
    cityall=unique(VarName8(find(ind==1)));
    for v=1:3  %遍历3个用户
        index=find(VarName7==usersimi(v));
        %cityv=unique(VarName8(index));  %用户v去过的城市集合
        cv(v)=length(index);  %用户v的总签到次数
        %cityall=unique([cityall;cityv]);
    end
    clear index;
    for i=1:length(cityall)  %遍历相似用户去过的城市
        sui=0;
        for v=1:3 %遍历用户
            index=find(VarName7==usersimi(v));
            cvi=sum(ismember(VarName8(index),cityall(i,:)));
            sui=sui+(Suv(v)*cvi/cv(v))/sum(Suv(1:3));
        end
        if sui>bestsui
            bestsui=sui;
            tuijian=cityall(i,:);
        end
    end
    tuijiancity=unique(VarName4(find(VarName1==tuijian)));
    tuijianall(num2str(u))=tuijiancity;
    clear SS;
    toc;
end

for u=20001:50844
    %储存与用户u最接近的3个用户
    tic;
    SS=zeros(5,1);
    vall=[u,randi([1,50844],1,4)];
    parfor v_index=1:5
        v=vall(v_index);
        s=sum(DZXL(u,:).*DZXL(v,:))/(sqrt(sum(DZXL(u,:)))*sqrt(sum(DZXL(v,:))));
        if ~isnan(s)
            SS(v_index)=s;
        end
    end
    [Suv,userindex]=sort(SS,1,'descend');  %Suv是用户的相似度数值
    lenu=3;  %取出S中3个元素
    usersimi=vall(userindex(1:lenu));  %相似的3个用户
    bestsui=-inf;  %用户u与地点i的相似度,也是最终的推荐地点
    tuijian=[];   %最终的推荐地点id
    cv=zeros(3,1);  %用户v的总签到次数
    cityall=[];  %相似的3个用户去过的所有地点城市
    ind=ismember(VarName7,usersimi);
    cityall=unique(VarName8(find(ind==1)));
    for v=1:3  %遍历3个用户
        index=find(VarName7==usersimi(v));
        %cityv=unique(VarName8(index));  %用户v去过的城市集合
        cv(v)=length(index);  %用户v的总签到次数
        %cityall=unique([cityall;cityv]);
    end
    clear index;
    for i=1:length(cityall)  %遍历相似用户去过的城市
        sui=0;
        for v=1:3 %遍历用户
            index=find(VarName7==usersimi(v));
            cvi=sum(ismember(VarName8(index),cityall(i,:)));
            sui=sui+(Suv(v)*cvi/cv(v))/sum(Suv(1:3));
        end
        if sui>bestsui
            bestsui=sui;
            tuijian=cityall(i,:);
        end
    end
    tuijiancity=unique(VarName4(find(VarName1==tuijian)));
    tuijianall(num2str(u))=tuijiancity;
    clear SS;
    toc;
end
3           
    
    
    
        
        
    
