clc
clear all
close all
I = im2gray(imresize(imread("Image - 2230x2230.jpg"),[1024,1024]));
I = im2double(I);
I256 = imread("Grayscale Image 256x256.jpg");
I256 = im2double(I256);


% Average
I_ave = zeros(256,256);
window = 1024/256; %size of the window that is sliding through the image 4x4

for i=1:window:1024
    for j=1:window:1024
        submatrix = I(i:i+3,j:j+3);
        % calculate average 
        ave = mean(submatrix(:));
        % index in the resized image
        rowindex = ceil(i/4);
        colindex = ceil(j/4);
        I_ave(rowindex, colindex) = ave;
    end
end
SSIM_ave = ssim(I256,I_ave);
figure;imshow(I_ave);
% imwrite(I_ave,"Resize average.png");
%% Having only pixels with odd indexes
m =1; n=1;
I_n = zeros(1024/2,1024/2);
for i=1:2:1024 %going row by row
    for j=1:2:1024
        I_n(m,n) = I(i,j); %in first loop, m is 1 and we are writing every pixel in first row
        n = n+1;
    end
    m=m+1; %go to next row
    n=1; %is again set to 1 becsuse in each row we are starting from the first index
end
I_m = zeros(512/2,512/2);
k = 1; l=1;
%doing it again
for i=1:2:512 %going row by row
    for j=1:2:512
        I_m(k,l) = I_n(i,j);
        l = l+1;
    end
    k=k+1;
    l=1;
end
SSIM_m = ssim(I256,I_m);
figure;imshow(I_m);
% imwrite(I_m,"Resize oddpixels.png");

%% Median
I_med = zeros(256,256);
window = 1024/256; %size of the window that is sliding through the image 4x4

for i=1:window:1024
    for j=1:window:1024
        submatrix = I(i:i+3,j:j+3);
        % calculate median 
        med = median(submatrix,'all');
        %index in the resized image
        rowindex = ceil(i/4);
        colindex = ceil(j/4);
        I_med(rowindex, colindex) = med;
    end
end
SSIM_med = ssim(I256,I_med);
figure;imshow(I_med);
% imwrite(I_med,"Resize median.png");


