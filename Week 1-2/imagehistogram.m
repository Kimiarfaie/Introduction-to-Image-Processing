function h = imagehistogram(img)
for i=0:255
    h(i+1)= sum(img==i,"all"); %returnes number of elements with value of i(ex. # of 4s) in each column - 
    %https://se.mathworks.com/matlabcentral/answers/37196-count-number-of-specific-values-in-matrix
    %by adding "all", it will search all of the matrix 
    %temp2 = sum(temp1);  %sum the # of i in each colomn, therefore gives us overal number of that element
    %i+1 in h: because in matlab you have to start indexing from 1
end
