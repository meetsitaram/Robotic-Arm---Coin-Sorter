function test_servo_setup()


global ser;
%delete(instrfindall) % to clean all ports

def_pos_shoulder_servo = 0;
def_pos_arm_servo = 0;
def_pos_wrist_servo = 130; 

ser=open_serial();
set_servo_positions(def_pos_shoulder_servo, def_pos_arm_servo, def_pos_wrist_servo, ser);
close_serial(ser);

check_shoulder_servo(def_pos_arm_servo, def_pos_wrist_servo);
check_wrist_servo(def_pos_shoulder_servo, def_pos_arm_servo);
check_arm_servo(def_pos_shoulder_servo, def_pos_wrist_servo);





