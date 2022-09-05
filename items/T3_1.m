%% 初始化
clc;clear

%% 读取已知数据
% Similarity_1.mat是在T2_1.m中计算出的两两相似度矩阵
load('Similarity_1.mat');

%% 处理数据
Similarity_tmp = sort(Similarity_1);
% 预设矩阵
Similarity_tmp_1 = zeros(6,size(Similarity_tmp,1));

Similarity_tmp_1(1:2,:) = Similarity_tmp(size(Similarity_tmp_1,2)-2:size(Similarity_tmp_1,2)-1,:);
Similarity_tmp_1(3,:) = mean(Similarity_tmp(size(Similarity_tmp_1,2)-2:size(Similarity_tmp_1,2)-1,:));
for i = 1:size(Similarity_tmp,1)
    Similarity_tmp_1(6,i) = i;
end
k = 1;
l = 1;
for i = 1:size(Similarity_1,1)
    % 判断是否有相似度相等的字符组，如果有，则记录下来，
    if size(find(Similarity_1(i,:) == Similarity_tmp_1(1,i)),2) > 1
        record_1(k,1) = i;
        record_1(k,2) = size(find(Similarity_1(i,:) == Similarity_tmp_1(1,i)),2);
        k = k + 1;
    end
    if size(find(Similarity_1(i,:) == Similarity_tmp_1(2,i)),2) > 1
        record_2(l,1) = i;
        record_2(l,2) = size(find(Similarity_1(i,:) == Similarity_tmp_1(2,i)),2);
        l = l + 1;
    end
    % 只取第一个相似度相等的字符组
    Similarity_tmp_1(4,i) = find(Similarity_1(i,:) == Similarity_tmp_1(1,i),1);
    Similarity_tmp_1(5,i) = find(Similarity_1(i,:) == Similarity_tmp_1(2,i),1);
end

Similarity_tmp_1 = Similarity_tmp_1';
Similarity_tmp_1 = sortrows(Similarity_tmp_1,3);

%% 输出结果
Result = Output_2(Similarity_tmp_1);
fprintf('      字符一     字符二     字符三     平均相似度\n')
for i = 1:100
    fprintf('        %c        %c         %c        %f\n',Result(i,1),Result(i,2),Result(i,3),Result(i,4));
end


