%% 处理数据函数

function  Characters_deal = Dispose(Characters)
% 三维矩阵降维
Characters(:,:,2) = [];
Characters(:,:,2) = [];     

% 读取图片对比度阈值
level = graythresh(Characters);

% 像素矩阵二值化
Characters_deal=imbinarize(Characters,level);

end

