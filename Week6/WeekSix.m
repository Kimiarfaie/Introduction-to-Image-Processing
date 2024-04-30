clc
clear all
close all
% Apply Fourier transform on image
I = imread("Grayscale Image 256x256.jpg");
y = fft2(I); 

% Calculate Magnitude and Phase for the image
magnitude = abs(y);
phase = angle(y);

% Apply Zero frequency shift (so low frequencies would be in the middle) and calculate mag and phase
y_shifted = fftshift(y);
magnitude2 = abs(y_shifted);
phase2 = angle(y_shifted);

% Plot DFT
figure()
subplot(1,3,1)
imshow(I)
title("Original Image")
subplot(1,3,2)
imshow(log10(magnitude),[])
title("DFT magnitude in log10 before shift")
subplot(1,3,3)
imshow(log10(magnitude2),[])
title("DTF magnitude in log10 after shift")
%%
% after shifting, u choose the section of DFT that you want to use 

%choose 2x2 in the middle
width = 2:2:254;  % for plotting

for w = 2:2:256 %window of selected square in the middle of the matrix
% choose a 2x2 size of pixels in the middle of the DFT
newy = zeros(256, 256) + 1i * zeros(256, 256); %it has to accept complex numbers
rowRange = (128 - w/2 + 1):(128 + w/2);
colRange = (128 - w/2 + 1):(128 + w/2);
submatrix = y_shifted(rowRange, colRange);
newy(rowRange, colRange) = submatrix; %only have the low frequencies we chose and everythin else is zero

%Reconstruct Image

% Shift back the DFT
inverse_y = ifft2(ifftshift(newy));

% Convert the reconstructed image back to uint8
reconstructedImage = uint8(real(inverse_y));

% Calculate the Erros
mse(w) = immse(reconstructedImage,I);
ps(w) = psnr(reconstructedImage,I);
temp1 = im2double(reconstructedImage);
temp2 = im2double(I);
rm(w) = rmse(temp1(:),temp2(:));
end

%since the indexes are only even numbers, in the odd places, we have zero so we have to get rid of the zeros
mse = nonzeros(mse)'; 
ps = nonzeros(ps)';
rm = nonzeros(rm)';

% plot of errors 

figure;
plot(width,mse);
xlabel("Width of the pixel square selected from the middle of DFT");
ylabel("MSE");
saveas(gcf,"IMMSE IDFT.png");
figure;
plot(width,ps(:,1:127));
xlabel("Width of the pixel square selected from the middle of DFT");
ylabel("PSNR");
saveas(gcf,"PSNR IDFT.png");
figure;
plot(width,rm);
xlabel("Width of the pixel square selected from the middle of DFT");
ylabel("RMSE");
saveas(gcf,"RMSE IDFT.png");

%%

% Visualize inverse fft, give a new value to w, run the loop and run the
% code below

% magnitude3 = abs(newy);
% figure()
% subplot(1,3,1)
% imshow(I)
% title("Original Image")
% subplot(1,3,2)
% imshow(log10(magnitude3),[])
% title("DFT magnitude in log10")
% subplot(1,3,3)
% imshow(inverse_y,[]);
% title("Reconstructed image from inverse DFT")
% sgtitle('Image Reconstruction with 80x80 central values of DFT') 
