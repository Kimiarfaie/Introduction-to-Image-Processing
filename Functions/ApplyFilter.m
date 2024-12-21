function img1 = ApplyFilter(PaddedImage,filter) 
[M, N] = size(PaddedImage);
for i=1:M-2  %i and j are the size of actual image, not the padded one
    for j=1:N-2
        img1(i,j)=sumprod(PaddedImage(i:i+2,j:j+2),filter);
    end
end
