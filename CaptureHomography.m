% Configuration data
CAPTURE_DRIVER = 'macvideo';
CAPTURE_DEVICE = 1;
CAPTURE_MODE = 'YCbCr422_1280x720';
CAPTURE_YCBCR = 1; 

% Setup the capture device
device = videoinput(CAPTURE_DRIVER, CAPTURE_DEVICE, CAPTURE_MODE);

% Perform the calibration routine, which returns a transformation
T = CalibrateHomography(CaptureRGB(CAPTURE_YCBCR, device));


while 1
	% Capture an image and perform the transform on it
	img = CaptureRGB(CAPTURE_YCBCR, device);
	it = imtransform(img, T);
	close all;
	imshow(it);
end
