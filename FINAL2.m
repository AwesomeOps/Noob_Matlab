%第二题 y=x^3-x-1,x∈[1,2]
f=@(x)x.^3-x-1
%绘制函数图像
fplot(f,[1,2])
%二分法求根
fl=f(1)
fr=f(2)
while(fr-fl>0.01&&f(fr)*f(fl)<0)
    mid=0.5*(fl+fr);
    if mid>0
        fr=mid;
    elseif mid<0
        fl=mid;
    else
        break;
    end
end
disp(f(mid))