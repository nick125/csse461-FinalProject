% Configuration data
CAPTURE_DRIVER = 'macvideo';
CAPTURE_DEVICE = 1;
CAPTURE_MODE = 'YCbCr422_1280x720';
CAPTURE_YCBCR = 0;

% Setup the capture device
device = videoinput(CAPTURE_DRIVER, CAPTURE_DEVICE, CAPTURE_MODE);
device.ReturnedColorSpace = 'rgb';
device.TriggerRepeat = Inf;
device.FrameGrabInterval = 10;

% Perform the calibration routine, which returns a transformation
T = CalibrateHomography(CaptureRGB(CAPTURE_YCBCR, device));

start(device);

while 1
	% Capture an image and perform the transform on it
	img = getdata(device);
	img = [img(:, 1) img(:, 2)];
	it = imtransform(img, T); 
	imshow(it);
end
