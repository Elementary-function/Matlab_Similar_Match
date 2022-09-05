%% 初始化
clc;clear

%% 读取数据
% Similarity_1.mat是在T2_1.m中用图123计算出的黑体字两两相似度矩阵
% Similarity_2.mat是在T2_1.m中用图456计算出的宋体字两两相似度矩阵
load('Similarity_1.mat');
load('Similarity_2.mat');

%% 随机选取对比矩阵中的元素
% 由于选取元素是随机的，所以每次的输出结果大概率不同
Rows = randi(size(Similarity_1,1),1,100);
Columns = randi(size(Similarity_1,1),1,100);
k = 1;
Similarity_Contrast = zeros(100,2);

for i = 1:100
        Similarity_Contrast(k,1) = Similarity_1(Rows(i),Columns(i));
        Similarity_Contrast(k,2) = Similarity_2(Rows(i),Columns(i));
        k = k + 1;
end
% 计算相对误差
Error = (Similarity_Contrast(:,2) - Similarity_Contrast(:,1))./Similarity_Contrast(:,1);

% 计算平均误差
for i = 1:10
    Error_average(i) = mean(Error(10*(i-1)+1:10*i));
end
fprintf('其10组的平均误差为：\n')
fprintf('                    %f\n',Error_average)
