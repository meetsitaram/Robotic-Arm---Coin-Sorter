function [theta_s, theta_a, theta_w] =  transform_to_servo_positions(x,y)

% all measurements in cm

% ground specs
ground_width = 27.5;
ground_height = 21.5;
ground_height_pixels = 600;
ground_width_pixels = 800;

% robot limits
d_min = 8.0;
d_max = 17.0;

% shoulder specs
%shoulder_length = 11;
shoulder_length = 11; %modified for testing
theta_s_min = 0;
theta_s_max = 180;
theta_s_offset = 10; % to compensate for distance between centre of base servo and the wrist

% arm  specs
arm_length = 5.0;
theta_a_min = 0;
theta_a_max = 110;
theta_a_offset = 0;

% wrist specs
wrist_length = 15.0;
theta_w_min = 0;
theta_w_max = 130;
theta_w_offset = -50;

% wrist is attached to servo such that 0degree servo value corresponds to
% -40 degrees. so if we need 50 degrees between arm and wrist, actual angle
% should be 50 - 90 = -40 degrees by setting servo angle to 0 degrees. this
% can be done by having offset 50

xt = ground_width*x/ground_width_pixels;
yt = ground_height*y/ground_height_pixels;
d = sqrt( (yt)^2 + ( (ground_width/2 ) - xt )^2 );  %1.5 offset 

theta_s = atand( yt/(ground_width/2 - xt));
disp('theta_s first value')
disp(theta_s)
if theta_s < 0
    theta_s = 180 + theta_s;
end
theta_s = theta_s + theta_s_offset;

%dpercent = 100*d/ground_width;
%display(dpercent)

a = arm_length;
s = shoulder_length;
w = wrist_length;
h = sqrt ( d^2 + s^2);


theta_w = acosd( (w^2 + a^2 - h^2) / (2*w*a));


theta_w = theta_w + theta_w_offset;

theta_a = acosd( (h^2 + a^2 - w^2) / (2*h*a))  + acosd( (s^2 + h^2 - d^2) / (2*s*h));
%theta_a = theta_a_offset - theta_a;


theta_s = int16(theta_s);
theta_a = int16(theta_a);
theta_w = int16(theta_w);

theta_aw = [110, 130];
if d < 5.5
    theta_aw = [35, 10];
elseif d < 7
    theta_aw = [40, 25];
elseif d < 9
    theta_aw = [40, 28];  
elseif d < 11
    theta_aw = [50, 45];
elseif d < 13
   theta_aw = [60, 60];
elseif  d < 14.5
   theta_aw = [70, 75];
else
   theta_aw = [110, 130];
end

%theta_aw(1) = theta_aw(1) + 5; % to press a bit hard

%theta_aw = [110, 130];
%%theta_aw = [82, 90];







theta_a = int8(theta_aw(1));
theta_w = int8(theta_aw(2));



display(d)
display(s)
display(w)
display(a)
display(h)
display(theta_s)
display(theta_a)
display(theta_w)


if ~isreal(theta_s) || ~isreal(theta_a) || ~isreal(theta_w)
    disp('point out of range')
    theta_s = -1; 
    theta_a = -1;
    theta_w = -1;
    
    return
end
