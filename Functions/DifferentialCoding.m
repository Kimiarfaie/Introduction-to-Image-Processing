function code = DifferentialCoding(scanned)
    zero = 0;
    n = 1;
    code = [];
    for i = 1:length(scanned)
        if scanned(i) == 0
            zero = zero + 1;
        else
            % Calculate number of bits needed for non-zero value
            bits = floor(log2(abs(scanned(i))))+1;
            
            if n == 1
                code = [zero bits scanned(i)];
            else
                new = [zero bits scanned(i)];
                code = [code; new]; % Add new row each time 
            end
            n = n + 1;
            zero = 0; % Reset zeros count for the next non-zero element
        end
            if(isempty(code)) %if in the block there is nothing, go to next block
            continue
            end
    end
    


end