
%% RMSD Computation

function [rmsd] = RMSD(M1, M2)
[row,col]  = size(M1);
n = row*col;
C = (M1-M2).^2;
rmsd = sqrt(sum(C(:))/n);
end
