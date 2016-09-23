function check_shoulder_servo(pos_arm_servo, pos_wrist_servo)
serialPort = open_serial();
set_servo_positions(0, pos_arm_servo, pos_wrist_servo, serialPort);
set_servo_positions(90, pos_arm_servo, pos_wrist_servo, serialPort);
set_servo_positions(180, pos_arm_servo, pos_wrist_servo, serialPort);
set_servo_positions(90, pos_arm_servo, pos_wrist_servo, serialPort);
set_servo_positions(0, pos_arm_servo, pos_wrist_servo, serialPort);
pause(.1);
close_serial(serialPort);
end
