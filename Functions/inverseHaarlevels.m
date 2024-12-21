function img = inverseHaarlevels(I,k)
if k<1
    img = I;
else
    [m,n] = size(I);
    %choose low  frequencies and we apply the inverse haar of level one to
    %it
    mnew = m/2^(k-1);
    nnew = n/2^(k-1);
    % inverse haar of level 1
    I(1:mnew,1:nnew) = inverseHaar(I(1:mnew,1:nnew));
    img = inverseHaarlevels(I,k-1);
end
end