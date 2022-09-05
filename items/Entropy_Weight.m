%% 熵权法计算数据权重

function Weight= Entropy_Weight(Data)
% 读取数据大小，确定权重的数量
[n,m] = size(Data);
Weight = zeros(1,m);
Entropy = zeros(1,m);
%% 计算权重
% 数据标准化
Data_Standardized = zeros(size(Data));
Data_Standardized_1 = zeros(size(Data));
for i = 1:m
    for j = 1:n
        Data_Standardized(j,i) = (Data(j,i) - min(Data(:,i)))/(max(Data(:,i)) - min(Data(:,i)));
    end
end
for i = 1:m
    for  j = 1:n
        Data_Standardized_1(j,i) = Data_Standardized(j,i)/mean(Data_Standardized(:,i));
    end
end
% 计算数据信息熵

for j = 1:m
    for i = 1:n
        if Data_Standardized_1(i,j) ~= 0
            Entropy(j) = Entropy(j) + log(Data_Standardized_1(i,j)) * Data_Standardized_1(i,j);
        end
    end
end

Entropy = -Entropy/log(n);

% 计算权重
for i = 1:m
    Weight(1,i) = (1 - Entropy(i))/(m - sum(Entropy));
end

Weigth = Weight';

end

