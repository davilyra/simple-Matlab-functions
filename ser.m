function V = ser(signal1,signal2)
% V = ser(signal1,signal2)
% Computes the Signal-to-Error Ratio in dB for given data, comparing a
% defined ground-truth (original signal) with a processed dataset.
%
% Inputs
%   - singal1: The ground-truth data
%   - signal2: The processed data
%
% Output:
%   - V: the signal-to-error ration in dB
%
% May 2014
% Written by Davi M. Lyra-Leite <davi@ieee.org>

V = 10*log10(powerd(signal1(:))/powerd(abs(signal1(:)-signal2(:))));
end

function P = powerd(fx)
% P = powerd(fx)
% Computes the average signal power of fx.
% Input:
%    - fx: signal
% Output
%   - P: average power of fx

fx =  fx(:);

P = 1/(length(fx))*(sum(abs(fx).^2));
end