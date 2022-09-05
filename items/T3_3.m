%% 初始化并预设数据
clc;clear
Stroke_average = 9.8;

%% 读取数据
% Chart.mat是附图中视力表中字符在字符库中的位置及笔划总数
% Similarity_1.mat是在T2_1.m中用图123计算出的黑体字两两相似度矩阵
load('Chart.mat');
load('Similarity_1.mat');
Similarity_average = (sum(sum(Similarity_1)) - size(Similarity_1,1))/(size(Similarity_1,1)*(size(Similarity_1,1) - 1));



%% 熵权法计算权重

for i = 1:6
    Data(i) = Similarity_1(Chart(i,1),Chart(i,2));
end

Weight= Entropy_Weight(Chart(:,1:2));

for i = 1:6
    Score(i) = Weight(1)*Data(i)/Similarity_average + Weight(2)*Chart(i,3)/(Stroke_average*2);
end


%% 将得分投影到0.2-1.2区间内
Max = max(Score);
Min = min(Score);

Score_last = (Score - Min)/(Max - Min) + 0.2;
Score = Score';
Score_last = Score_last';

%% 输出结果
Character = Output_4(Chart(:,1:2));
fprintf('         字符一      字符二        难度系数          得分\n');

for i = 1:6
    fprintf('           %c         %c          %f       %f\n',Character(i,1),Character(i,2),Score(i),Score_last(i));
    
end
Similarity_1(1154,3245)
