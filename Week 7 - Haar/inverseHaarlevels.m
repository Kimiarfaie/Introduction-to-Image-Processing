function img = inverseHaarlevels(I,k)
if k<1 %a condition to break the recursive function, no more levels of transformation is needed
    img = I;
else
    [m,n] = size(I);
    I_in = zeros(m,n); 
    %zero because we want the high frequencies set to zero
    %choose low  frequencies and we apply the inverse haar of level one to
    %it
    mnew = m/2^(k-1);
    nnew = n/2^(k-1);
    % inverse haar of level 1
    I_in(1:mnew,1:nnew) = inverseHaar(I(1:mnew,1:nnew));
    img = inverseHaarlevels(I_in,k-1); %recursive 
end
end