clc
clear all
close all
A = imread("Grayscale Image 256x256.jpg");
[A_eq, New_values_A] = HistogramEqualisation(A,255);
hist_A = imagehistogram(A);

% Create a random histogram C, and match A to it 
rng(1);
hist_C = round(rand(1,256)*100); %rand gives values of 0-1 so by multiplying by 100 

%randomCounts = randi([0, 1000], 1, numIntensityLevels); could use this

%Histogram Equalization for C, didn't use function cause mine is on image
hist_normC = hist_C/(sum(hist_C,'all'));
histc = cumulativeprobfunc(hist_normC);
New_values_C = floor(255*histc);

%Match A to C
New = zeros(1,256);
for m=0:255
    n = find(New_values_C == New_values_A(m+1)); 
    while numel(n) >= 1 
    if numel(n)==1 
        New(m+1) = n-1; 
        break
    elseif numel(n)>1 
        New(m+1) = min(n-1);
        break
    end
    end
    if numel(n) == 0
        if m == 0
        New(m+1) = 0;
        else
        New(m+1) = New(m);
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
%imwrite(D,'Matched Image: Grayscale256x256 to Random Histogram.jpg')



% plot
f = figure();
subplot(3,2,1);
imshow(A)
title("A: GrayscaleImage 256x256");
subplot(3,2,2);
bar(hist_A)
title("Histogram of GrayscaleImage 256x256")
% subplot(3,2,3)
% imshow(C)
% title("C: Grayscale of Random Image");
subplot(3,2,4);
bar(hist_C)
title("C: Random Histogram")
subplot(3,2,5);
imshow(D)
title("Image: A matched to C")
subplot(3,2,6);
bar(hist_D);
title("Histogram: A matched to C")
% saveas(gcf,'Histogram Matching to random Week 3.png');