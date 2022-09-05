%% 初始化
tic;
clc;clear
% 请及时更新文件路径   % 请及时更新文件路径   % 请及时更新文件路径   % 请及时更新文件路径

%% 读取数据
% 读取图片像素信息
% 请及时更新文件路径

% 请及时更新文件路径  % 请及时更新文件路径  % 请及时更新文件路径  % 请及时更新文件路径 
Characters_1 = imread('D:\系统文件\桌面\支撑材料\图1.png');       % 请及时更新文件路径     
Characters_2 = imread('D:\系统文件\桌面\支撑材料\图2.png');        % 请及时更新文件路径    
Characters_3 = imread('D:\系统文件\桌面\支撑材料\图3.png');       % 请及时更新文件路径
% 请及时更新文件路径  % 请及时更新文件路径  % 请及时更新文件路径  % 请及时更新文件路径



Characters_1_deal = Dispose(Characters_1);
Characters_2_deal = Dispose(Characters_2);
Characters_3_deal = Dispose(Characters_3);


%% 识别白边，确定汉字范围

[Row_1_start,Column_1_start] = Scope(Characters_1_deal);
[Row_2_start,Column_2_start] = Scope(Characters_2_deal);
[Row_3_start,Column_3_start] = Scope(Characters_3_deal);

%% 裁剪汉字并组合在同一向量中

Characters_1_Independent = Tailor(Row_1_start,Column_1_start,Characters_1_deal);
Characters_2_Independent = Tailor(Row_2_start,Column_2_start,Characters_2_deal);
Characters_3_Independent = Tailor(Row_3_start,Column_3_start,Characters_3_deal);
Character_Independent = cat(3,Characters_1_Independent,Characters_2_Independent,Characters_3_Independent);

%% 计算相似度
% 初始化相似度矩阵
Similarity = zeros(size(Character_Independent,3),size(Character_Independent,3));
for l = 1:size(Character_Independent,3)
    for k = 1:size(Character_Independent,3)
        for i = 1:56
            for j = 1:56
                if Character_Independent(i,j,l) == Character_Independent(i,j,k)
                    Similarity(l,k) = Similarity(l,k) + 1;
                end  
            end
        end
    end
end

%% 处理相似度矩阵
% 初始化相似度排序矩阵
Similarity_sorting = zeros(size(Character_Independent,3)*size(Character_Independent,3),3);
Similarity = Similarity/(56*56);
% 将二维矩阵降维
Similarity_tmp = Similarity(:);
k = 1;
% 对数字重新编号
for i = 1:size(Character_Independent,3)
    for j = 1:size(Character_Independent,3)
        Similarity_tmp(k,2) = i;
        Similarity_tmp(k,3) = j;
        k = k + 1;
    end
end
% 开始排序
Similarity_sorting = sortrows(Similarity_tmp,1);

%% 选取前20组最优解
k = 1;
Optimal_Solution = zeros(20,3);
for i = size(Similarity_sorting,1):-1:1
    if Similarity_sorting(i,1) ~= 1
        if Similarity_sorting(i,1) == Similarity_sorting(i-1,1)
            continue;
        end
        Optimal_Solution(k,:) = Similarity_sorting(i,:);
        k = k + 1;
    end
    if k > 20
        break;
    end
end

%% 输出结果

Result = Output_1(Optimal_Solution(:,2:3));
fprintf('      所选取的前20组最优解为：\n');
fprintf('                字符一      字符二       相似度\n');

for i = 1:20
    fprintf('                  %c          %c        %f\n',Result(i,1),Result(i,2),Optimal_Solution(i,1));
    
end
toc;
