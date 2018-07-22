function [res,sortarray] = dicomsort(filename,imSize,opt)
%% res = dicomsort(filename,imSize)
% Function that reads and sorts DICOM files according to slice position
% Input:
%   - filename: A string containing the general path of the files
%   - imSize: The dimensions of 3D stack
%   - opt: Options in order to define the starting and ending point of the
%   stack
% Output:
%   - res: A stack of slices containing the magnitude information from the
%   DICOM files
%   - sortarray: A matrix containing the information to sort datasets
%   outside this function, for example, corresponding tags
%
% May 2014
% Written by Davi M. Lyra-Leite <davi@ieee.org>

numz = abs(opt.startpoint - opt.endpoint)+1;

% Initializing the variables
res = zeros(imSize(1),imSize(2),numz);
temp = zeros(imSize(1),imSize(2),numz);
sliceposition = zeros(numz,2);

% Reading the variables
for zz = opt.startpoint:opt.endpoint
    if strcmp(filename(end-2:end),'DCM')
        % Assuming the first image is something like MR000000.DCM
        temp(:,:,zz) = dicomread([filename(1:end-7),sprintf('%03d',zz-1),'.DCM']);
        hdr = dicominfo([filename(1:end-7),sprintf('%03d',zz-1),'.DCM']);
    else
        % Assuming the first image is something like MR000001.DCM
        temp(:,:,zz) = dicomread([filename(1:end-7),sprintf('%03d',zz),'.dcm']);
        hdr = dicominfo([filename(1:end-7),sprintf('%03d',zz),'.dcm']);
    end
    sliceposition(zz,1) = hdr.SliceLocation;
end

sliceposition(:,2) = 1:numz;
sortarray = sortrows(sliceposition,1);

% Sorting the stack of images
for zz = 1:numz
    res(:,:,zz) = temp(:,:,sortarray(zz,2));
end