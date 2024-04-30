img = imread("Image - 2230x2230.jpg");
img1 = imresize(img,[256,256]);
%imwrite(img1,'Image 256x256.jpg');
img3 = im2gray(img1);
% imwrite(img3,'Grayscale Image 256x256.jpg');
