function  set_servo_positions( p1, p2, p3, ser )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
display('in set_servo_positions');
p1
p2 
p3
pause(.1);
for b = servo_positions_to_bytes(p1, p2, p3)
    disp(b);
    fwrite(ser,b, 'char'); 
    %fwrite(ser,b, 'char'); 
    %pause(.1);
end
pause(0.5);

end

