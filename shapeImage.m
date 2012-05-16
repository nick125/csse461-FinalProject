%this shapes an image, given the data and the camera number.
%pass in raw image, not location
function image = shapeImage(im,camNum)
%load calibration parameters
load(strcat('Transformation',int2str(camNum)));
load(strcat('crop',int2str(camNum)));
%transform
image = imtransform(im,T, 'XData', [1 c2(1) - c1(1)], 'YData', [1 c2(2) - c1(2)]);
