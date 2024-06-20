% 数据点
x = [129, 140, 103.5, 88, 185.5, 195, 105, 157.5, 107.5, 77, 81, 162, 162, 117.5];
y = [7.5, 141.5, 23, 147, 22.5, 137.5, 85.5, -6.5, -81, 3, 56.5, -66.5, 84, -33.5];
z = [4, 8, 5, 8, 7, 8, 8, 9, 9, 8, 8, 9, 4, 9];

% 创建矩形区域
xlim = [75, 200];
ylim = [-50, 150];

% 绘制海底曲面图
figure;
scatter3(x, y, z, 50, z, 'filled');
hold on;

% 生成网格点
[xq, yq] = meshgrid(linspace(xlim(1), xlim(2), 100), linspace(ylim(1), ylim(2), 100));

% 插值计算网格点上的z值
zq = griddata(x, y, z, xq, yq, 'cubic');

% 绘制曲面
surf(xq, yq, zq);
shading interp;
colorbar;
title('海底曲面图');
xlabel('x');
ylabel('y');
zlabel('z');

% 绘制船的吃水深度的等高线
hold on;
contour3(xq, yq, zq, [6 6], 'r', 'LineWidth', 2);

% 找到需要避免的区域
avoid_x = xq(zq < 6);
avoid_y = yq(zq < 6);

% 在图中标记需要避免的区域
plot3(avoid_x, avoid_y, repmat(6, size(avoid_x)), 'r*');
hold off;

% 显示需要避免的区域
disp('需要避免进入的区域 (x, y):');
avoid_coords = [avoid_x(:), avoid_y(:)];
disp(avoid_coords);