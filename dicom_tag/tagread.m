function res = tagread(fname,imSize)
% res = tagread(fname,imSize)
% Generates gray-scale image corresponding to a manual segmentation input
% from sliceOmatic (*.tag file)
%
% Inputs:
%   - fname: file name
%   - imSize: desired image size
%
% Outputs:
%   - res: gray-scale image corresponding to the tags
%
% October 2013
% Written by Davi M. Lyra-Leite <davi@ieee.org>
%
% Modified: May 2014

% read the tag information
fid = fopen(fname);
tag = fread(fid,inf,'int8');
fclose('all');

% get the original file and the desired image size
tagl = length(tag);
if size(imSize,2) == 2
    iml = imSize(1)*imSize(2);
else
    iml = imSize(1)*imSize(2)*imSize(3);
end

% compute the size of the header
startp = tagl - iml;

% generate the binary image corresponding to the tag
tag = tag((startp + 1):end);

% the image is flipped to have the same orientation as the corresponding
% DICOM file when both are read in MATLAB
if size(imSize,2) == 2
    res(:,:) = fliplr(rot90(reshape(tag,imSize),-1));
else
    res = zeros(imSize);
    for zz = 1:imSize(3)
        res(:,:,zz) = fliplr(rot90(reshape(tag(zz*iml:((zz+1)*iml - 1)),[imSize(1),imSize(2)]),-1));
    end
end