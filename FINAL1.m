%第一题
A=[3 0 -2 1;-1 3 0 -2;-2 -2 3 0;-1 2 3 1]
B=A(1:3,2:4)
%行列式
det(B)
%秩
rank(B)
%逆矩阵
inv(B)
%取出B中第1、2、4个元素
B([1,2,4])