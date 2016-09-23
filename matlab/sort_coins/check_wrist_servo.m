function check_wrist_servo(pos_shoulder_servo, pos_arm_servo)
serialPort = open_serial();
set_servo_positions(pos_shoulder_servo, pos_arm_servo, 130, serialPort);
set_servo_positions(pos_shoulder_servo, pos_arm_servo, 60, serialPort);
set_servo_positions(pos_shoulder_servo, pos_arm_servo, 0, serialPort);
set_servo_positions(pos_shoulder_servo, pos_arm_servo, 60, serialPort);
set_servo_positions(pos_shoulder_servo, pos_arm_servo, 130, serialPort);
pause(.1);
close_serial(serialPort);
end
