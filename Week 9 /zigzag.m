function A = zigzag(I)
r = size(I,1); %  rows of the input 
c = size(I,2); %  columns of the input 
kk = 2;
A = [];
while kk <= r+c % we can't go any further than the last elemest
                % which has the index r + c
                % it goes through the matrix as long as the last
                % element is included
    B = [];
    % iterate through every element of the input matrix
for ii = 1:r
    for jj = 1:c
        if ii + jj == kk % sum of the indices in a particular diagonal like we have 1,2 and 2,1
                         % are the same
            B = [B,I(ii,jj)];
        end
    end
end
if mod(kk,2) == 0 %even kk
    A = [A,flip(B)]; % reverse the order of the diagonal entries
                     % evenly, the reversal creates the zigzag pattern,
                     % going back and forth
else
    A = [A,B];
end
kk = kk+1; % going to the next diagonal 
end
        
end