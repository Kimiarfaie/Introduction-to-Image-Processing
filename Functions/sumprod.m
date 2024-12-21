function s = sumprod(A,B)
p = A.*B;
s = sum(p,"all");
end