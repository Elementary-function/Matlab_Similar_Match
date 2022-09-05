%% 初始化
clc;clear

%% 读取数据
% Similarity_1.mat是在T2_1.m中用图123计算出的黑体字两两相似度矩阵
% Similarity_2.mat是在T2_1.m中用图456计算出的宋体字两两相似度矩阵
load('Similarity_1.mat');
load('Similarity_2.mat');

%% 随机选取对比矩阵中的元素
% 由于选取元素是随机的，所以每次的输出结果大概率不同
Rows = randi(size(Similarity_1,1),1,20);
Columns = randi(size(Similarity_1,1),1,20);
k = 1;
Similarity_Contrast = zeros(20,2);
for i = 1:20
        Similarity_Contrast(k,1) = Similarity_1(Rows(i),Columns(i));
        Similarity_Contrast(k,2) = Similarity_2(Rows(i),Columns(i));
        k = k + 1;
end
% 计算相对误差
Error = (Similarity_Contrast(:,2) - Similarity_Contrast(:,1))./Similarity_Contrast(:,1);
%% 输出结果
Result = zeros(20,5);
Result(:,3:4) = Similarity_Contrast;
Result(:,5) = Error;

Result(:,1:2) = Output_3(Rows,Columns);

fprintf('       字符一  字符二   字符在黑体下的相似度  字符在宋体下的相似度    相似度误差\n');

for i = 1:20
    fprintf('         %c      %c        %f            %f            %f\n',Result(i,1),Result(i,2),Result(i,3),Result(i,4),Result(i,5));
    
end
