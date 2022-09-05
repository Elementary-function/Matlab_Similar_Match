%% 确定范围函数

function [Row_start,Column_start] = Scope(Characters_deal)
% 获取像素向量的大小
[n,m] = size(Characters_deal);

% 按行确定白边 并确定每个字开始的行数
k = 1;
for i = 1:n 
    if Characters_deal(i,:) == 1
        Row_write(k) = i;
        k = k + 1;
    end
end
k = 1;
for i = 2:length(Row_write)
    if Row_write(i) - Row_write(i-1) ~= 1
        Row_start(k) = Row_write(i-1) + 1;
        k = k + 1;
    end
end

% 按列确定白边 并确定每个字开始的列数
k = 1;
for i = 1:m
    if Characters_deal(:,i) == 1
        Column_write(k) = i;
        k = k + 1;
    end
end
k = 1;
for i = 2:length(Column_write)
    if Column_write(i) - Column_write(i-1) ~= 1
        Column_start(k) = Column_write(i-1) + 1;
        k = k + 1;
    end
end
end

