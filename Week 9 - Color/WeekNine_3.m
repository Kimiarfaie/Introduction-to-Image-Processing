% Using k-nearest
clc;
clear all;
close all;

% Read the image
input = imread('Image 256x256.jpg');
input = im2double(input);

% Reshape the image into an nx3, n is all be number of pixels
[m, n, ~] = size(input);
Pixels = reshape(input, m * n, 3);

% Random color palette with k colors
k = 3;
rng(123);
palette = extractRandomColors(input,k);
palettes = round(palette*255);

% knnsearch to find the nearest color in the palette for each pixel
idx = knnsearch(palette, Pixels);

% Recolor the image: replace each pixel with the nearest color from the palette
output = palette(idx, :);

% Reshape and display the quantized image
output = reshape(output, m, n, 3);
figure;imshow(output);title("Using random Palette");
%%
% use kmeans for creating a palette
[~, newpalette] = kmeans(Pixels, k);

%knnsearch to find nearest colors in palette for each pixel
newidx = knnsearch(newpalette, Pixels);

newoutput = newpalette(newidx,:);
newoutput = reshape(newoutput, m, n, 3);
figure;imshow(newoutput);title("Using Palette from kmeans");
