tic;
import containers.Map
xileibie_user=Map()  %相当于论文的I_i
user_interest=Map()   %用户感兴趣的细类别
alpha=0.5; %阈值,越大，越严格
p_i=0.05;  %阈值，越小，越严格
for u=0:50843  %遍历用户数，共有50844位用户
    tic;
    user_xileibie=Map();  %建立一个用户u映射到细类别访问量的映射Map
    user_index=find(VarName7==u);  %在train文件中用户u所占那些行
    N=sum(VarName9(user_index));  %用户u的总访问数
    cities_id=VarName8(user_index);  %用户u去过的城市id名集合
    for i=1:length(cities_id)           %遍历用户u去过的城市id名集合
        t=find(VarName1==cities_id(i));  %找出城市id的对应行
        xileibie=VarName6(t);   %用户u访问的城市的细类别名字
        xileibie=char(xileibie);
        if u==0 && i==1   %如果是第一次要更新xileibie_user
            xileibie_user(xileibie)=u;                    %sum(cellfun(@(x)isequal(x,{u}),values(xileibie_user)))
        elseif ismember(xileibie,keys(xileibie_user)) &&  sum(cellfun(@(x)isequal(x,u),values(xileibie_user))) %如果xileibie_user已经存在键xileibie，不加key了
            xileibie_user(xileibie)=[xileibie_user(xileibie);u];  %%%这可能非常耗时间
            xileibie_user(xileibie)=unique(xileibie_user(xileibie));
        else  %如果xileibie_user不存在键xileibie
            xileibie_user(xileibie)=u;
        end
        city=VarName4(t);    %城市id对应的城市名字
        if ismember(xileibie,keys(user_xileibie))
            user_xileibie(xileibie)=user_xileibie(xileibie)+VarName9(i);  %用户u访问细类别的次数.因为访问一个城市多少次就意味着访问细类别多少次
        else
            user_xileibie(xileibie)=VarName9(i);
        end   
    end

    for i=1:length(cities_id)           %遍历用户u去过的城市id名集合
        t=find(VarName1==cities_id(i));  %找出城市id的对应行
        xileibie=VarName6(t);   %用户u访问的城市的细类别名字
        xileibie=char(xileibie);
        if user_xileibie(xileibie)>N*alpha
            u=num2str(u); %用户u
            if ~sum(cellfun(@(x)isequal(x,u),keys(user_interest)))  %用户u没有被user_interest收录
                1;
                xileibie;
                user_interest(u)=xileibie;
            elseif ~ismember(xileibie,user_interest(u))
                2;
                user_interest(u)=[user_interest(u);xileibie];
                %user_interest(u)=unique(user_interest(u));
            end
        end
    end
    clear user_xileibie;
    clear cities_id;
    clear user_index;
    clear N;
    toc;
end
3
dict_Map=Map();  %最终聚类效果
dict=[];  %建立集合
u=0;
clusters=1;  %聚类数
key=keys(xileibie_user);
while u<50843
    if ~ismember(u,dict)  %遍历用户并且用户u并不在dict里面   
        a=length(user_interest(num2str(u)))/p_i;  %计算Nu/p_i
        dict=unique([dict,u]);  %将u加入dict里面，装载曾用过的用户
        dict1=u;  %用于装载一个聚类的用户
        parfor i=1:length(xileibie_user)  %遍历Ii
            if length(xileibie_user(char(key(i))))>=a && ismember(u,xileibie_user(char(key(i))))  %如果|Ii|>Nu/p_i,且u在Ii里面
                b=xileibie_user(char(key(i)));  %Ii中的用户
                for vindex=1:length(b)
                    lenv=length(user_interest(num2str(b(vindex))));  %b(vindex)表示用户v
                    if lenv/p_i<=length(xileibie_user(char(key(i))))  %|Ii|>Nv/p_i
                        dict=unique([dict;b(vindex)]);
                        dict1=unique([dict;b(vindex)]);
                    end
                end
            end
        end
        dict_Map(num2str(clusters))=dict1;
        clusters=clusters+1;
        clear dict1;
    end
    u=u+1;
end
toc;



    
    
