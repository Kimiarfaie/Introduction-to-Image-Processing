# Image-Processing
Project for Introduction to Image Processing course at NTNU.

# Week 1
Capture an image with your cell phone.
Using a photo editing tool:
Crop a square with a size larger than 1024 by 1024 pixels out of your image.
Resize the image to 256 by 256 pixels.
Convert the image to grey scale.

# Week 2 - Image Histogram, Segmentation, Histogram Equalization
Calculate the image histogram
Based on the image histogram, segment your image to at least 3 segments.
Normalize your image.
Apply histogram equalization on your image.

# Week 3 - Histogram Matching
Convert your original image which you cropped your square from, to greyscale and use that image for applying histogram matching to your 256 by 256 image.
Create a random histogram from using the “rand” function in Matlab as the source histogram to apply histogram matching to your 256 by 256 image.

# Week 4 - Local Enhancement
Remove distortions using local enhancement.
imnoise(I,'salt & pepper',rand(1))
imnoise(a,'speckle',.2);
use the following function to blur the image and then find a local enhancement technique which could deblur the image.
windowWidth = round(10*rand(1));
kernel = ones(windowWidth) / windowWidth ^ 2;
blurredImage = imfilter(rgbImage, kernel); %
  
Finally, calculate the gradient of the image in the X and Y direction as well as the gradient magnitude and angle for each pixel.

# Week 6 - Fourier Transform
First calculate the Fourier transform of your image. Then gradually apply the inverse Fourier transform of the image starting with just the central pixel, then adding another layer of pixels, then another one, and continue this until you use all the Fourier transform. You would then need to calculate the MSE, RMSE, and PSNR for each reconstruction of the image and draw a plot which on one axes you have the compression rate and on the other one the quality of the image for each of the mentioned methods.

# Week 7 - DCT, Haar, Walsh and Hadamard transforms
Like the previous week we would like to create a plot calculating MSE, RMSE, and PSNR for each inverse transformation in the case of DCT, Walsh, and Hadamard transform. For this you can simply use the transform functions Matlab already has.
 
When it come to the Haar transform
Write your own transform and inverse transform functions.
Calculate the Haar transform up to level 4 for your images.
At each level just keep the section of the image that has all low frequencies and apply the inverse transform. Plot the MSE, RMSE and PSNR values at each level.

# Week 8 - Impementing a function for image resizing
Come up with your own creative way (which makes sense) to resize the cropped image (1024 by 1024) to the 256 by 256 pixels. Calculate the SSIM method between your resized image and the image you were using over the previous weeks. Try to improve your resize method with small changes.

# Week 9.1 - JPEG compression
Use your 256 by 256 image and go through the steps in JPEG compression.

# Week 9.2 - Color Quantization
Apply different color quantization techniques for your image. This could be using K-means clustering, K-nearest neighbor, or any other clustering technique you see fit.

