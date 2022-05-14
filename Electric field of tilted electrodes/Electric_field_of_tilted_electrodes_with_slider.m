[x,y,z] = meshgrid(1:1:5);
V0 = 150000;
alpha = pi/6;
f = (V0.*atan(y./x))./alpha;%potential function
xlabel('x');
ylabel('y');
zlabel('z');
daspect([1 1 1]);
view(3);
axis([1 5 1 5 1 5]); hold on;
slidervector(f,x,y,z,pi/9,pi,alpha);