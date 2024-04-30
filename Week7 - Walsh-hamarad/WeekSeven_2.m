clc
clear all
close all

% Apply Walsh-Hadamard transform on image
I = imread("Grayscale Image 256x256.jpg");
I = double(I);
whtc = fwht(I); %column wise
whtr = fwht(whtc'); %row wise
y = whtr'; %walsh hadamard transform
% figure;imshow(y);

% Image Reconstruction
n = size(y,1);
newy = zeros(n); 
for i=1:n %we only use left upper corner regions, so only a square in a zero matrix
newy(1:i,1:i) = y(1:i,1:i); %the square
iwhtc = ifwht(newy); %column
iwhtr = ifwht(iwhtc'); %row
reconstructedImage = iwhtr';
% reconstructedImage = uint8(reconstructedImage);
mse(i) = immse(reconstructedImage,I);
ps(i) = psnr(reconstructedImage,I);
temp1 = im2double(reconstructedImage);
temp2 = im2double(I);
rm(i) = rmse(temp1(:),temp2(:));
end

% Plots

% figure;
plot(mse);
xlabel("Width of selected square in Walsh-Hadamard transform");
ylabel("MSE");
xlim([0 256]);
saveas(gcf,"IMMSE WH.png");
figure;
plot(ps);
xlabel("Width of selected square in Walsh-Hadamard transform");
ylabel("PSNR");
xlim([0 256]);
saveas(gcf,"PSNR WH.png");
figure;
plot(rm);
xlabel("Width of selected square in Walsh-Hadamard transform");
ylabel("RMSE");
xlim([0 256]);
saveas(gcf,"RMSE WH.png");




