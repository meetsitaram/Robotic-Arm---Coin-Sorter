
%global ser
delete(instrfindall) % to clean all serial ports
%test_servo_setup()



%set_servo_positions(0, 0, 130, ser);
%pause(2)
% set_servo_positions(72, 65, 68, ser);
% pause(2)
% set_servo_positions(90, 0, 45, ser);
%  pause(2)
%  set_servo_positions(45, 68, 90, ser);
%  pause(2)
%  set_servo_positions(90, 68, 90, ser);
%  pause(2) 
%  set_servo_positions(135, 68, 90, ser);
%   pause(2)
%  set_servo_positions(45, 68, 90, ser);
%   pause(2)
%set_servo_positions(90, 45, 90, ser);
    
%point_finger(0, 400); % theta should be 45 degrees
%point_finger(300, 300, ser); % theta should be 45 degrees
%pause(2)

%point_finger(400, 300, ser); 
%point_finger(400, 300, ser); 
%point_finger(200, 100, ser); 

pause(2)

points = [ [200,300]; [400,450]; [400,300]; [600,300]; [700,150]]
%points = [ [200,300];]
for i = 1: size(points,1)
    pause(1)
    ser=open_serial();    
    p = points(i,:)
    point_finger(p(1), p(2), ser)
    pause(.5)
    close_serial(ser); 
    
end



%point_finger(200, 100, ser); 
%point_finger(200, 300, ser); 
%point_finger(400, 300, ser); 
%point_finger(400, 450, ser); 
%point_finger(600, 300, ser); 


%point_finger(800, 300, ser); 

%pause(2)
%point_finger(400, 100, ser); 
%point_finger(700, 200, ser); 
%point_finger(800, 300, ser); 
% set_servo_positions(72, 65, 68, ser);
% pause(2)
% set_servo_positions(72, 50, 68, ser);
% pause(2)
% set_servo_positions(72, 58, 70, ser); % 72, 58, 70
% pause(2)
