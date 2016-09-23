function check_arm_servo(pos_shoulder_servo, pos_wrist_servo)
serialPort = open_serial();
set_servo_positions(pos_shoulder_servo, 0, pos_wrist_servo, serialPort);
set_servo_positions(pos_shoulder_servo, 45, pos_wrist_servo, serialPort);
%set_servo_positions(pos_shoulder_servo, 110, pos_wrist_servo, serialPort);
%set_servo_positions(pos_shoulder_servo, 45, pos_wrist_servo, serialPort);
%set_servo_positions(pos_shoulder_servo, 0, pos_wrist_servo, serialPort);
pause(.1);
close_serial(serialPort);
end
