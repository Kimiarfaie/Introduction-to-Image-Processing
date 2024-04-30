clc
clear all
close all
img = imread("Grayscale Image 256x256.jpg");
img = im2double(img);
[M,N] = size(img);

%%
%%Salt&Pepper noise
% rng(1345);
% img1 = imnoise(img,'salt & pepper',rand(1));
% imwrite(img1,'distorted with salt&pepper.jpg');
img1 = imread("distorted image with salt&pepper.jpg"); %just to have a saved image of salt and pepper
img1 = im2double(img1);
p = zeropadding(img1); %padded image 
%%
%Average filter
Averagefilter = 1/9*ones(3);
B = ApplyFilter(p,Averagefilter);
imwrite(B,'Imagesalt&pepper after removing the noise with AveFilter.jpg')
%Difference between two images
D1 = imabsdiff(img,B);
imwrite(D1,'Difference-Average-Salt&Pepper.jpg')

%%
%Weighted mean filter - best one 
Weightedmeanfilter = 1/16*[1 2 1; 2 4 2; 1 2 1];
C = ApplyFilter(p,Weightedmeanfilter);
imwrite(C,'Weighted Mean Filter.jpg')
%Difference between two images
D2= imabsdiff(img,C);
imwrite(D2,'Difference-Weightedmean.jpg')

%%
%Local Median 
for i=1:M
    for j=1:N
        D(i,j)=median(p(i:i+2,j:j+2),"all");
    end
end
imwrite(D,'Local Median Filter.jpg')
%Difference between two images
D3= imabsdiff(img,D);
imwrite(D3,'Difference-Local Median.jpg');

%%
%Laplas1
L1 = [0 -1 0; -1 4 -1; 0 -1 0];
c = 1;
E = img1 + c*ApplyFilter(p,L1);
imwrite(E,'Laplas1.jpg')

%Difference between two images
D4= imabsdiff(img,E);
imwrite(D4,'Difference-Laplas1.jpg')
%%
%Laplas2
L2 = [-1 -1 -1; -1 8 -1; -1 -1 -1];

F = img1 + c*ApplyFilter(p,L2);

imwrite(F,'Laplas2.jpg')

%Difference between two images
D5= imabsdiff(img,F);
imwrite(D5,'Difference-Laplas2.jpg')

%%
%Laplas3
L3 = [0 1 0; 1 -4 1; 0 1 0];
m = -1;
% G = ApplyFilter(p,L3);
G = img1 + m*ApplyFilter(p,L3);

imwrite(G,'Laplas3.jpg')

%Difference between two images
D6= imabsdiff(img,G);
imwrite(D6,'Difference-Laplas3.jpg')

%%
%Laplas4
L4 = [1 1 1; 1 -8 1; 1 1 1];
m = -1;

H = img1 + m*ApplyFilter(p,L4);

imwrite(H,'Laplas4.jpg')

%Difference between two images
D7= imabsdiff(img,H);
imwrite(D7,'Difference-Laplas4.jpg')

