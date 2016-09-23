function res = point_finger(x,y, ser)
pause(0.3)

[ts, ta, tw] = transform_to_servo_positions(x, y); % theta should be 45 degrees

if ts >= 0 && tw >= 0 && ta >= 0
    %ser=open_serial();
    %set_servo_positions(ts, ta, tw, ser);
    safe_thetas = [110, 130];
    set_servo_positions(ts, safe_thetas(1), safe_thetas(2), ser);
    pause(.5);
    set_servo_positions(ts, ta, tw, ser);
    %set_servo_positions(72, 58, 70, ser);
    pause(1);
    %close_serial(ser); 
    res = 1
else
    disp('out of range servo angles')
    res = 0
end

pause(1)
