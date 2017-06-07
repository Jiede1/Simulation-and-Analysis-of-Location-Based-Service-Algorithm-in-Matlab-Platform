function [y] = distance_similarity(LAT1,LON1,LAT2,LON2,alpha)
%计算球面距离
%ELLIPSOID=6378.137,地球半径，这是个不变的参数
%LAT1,LON1,LAT2,LON2就是经纬度
%alpha为调优参数
p= distance(LAT1,LON1,LAT2,LON2,6378.137);
y=1/(p^alpha+1);
%y=1/(p^alpha+1);
end

