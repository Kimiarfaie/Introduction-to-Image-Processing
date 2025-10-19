clc
clear all
close all

addpath('../Functions');

% Histogram of Image using imagehistogram.m func
img = imread('Grayscale Image 256x256.jpg');
h = imagehistogram(img);
figure;
x = 0:255;
bar(x,h,0.3);
title("Histogram of original image");
%saveas(gcf,'Histogram rayscaleImage256x256.png');

% Normalizing the Image using NormalizeImage.m func
img1 = NormalizeImage(img);
figure;imshow(img1);
title('normalized image');
%imwrite(img1,'Normalized GrayscaleImage256x256.jpg');
D = imabsdiff(img,img1);
figure;imshow(D);title("difference of normalized and original image")
%imwrite(D,"diffnormalized.png");

% Apply Histogram equalization on Image
[img_Eq,New_values] = HistogramEqualisation(img,255);
%imwrite(img_Eq,'Equalized GrayscaleImage256x256.jpg');
D1 = imabsdiff(img,img_Eq);
figure;imshow(img_Eq);
title("equalized image");
%imwrite(D1,"diffequalized.png");

heq = imagehistogram(img_Eq);
figure;
bar(x,heq,0.3);
title("Histogram of equlized image");
%saveas(gcf,'Equalized Histogram rayscaleImage256x256.png');
