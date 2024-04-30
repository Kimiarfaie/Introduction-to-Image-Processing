clc
clear all
close all
img = imread("Grayscale Image 256x256.jpg");
img = zeropadding(img);
[Gx,Gy,mag] = Imagegradient(img);
figure;imshow(Gx)
title("Gradient in X direction");
% imwrite(Gx,'Grayscale256x256-Gradient in X direction.jpg');
figure;imshow(Gy);
title("Gradient in Y direction");
% imwrite(Gy,'Grayscale256x256-Gradient in Y direction.jpg');
figure;imshow(mag);
title("Gradient magnitude");
% imwrite(mag,'Grayscale256x256-Gradient magnitude.jpg');


