function T = CalibrateHomography(i);

imshow(i);
p=ginput(4);

x1=0;
y1=0;
x=p(1);
y=p(5);

p1=[x y 1 0 0 0 -x1*x -x1*y -x1;
0 0 0 x y 1 -y1*x -y1*y -y1];

x=p(2);
y=p(6);
x1=1000;

p2=[x y 1 0 0 0 -x1*x -x1*y -x1;
0 0 0 x y 1 -y1*x -y1*y -y1];

x=p(3);
y=p(7);
x1=1000;
y1=1000;

p3=[x y 1 0 0 0 -x1*x -x1*y -x1;
0 0 0 x y 1 -y1*x -y1*y -y1];

x=p(4);
y=p(8);
x1=0;

p4=[x y 1 0 0 0 -x1*x -x1*y -x1;
0 0 0 x y 1 -y1*x -y1*y -y1];

H1=[p1; p2; p3; p4];
H=null(H1, 'r');
H2=[H(1) H(4) H(7);
H(2) H(5) H(8);
H(3) H(6) H(9)];

T=maketform('projective', H2);
