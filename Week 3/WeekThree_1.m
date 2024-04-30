clc
clear all
close all

%image A
A = imread("Grayscale Image 256x256.jpg");
[A_eq, New_values_A] = HistogramEqualisation(A,255); %new values are the new pixel values instead of 0,1,...,255
hist_A = imagehistogram(A); %for visualizing

%image B
originalimg = imread("Original Image.jpg"); %we want to match A to this B
B = rgb2gray(originalimg);
hist_B = imagehistogram(B); %for visualizing
[B_eq, New_values_B] = HistogramEqualisation(B,255);
%imwrite(B,'Grayscale of Original Image.jpg');

%Match A to B
New = zeros(1,256);
for m=0:255
    n = find(New_values_B == New_values_A(m+1));
    %m=0-255 sre the original pixel values, for value of 0, it will filnd the new value of it in A
    %search through B and find the value, give back its index
    while numel(n) >= 1 %value is found and it's more than one or one
    if numel(n)==1 %only one value found
        New(m+1) = n-1; %take into account indexes of New_values matrices can actually cound as pixel values 
        break
    elseif numel(n)>1 % more than one value is found
        New(m+1) = min(n-1); %put the minimum in New image
        break
    end
    end
    if numel(n) == 0 %if nothing is found
        if m == 0 %if it's for the pixel value of zero
        New(m+1) = 0;
        else %if it's for any other value
        New(m+1) = New(m); %put the previous value
        end
    end
end

%Replace New values with their corresponding value in A
[N, M] = size(A);
for i=1:N
    for j=1:M
        D(i,j) = New(A(i,j)+1);  
    end
end
D = uint8(D);
hist_D = imagehistogram(D);
%imwrite(D,'Matched Image: Grayscale256x256 to GrayscaleOgiginal.jpg');


% plot
f = figure();
subplot(3,2,1);
imshow(A)
title("A: GrayscaleImage 256x256");
subplot(3,2,2);
bar(hist_A,0.3)
title("Histogram of GrayscaleImage 256x256")
subplot(3,2,3)
imshow(B)
title("B: Grayscale of Original Image");
subplot(3,2,4);
bar(hist_B,0.3)
title("Histogram of Grayscale of Original Image")
subplot(3,2,5);
imshow(D)
title("Image: A matched to B")
subplot(3,2,6);
bar(hist_D,0.3);
title("Histogram: A matched to B")
%saveas(gcf,'Histogram Matching Week 3.png');
