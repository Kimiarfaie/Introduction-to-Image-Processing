function reconstructed = inverseHaar(I) 
%input is the haar transform image that you get at each level
%this function is for the first level, then use inverseHaarlevels
[row,col] = size(I);
output = zeros(row,col);
temp = I;

% columns 
for j = 1:col/2
    %odd indexes
    output(j*2-1,:) = temp(j,:) - temp(row/2+j,:); 
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