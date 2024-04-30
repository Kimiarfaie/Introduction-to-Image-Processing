clc
clear all
close all
% Histogram based Image Segmentation
img = imread('Grayscale Image 256x256.jpg');
[M, N] = size(img);
n1 = 30;
n2 = 70;
n3 = 150;
n4 = 195;
n5 = 255;
sum1 = 0;

for i=1:N
    for j=1:M
        if 0 <= img(i,j) && img(i,j)<n1
            segment1(i) = img(1,j);
        end

        if n1 <= img(i,j) && img(i,j)<n2
            segment2(i) = img(i,j);
        end
        if n2 <= img(i,j) && img(i,j)<n3
            segment3(i) = img(i,j);
        end
        if n3 <= img(i,j) && img(i,j)<n4
            segment4(i) = img(i,j);
        end
        if n4 <= img(i,j) && img(i,j)<= n5
            segment5(i) = img(i,j);
        end
    end
end

av1 = round(mean(segment1));
av2 = round(mean(segment2));
av3 = round(mean(segment3));
av4 = round(mean(segment4));
av5 = round(mean(segment5));

for i=1:N
    for j=1:M
        if 0 <= img(i,j) && img(i,j)<n1
            img(i,j) = av1;
        end
        if n1 <= img(i,j) && img(i,j)<n2
            img(i,j) = av2;
        end
        if n2 <= img(i,j) && img(i,j)<n3
            img(i,j) = av3;
        end
        if n3 <= img(i,j) && img(i,j)<n4
            img(i,j) = av4;
        end
        if n4 <= img(i,j) && img(i,j)<=n5
            img(i,j) = av1;
        end
    end
end

figure;imshow(img);title("Segmented image");

% imwrite(img,'Segmented GrayscaleImage256x256.jpg');
