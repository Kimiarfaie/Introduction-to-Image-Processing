import numpy as np

def imagehistogram(image):
    """
    Calculate the histogram of a grayscale image.

    Parameters:
    image (2D array): Grayscale image represented as a 2D numpy array.

    Returns:
    hist (1D array): Histogram of the image with 256 bins.
    """
    # Initialize histogram with zeros for 256 intensity levels
    hist = np.zeros(256, dtype=int)

    # Flatten the image array (2D to 1D array) and count occurrences of each pixel value
    for pixel_value in image.flatten():
        hist[pixel_value] += 1

    return hist