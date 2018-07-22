function mse = msed(signal1,signal2)
% V = ser(signal1,signal2)
% Computes the mean-squared error between two signals
% Inputs
%   - singal1: The ground-truth data
%   - signal2: The processed data
%
% Output:
%   - error: The error (vector, matrix, tensor)
%
% May 2014
% Written by Davi M. Lyra-Leite <davi@ieee.org>

s1 = signal1(:);
s2 = signal2(:);

mse = 1/(length(s1))*sum((s1 - s2).^2);
end