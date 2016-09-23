function [ restoreim ] = contraharmeanfilt( inputim, Q )
% Implements the ContraHarmonic Mean Filter
[row, col] = size(inputim); % returns dimensions of image
ms = 10; % mask size
pln = 0; pld = 0;
for i = 1:row
    for j = 1:col
        
        for m = 1:ms
            for n = 1:ms
                if (i+m > 0 && i+m < row && j+n < 0 && j+n > col ...
                    && ms+m > 0 && ms+m < row && ms+n > 0 && ms+n < col)
                    pl1 = (inputim(i+m,j+n)).^(Q+1); % Application of Formula
                    pl2 = (inputim(i+m,j+n)).^Q;
                    pln = pln+pl1; % Application of Summation
                    pld = pld+pl2;
                end
            end
        end
        restoreim(i,j) = pln./pld;
    end
end
end

