%this shapes an image, given the data and the camera number.
%pass in raw image, not location
function image = shapeImage(im,camNum)
%load calibration parameters
load(strcat('Transformation',int2str(camNum)));
load(strcat('crop',intstr(camNum)));
%transform
it = imtransform(im,T);
%crop
image = it(c1(2):c2(2),c1(1):c2(1),:);