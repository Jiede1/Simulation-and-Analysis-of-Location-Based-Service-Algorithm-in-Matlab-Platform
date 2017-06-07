import containers.Map
dict_Map=Map();  %储存最后的用户聚类
dict=[];  %建立集合
u=0;
clusters=1;  %聚类数
alpha=0.3; %阈值,越大，越严格
p_i=0.05;  %阈值，越小，越严格
tic;
while u<10000 
    if ~ismember(u,dict)  %遍历用户并且用户u并不在dict里面  
        Nu_p_i=length(user_interest(num2str(u)))/p_i;  %计算Nu/p_i
        dict=unique([dict,u]);  %将u加入dict里面，装载曾用过的用户
        dict1=u;  %用于装载一个聚类的用户
        %ismember(num2str(u),keys(user_interest)) && 
        if ~ismember('00',user_interest(num2str(u)))  %如果用户u有感兴趣的地方
            inu=user_interest(num2str(u));  %用户u感兴趣的地点
            [x2,y2]=size(inu);
            for index=1:x2
                Ii=length(xileibie_user(inu(index,:)));
                if Ii>Nu_p_i
                    v_all=xileibie_user(inu(index,:));  %Ii中的用户
                    for vindex=1:length(v_all)
                            Nv_p_i=length(user_interest(num2str(v_all(vindex))));  %v_all(vindex)表示用户v
                            if Ii>Nv_p_i  %|Ii|>Nv/p_i
                                %dict1;
                                %v_all(vindex);
                                dict=unique([dict,v_all(vindex)]);
                                dict1=unique([dict1,v_all(vindex)]);
                            end
                    end
                end
            end
            dict_Map(num2str(clusters))=dict1;
            clusters=clusters+1;
        end
        clear dict1;
    end
    u=u+1;
end

while u<20000 
    if ~ismember(u,dict)  %遍历用户并且用户u并不在dict里面  
        Nu_p_i=length(user_interest(num2str(u)))/p_i;  %计算Nu/p_i
        dict=unique([dict,u]);  %将u加入dict里面，装载曾用过的用户
        dict1=u;  %用于装载一个聚类的用户
        %ismember(num2str(u),keys(user_interest)) && 
        if ~ismember('00',user_interest(num2str(u)))  %如果用户u有感兴趣的地方
            inu=user_interest(num2str(u));  %用户u感兴趣的地点
            [x2,y2]=size(inu);
            for index=1:x2
                Ii=length(xileibie_user(inu(index,:)));
                if Ii>Nu_p_i
                    v_all=xileibie_user(inu(index,:));  %Ii中的用户
                    for vindex=1:length(v_all)
                            Nv_p_i=length(user_interest(num2str(v_all(vindex))));  %v_all(vindex)表示用户v
                            if Ii>Nv_p_i  %|Ii|>Nv/p_i
                                %dict1;
                                %v_all(vindex);
                                dict=unique([dict,v_all(vindex)]);
                                dict1=unique([dict1,v_all(vindex)]);
                            end
                    end
                end
            end
            dict_Map(num2str(clusters))=dict1;
            clusters=clusters+1;
        end
        clear dict1;
    end
    u=u+1;
end

while u<30000 
    if ~ismember(u,dict)  %遍历用户并且用户u并不在dict里面  
        Nu_p_i=length(user_interest(num2str(u)))/p_i;  %计算Nu/p_i
        dict=unique([dict,u]);  %将u加入dict里面，装载曾用过的用户
        dict1=u;  %用于装载一个聚类的用户
        %ismember(num2str(u),keys(user_interest)) && 
        if ~ismember('00',user_interest(num2str(u)))  %如果用户u有感兴趣的地方
            inu=user_interest(num2str(u));  %用户u感兴趣的地点
            [x2,y2]=size(inu);
            for index=1:x2
                Ii=length(xileibie_user(inu(index,:)));
                if Ii>Nu_p_i
                    v_all=xileibie_user(inu(index,:));  %Ii中的用户
                    for vindex=1:length(v_all)
                            Nv_p_i=length(user_interest(num2str(v_all(vindex))));  %v_all(vindex)表示用户v
                            if Ii>Nv_p_i  %|Ii|>Nv/p_i
                                %dict1;
                                %v_all(vindex);
                                dict=unique([dict,v_all(vindex)]);
                                dict1=unique([dict1,v_all(vindex)]);
                            end
                    end
                end
            end
            dict_Map(num2str(clusters))=dict1;
            clusters=clusters+1;
        end
        clear dict1;
    end
    u=u+1;
end

while u<40000 
    if ~ismember(u,dict)  %遍历用户并且用户u并不在dict里面  
        Nu_p_i=length(user_interest(num2str(u)))/p_i;  %计算Nu/p_i
        dict=unique([dict,u]);  %将u加入dict里面，装载曾用过的用户
        dict1=u;  %用于装载一个聚类的用户
        %ismember(num2str(u),keys(user_interest)) && 
        if ~ismember('00',user_interest(num2str(u)))  %如果用户u有感兴趣的地方
            inu=user_interest(num2str(u));  %用户u感兴趣的地点
            [x2,y2]=size(inu);
            for index=1:x2
                Ii=length(xileibie_user(inu(index,:)));
                if Ii>Nu_p_i
                    v_all=xileibie_user(inu(index,:));  %Ii中的用户
                    for vindex=1:length(v_all)
                            Nv_p_i=length(user_interest(num2str(v_all(vindex))));  %v_all(vindex)表示用户v
                            if Ii>Nv_p_i  %|Ii|>Nv/p_i
                                %dict1;
                                %v_all(vindex);
                                dict=unique([dict,v_all(vindex)]);
                                dict1=unique([dict1,v_all(vindex)]);
                            end
                    end
                end
            end
            dict_Map(num2str(clusters))=dict1;
            clusters=clusters+1;
        end
        clear dict1;
    end
    u=u+1;
end

while u<50844   %从0开始数，5084个用户
    if ~ismember(u,dict)  %遍历用户并且用户u并不在dict里面  
        Nu_p_i=length(user_interest(num2str(u)))/p_i;  %计算Nu/p_i
        dict=unique([dict,u]);  %将u加入dict里面，装载曾用过的用户
        dict1=u;  %用于装载一个聚类的用户
        %ismember(num2str(u),keys(user_interest)) && 
        if ~ismember('00',user_interest(num2str(u)))  %如果用户u有感兴趣的地方
            inu=user_interest(num2str(u));  %用户u感兴趣的地点
            [x2,y2]=size(inu);
            for index=1:x2
                Ii=length(xileibie_user(inu(index,:)));
                if Ii>Nu_p_i
                    v_all=xileibie_user(inu(index,:));  %Ii中的用户
                    for vindex=1:length(v_all)
                            Nv_p_i=length(user_interest(num2str(v_all(vindex))));  %v_all(vindex)表示用户v
                            if Ii>Nv_p_i  %|Ii|>Nv/p_i
                                %dict1;
                                %v_all(vindex);
                                dict=unique([dict,v_all(vindex)]);
                                dict1=unique([dict1,v_all(vindex)]);
                            end
                    end
                end
            end
            dict_Map(num2str(clusters))=dict1;
            clusters=clusters+1;
        end
        clear dict1;
    end
    u=u+1;
end
toc;