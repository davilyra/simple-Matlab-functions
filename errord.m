function error = errord(signal1,signal2)
% V = ser(signal1,signal2)
% Computes the error between two signals
%
% Inputs
%   - singal1: The ground-truth data
%   - signal2: The processed data
%
% Output:
%   - error: The error (vector, matrix, tensor)
%
% May 2014
% Written by Davi M. Lyra-Leite <davi@ieee.org>

error = abs(signal1 - signal2);
end