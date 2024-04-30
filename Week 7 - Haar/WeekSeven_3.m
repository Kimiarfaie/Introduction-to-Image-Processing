clc
clear all
close all
I=im2gray(imread("Grayscale Image 256x256.jpg"));
I=im2double(I);
OriginalI = I;

% Haar
for l=1:4 %four levels
[rows,cols]=size(I);
for i=1:rows %horizonta haar
    %go though each row, calculate + and - for each element and the neighbouring 
    addition = (I(i, 1:2:end) + I(i, 2:2:end)) / 2; %odd and even pixels
    difference = (I(i, 2:2:end) - I(i, 1:2:end)) / 2; 
    I(i, 1:rows) = [addition, difference]; 
    %add is low frequency, diff is high freq
end
for j=1:cols %vertical haar
    addition = (I(1:2:end,j) + I(2:2:end,j)) / 2;
    difference = (I(1:2:end,j) - I(2:2:end,j)) / 2;
    I(1:cols, j) = [addition; difference];
end
rows=rows/2;
cols=cols/2;
figure;
imshow(I);
imgs(:,:,l) = I; %store all the images in a imgs matrix
end

%%
for l=1:4
    img = inverseHaarlevels(imgs(:,:,l),l); %each time the image goes into haarinverse the low frequencies are chosen and other things set to zero
    figure;
    imshow(img);
    mse(:,l) = immse(img,OriginalI);
    ps(:,l) = psnr(img,OriginalI);
    rm(:,l) = rmse(img(:),OriginalI(:));
end

% Plot Errors
x = 1:1:4;
figure;
plot(x,mse);
xlabel("Haar levels");
ylabel("MSE");
set(gca,'xtick',1:4);
saveas(gcf,"IMMSE haar.png");
figure;
plot(x,ps);
xlabel("Haar levels");
ylabel("PSNR");
set(gca,'xtick',1:4);
saveas(gcf,"PSNR haar.png");
figure;
plot(x,rm);
xlabel("Haar levels");
ylabel("RMSE");
set(gca,'xtick',1:4);
saveas(gcf,"RMSE haar.png");
