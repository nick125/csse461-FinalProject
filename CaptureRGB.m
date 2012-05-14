function img = CaptureRGB(YCBCR, device)

if (YCBCR == 1)
	img = ycbcr2rgb(getsnapshot(device));
else
	img = getsnapshot(device);
end
