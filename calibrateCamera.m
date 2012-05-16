% Configuration data
CAPTURE_DRIVER = 'macvideo';
CAPTURE_DEVICE = 1;
CAPTURE_MODE = 'YCbCr422_1280x720';
CAPTURE_YCBCR = 0;

% Setup the capture device
device = videoinput(CAPTURE_DRIVER, CAPTURE_DEVICE, CAPTURE_MODE);
device.ReturnedColorSpace = 'rgb';

calibrateSingle(getsnapshot(device), 0);
