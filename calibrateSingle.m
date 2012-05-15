% this code is designed of calibrating and saving the data needed to format
% images for processing. pass in raw image, not location
function calibrateSingle(imorig,camNum)

% imorig = imread(location);
%%
%Calculation  of H, and the transform.
%comment out after intial calibration
figure(1), imshow(imorig);
A = ginput(4);

w1 = distance(A(1,:),A(2,:));
w2 = distance(A(3,:),A(4,:));
l1 = distance(A(2,:),A(3,:));
l2 = distance(A(4,:),A(1,:));

pt1 = A(1,:);
pt2 = A(2,:);
pt3 = A(3,:);
pt4 = A(4,:);



x1 = pt1(1,1); y1 = pt1(1,2);
x2 = pt2(1,1); y2 = pt2(1,2);
x3 = pt3(1,1); y3 = pt3(1,2);
x4 = pt4(1,1); y4 = pt4(1,2);

%xr# is the point in the 'real world' the numbers are arbitrary, the fact
%that they form a square is what is important

l = min([l1 l2]);
w = min([w1 w2]);

xr1 = 0; yr1 = 0;
xr2 = 0; yr2 = w;
xr3 = l; yr3 = w;
xr4 = l; yr4 = 0;

%set up system of equations and solve

A = [ x1 y1 1 0 0 0 -xr1*x1 -xr1*y1 -xr1;...
      0 0 0 x1 y1 1 -yr1*x1 -yr1*y1 -yr1;...
      x2 y2 1 0 0 0 -xr2*x2 -xr2*y2 -xr2;...
      0 0 0 x2 y2 1 -yr2*x2 -yr2*y2 -yr2;...
      x3 y3 1 0 0 0 -xr3*x3 -xr3*y3 -xr3;...
      0 0 0 x3 y3 1 -yr3*x3 -yr3*y3 -yr3;...
      x4 y4 1 0 0 0 -xr4*x4 -xr4*y4 -xr4;...
      0 0 0 x4 y4 1 -yr4*x4 -yr4*y4 -yr4;];
B = null(A);

%reshape matrix
H = [ B(1,1) B(2,1) B(3,1);...
    B(4,1) B(5,1) B(6,1);...
    B(7,1) B(8,1) B(9,1);]
T = maketform('projective',H');

save(strcat('Transformation',int2str(camNum)),'T')


%%
%selecting region to crop, comment out after calibration

image2 = imtransform(imorig,T);
figure(2), imshow(image2);

select crop area
A = ginput(2);
c1 = A(1,:);
c2 = A(2,:);
save(strcat('crop',int2str(camNum)),'c1','c2');

