function palette = extractRandomColors(image, numColors)
    % image = double(image);

    % Reshape the image so each row represent a pixel
    reshapedImage = reshape(image, [], 3);

    % total number of pixels
    numPixels = size(reshapedImage, 1);

    % getting random indexes
    index = randperm(numPixels, numColors);

    % get the random colors
    palette = reshapedImage(index, :);
end
