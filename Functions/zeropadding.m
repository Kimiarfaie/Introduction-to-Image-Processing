function p = zeropadding(img)
M = size(img,2);
M = M+2;
p = zeros(M);
p(2:M-1,2:M-1) = img;
end