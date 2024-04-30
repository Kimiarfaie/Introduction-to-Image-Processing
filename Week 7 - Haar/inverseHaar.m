function reconstructed = inverseHaar(I) 
%input is the haar transform image that you get at each level
%this function is for the first level, then use inverseHaarlevels
[row,col] = size(I);
output = zeros(row,col); %this matrix is set to zero
temp = I;

% columns 
for j = 1:col/2 
    %indexing is only for half of the image since low and high frequencies are half the image 
    %odd indexes
    output(j*2-1,:) = temp(j,:) - temp(row/2+j,:); 
    %temp(row/2+j,:) for j=1, this is the 128+1th row, we go beyond the second half because that's where high freq are
    %even indexes
    output(j*2,:) = temp(j,:) + temp(row/2+j,:);
end
temp = output;

% rows 
for i = 1:row/2
    %odd indexes
    output(:,i*2-1) = temp(:,i) - temp(:,row/2+i);
    %even indexes
    output(:,i*2) = temp(:,i) + temp(:,row/2+i);
end
reconstructed = output;
end