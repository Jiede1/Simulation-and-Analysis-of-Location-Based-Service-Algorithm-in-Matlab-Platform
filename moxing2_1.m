tic;
import containers.Map
xileibie_user=Map()  %相当于论文的I_i
user_interest=Map()   %用户感兴趣的细类别
alpha=0.2; %阈值,越大，越严格
p_i=0.05;  %阈值，越小，越严格
for u=0:10000
    user_index=find(VarName7==u);  %在train文件中用户u所占那些行
    N=sum(VarName9(user_index));  %用户u的总访问数
    cities_id=VarName8(user_index);  %用户u去过的城市id名集合
    [duiying1,duiying]=ismember(cities_id,VarName1);  %找到用户u的对应行下标
    duiying(duiying==0) = []; %去掉哪些用户u没去过的地方
    hang=VarName6(duiying);%用户u对应VarName6的行
    xileibie=unique(hang); %用户u去过的细类别
    p=tabulate(hang);  %统计各元素出现的频率
    p1=char(p(:,1));
    p3=cell2mat(p(:,3));
    p_index=find(p3>N*alpha);  %用户u感兴趣的地点小标
    [x,y]=size(p_index);
    if x>0&&y==1
        num2str(u)
        user_interest(num2str(u))=p1(p_index,:);  %用户u感兴趣的地方
        g=p1(p_index,:);
        %len=length(g)
        [x1,y1]=size(g);
        for k=1:x1
            if ~ismember(g(k,:),keys(xileibie_user))
                xileibie_user(g(k,:))=u;  
            else
                xileibie_user(g(k,:))=unique([xileibie_user(g(k,:));u]);
            end
        end
    else
        user_interest(num2str(u))='00';
    end 
    clear user_index;
    clear cities_id;
    clear duiying1;
    clear hang;
    clear xileibie;
    clear p_index;
end

for u=10001:20000
    user_index=find(VarName7==u);  %在train文件中用户u所占那些行
    N=sum(VarName9(user_index));  %用户u的总访问数
    cities_id=VarName8(user_index);  %用户u去过的城市id名集合
    [duiying1,duiying]=ismember(cities_id,VarName1);  %找到用户u的对应行下标
    duiying(duiying==0) = []; %去掉哪些用户u没去过的地方
    hang=VarName6(duiying);%用户u对应VarName6的行
    xileibie=unique(hang); %用户u去过的细类别
    p=tabulate(hang);  %统计各元素出现的频率
    p1=char(p(:,1));
    p3=cell2mat(p(:,3));
    p_index=find(p3>N*alpha);  %用户u感兴趣的地点小标
    [x,y]=size(p_index);
    if x>0&&y==1
        user_interest(num2str(u))=p1(p_index,:);  
        g=p1(p_index,:);
        %len=length(g)
        [x1,y1]=size(g);
        for k=1:x1
            if ~ismember(g(k,:),keys(xileibie_user))
                xileibie_user(g(k,:))=u;
            else
                xileibie_user(g(k,:))=unique([xileibie_user(g(k,:));u]);
            end
        end
    else
        user_interest(num2str(u))='00';
    end 
    clear user_index;
    clear cities_id;
    clear duiying1;
    clear hang;
    clear xileibie;
    clear p_index;
end

for u=20001:30000
    user_index=find(VarName7==u);  %在train文件中用户u所占那些行
    N=sum(VarName9(user_index));  %用户u的总访问数
    cities_id=VarName8(user_index);  %用户u去过的城市id名集合
    [duiying1,duiying]=ismember(cities_id,VarName1);  %找到用户u的对应行下标
    duiying(duiying==0) = []; %去掉哪些用户u没去过的地方
    hang=VarName6(duiying);%用户u对应VarName6的行
    xileibie=unique(hang); %用户u去过的细类别
    p=tabulate(hang);  %统计各元素出现的频率
    p1=char(p(:,1));
    p3=cell2mat(p(:,3));
    p_index=find(p3>N*alpha);  %用户u感兴趣的地点小标
    [x,y]=size(p_index);
    if x>0&&y==1
        user_interest(num2str(u))=p1(p_index,:);  
        g=p1(p_index,:);
        %len=length(g)
        [x1,y1]=size(g);
        for k=1:x1
            if ~ismember(g(k,:),keys(xileibie_user))
                xileibie_user(g(k,:))=u;
            else
                xileibie_user(g(k,:))=unique([xileibie_user(g(k,:));u]);
            end
        end
    else
        user_interest(num2str(u))='00';
    end 
    clear user_index;
    clear cities_id;
    clear duiying1;
    clear hang;
    clear xileibie;
    clear p_index;
end

for u=30001:40000
    user_index=find(VarName7==u);  %在train文件中用户u所占那些行
    N=sum(VarName9(user_index));  %用户u的总访问数
    cities_id=VarName8(user_index);  %用户u去过的城市id名集合
    [duiying1,duiying]=ismember(cities_id,VarName1);  %找到用户u的对应行下标
    duiying(duiying==0) = []; %去掉哪些用户u没去过的地方
    hang=VarName6(duiying);%用户u对应VarName6的行
    xileibie=unique(hang); %用户u去过的细类别
    p=tabulate(hang);  %统计各元素出现的频率
    p1=char(p(:,1));
    p3=cell2mat(p(:,3));
    p_index=find(p3>N*alpha);  %用户u感兴趣的地点小标
    [x,y]=size(p_index);
    if x>0&&y==1
        user_interest(num2str(u))=p1(p_index,:);  
        g=p1(p_index,:);
        %len=length(g)
        [x1,y1]=size(g);
        for k=1:x1
            if ~ismember(g(k,:),keys(xileibie_user))
                xileibie_user(g(k,:))=u;
            else
                xileibie_user(g(k,:))=unique([xileibie_user(g(k,:));u]);
            end
        end
    else
        user_interest(num2str(u))='00';
    end 
    clear user_index;
    clear cities_id;
    clear duiying1;
    clear hang;
    clear xileibie;
    clear p_index;
end

for u=40001:50843
    user_index=find(VarName7==u);  %在train文件中用户u所占那些行
    N=sum(VarName9(user_index));  %用户u的总访问数
    cities_id=VarName8(user_index);  %用户u去过的城市id名集合
    [duiying1,duiying]=ismember(cities_id,VarName1);  %找到用户u的对应行下标
    duiying(duiying==0) = []; %去掉哪些用户u没去过的地方
    hang=VarName6(duiying);%用户u对应VarName6的行
    xileibie=unique(hang); %用户u去过的细类别
    p=tabulate(hang);  %统计各元素出现的频率
    p1=char(p(:,1));
    p3=cell2mat(p(:,3));
    p_index=find(p3>N*alpha);  %用户u感兴趣的地点小标
    [x,y]=size(p_index);
    if x>0&&y==1
        user_interest(num2str(u))=p1(p_index,:);  
        g=p1(p_index,:);
        %len=length(g)
        [x1,y1]=size(g);
        for k=1:x1
            if ~ismember(g(k,:),keys(xileibie_user))
                xileibie_user(g(k,:))=u;
            else
                xileibie_user(g(k,:))=unique([xileibie_user(g(k,:));u]);
            end
        end
    else
        user_interest(num2str(u))='00';
    end 
    clear user_index;
    clear cities_id;
    clear duiying1;
    clear hang;
    clear xileibie;
    clear p_index;
end

toc;

