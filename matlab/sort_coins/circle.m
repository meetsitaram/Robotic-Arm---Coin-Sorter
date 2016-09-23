function circle(x,y,r,ang)
%x and y are the coordinates of the center of the circle
%r is the radius of the circle
%0.01 is the angle step, bigger values will draw the circle faster but
%you might notice imperfections (not very smooth)

xp=r*cos(ang);
yp=r*sin(ang);
plot(x+xp,y+yp);
end