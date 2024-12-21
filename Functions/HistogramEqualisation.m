function [img_Eq,New_values] = HistogramEqualisation(img,n) %n is what you want it to stretch to 
%function will give you the final values after equalisation and also the 
%new image after replacing the values

%input of func is normalized img

[N, M] = size(img);

for i=0:255
    hist(i+1)= sum(img==i,"all"); 
end

hist_norm = hist/(sum(hist,'all'));
hist_c = cumulativeprobfunc(hist_norm);
New_values = floor(n*hist_c);

for i=1:N
    for j=1:M
        img_Eq(i,j) = New_values(img(i,j)+1);  
    end
end
 img_Eq = uint8(img_Eq);
end
