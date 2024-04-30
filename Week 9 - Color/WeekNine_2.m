clc;
clear all;
close all;

input = imread("Image 256x256.jpg");
[M,N,d] = size(input);
n = 3;  %Number of colors we want to have in the end, colors will be 5x3

%K-Means, uses squared euclidean distance for clustering
%it starts with random center of clusters, calculates the distance of
%colors to the center, asigns colors to the closest cluster, then recalculate 
% the centers by getting the mean of datas in cluster
r = input(:,:,1); %prepare the data to be suitable for the function
g = input(:,:,2);
b = input(:,:,3);
img = zeros((M * N), 3);
img(:,1) = r(:);
img(:,2) = g(:);
img(:,3) = b(:);
img = double(img); %2D rather than 3D
[idx, C] = kmeans(img, n); 
%index of the cluster that each pixel belongs, to associate each pixel to a cluster later
% C is the centroid locations, mean of all the colors in that cluster
colors = round(C);
%Mapping colors
idx = uint8(idx);
output = zeros(M,N,3);
temp = reshape(idx, [M N]); %back to 256x256
for i=1:1:M
    for j=1:1:N
        output(i,j,:) = colors(temp(i,j),:); %mapping colors with indexes we have
    end
end
figure;imshow(uint8(output));
% imwrite(uint8(output),"16colors.png");