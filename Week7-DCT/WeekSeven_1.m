clc
clear all
close all

% Apply Discrete cosine transform on image
I = imread("Grayscale Image 256x256.jpg");
y = dct2(I);

% Plot DCT
figure;
subplot(1,2,1)
imshow("Grayscale Image 256x256.jpg");
title("Original Image");
subplot(1,2,2)
imshow(y);
title("DCT");
% saveas(gcf,"DCT.png")

% Image Reconstruction
n = size(y,1);
newy = zeros(n);
for i=1:n %we are only choosing rows and columns of the DCT from 1 pixel to 256, and replace it in a zero matrix 
newy(i, :) = y(i, :); %selected row
newy(:, i) = y(:, i); %selected column
reconstructedImage = uint8(idct2(newy)); %inverse
mse(i) = immse(reconstructedImage,I);
ps(i) = psnr(reconstructedImage,I);
temp1 = im2double(reconstructedImage);
temp2 = im2double(I);
rm(i) = rmse(temp1(:),temp2(:));
end

% Plots

figure;
plot(mse);
xlabel("Number of Pixels selected in rows and columns of DCT");
ylabel("MSE");
saveas(gcf,"IMMSE DCT.png");
figure;
plot(ps);
xlabel("Number of Pixels selected in rows and columns of DCT");
ylabel("PSNR");
saveas(gcf,"PSNR DCT.png");
figure;
plot(rm);
xlabel("Number of Pixels selected in rows and columns of DCT");
ylabel("RMSE");
% saveas(gcf,"RMSE DCT.png");
%%

% Visualizing Choosing part of the DCT 

% n = size(y,1);
% new = zeros(n);
% for i=1:20 %we are only choosing rows and columns of the DCT from 1 pixel to 256, and replace it in a zero matrix 
% new(i, :) = y(i, :); %selected row
% new(:, i) = y(:, i); %selected column
% reconstructedImage2 = uint8(idct2(new)); %inverse
% end
% subplot(1,3,1)
% imshow("Grayscale Image 256x256.jpg");
% title("Original Image");
% subplot(1,3,2)
% imshow(new);
% title("Selected low frequncy DCT - 80 pixels");
% subplot(1,3,3)
% imshow(reconstructedImage2);
% title("Reconstructed Image");


