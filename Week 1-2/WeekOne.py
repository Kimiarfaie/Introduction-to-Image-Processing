import cv2
img = cv2.imread("Image - 2230x2230.jpg")
img1 = cv2.resize(img, (256, 256), interpolation=cv2.INTER_AREA)
# cv2.imwrite('Image 256x256.jpg', img1)
img2 = cv2.cvtColor(img1, cv2.COLOR_BGR2GRAY) # OpenCV uses BGR not RGB
# cv2.imwrite('Grayscale Image 256x256.jpg', img2)

# Display the original and grayscale images
cv2.imshow('Original Image', img1)
cv2.imshow('Grayscale Image', img2)

# Wait for a key press and then close the windows
cv2.waitKey(0)
cv2.destroyAllWindows()