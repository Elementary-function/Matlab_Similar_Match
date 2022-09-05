%% 裁剪函数，将处理后图片中的汉字裁剪为一个一个单独的汉字并放入同一矩阵中
function Characters_Independent = Tailor(Row_start,Column_start,Characters_deal)
k = 1;
for i = Row_start
    for j = Column_start
        Characters_Independent(:,:,k) = Characters_deal(i:i + 55,j:j + 55);
        k = k + 1;
    end
end
end

