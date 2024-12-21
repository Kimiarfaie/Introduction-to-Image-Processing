function img1 = NormalizeImage(img)
[N, M] = size(img);
mx = max(double(img(:)));
mn = min(double(img(:)));
for i=1:N
    for j=1:M
        img1(i,j) = round(((double(img(i,j))-mn)*255)/(mx-mn));
    end
end

img1 = uint8(img1);


