function [Gx,Gy,mag]=Imagegradient(img)
%input img should be a padded image
Sx = [-1,0,1;-2,0,2;-1,0,1];
Sy = [-1,-2,-1;0,0,0;1,2,1];
Gx = ApplyFilter(img,Sx);
Gy = ApplyFilter(img,Sy);
Gx = uint8(Gx);
Gy = uint8(Gy);
% mag = uint8(mag);
mag=sqrt(im2double(Gx).^2+im2double(Gy).^2);
end