% Configuration data
CAPTURE_DRIVER = 'macvideo';
CAPTURE_DEVICE = 1;
CAPTURE_MODE = 'YCbCr422_1280x720';
CAPTURE_YCBCR = 0;

% Setup the capture device
device = videoinput(CAPTURE_DRIVER, CAPTURE_DEVICE, CAPTURE_MODE);
device.ReturnedColorSpace = 'rgb';

while 1
	% Capture an image and perform the transform on it
	img = getsnapshot(device);
	it = shapeImage(img, 0);
	imshow(it);
end
