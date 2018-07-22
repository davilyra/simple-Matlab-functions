function P = powerd(fx)
% P = powerd(fx)
% Computes the average signal power of fx.
% Input:
%    - fx: signal
% Output
%   - P: average power of fx
%
% May 2014
% Written by Davi M. Lyra-Leite <davi@ieee.org>

fx =  fx(:);

P = 1/(length(fx))*(sum(abs(fx).^2));
end