%% 初始化并预设数据
clc;clear
Stroke_average = 9.8;

%% 计算平均相似度
% Similarity_1.mat是在T2_1.m中计算出的两两相似度矩阵
% Data.mat是在T3_1.m中算得的相似字符组手动除重后与其的总笔划数
load('Similarity_1.mat');
load('Data.mat');
Similarity_average = (sum(sum(Similarity_1)) - size(Similarity_1,1))/(size(Similarity_1,1)*(size(Similarity_1,1) - 1));

%% 计算得分

% 熵权法确定权重
Weight= Entropy_Weight(Data(:,1:2));


for i = 1:20
    Score(i) = Weight(1)*Data(i,1)/Similarity_average + Weight(2)*Data(i,2)/(Stroke_average*3);
end


%% 将得分投影到0.2-1.2区间内
Max = max(Score);
Min = min(Score);

Score_last = (Score - Min)/(Max - Min) + 0.2;
Score = Score';
Score_last = Score_last';

%% 输出结果

fprintf('         字符一    字符二    字符三        难度系数          得分\n');

for i = 1:20
    fprintf('           %c        %c       %c          %f       %f\n',Data(i,3),Data(i,4),Data(i,5),Score(i),Score_last(i));
    
end









