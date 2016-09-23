function [ bytes ] = servo_positions_to_bytes( p1, p2, p3 )
bytes = [int_to_bytes(p1) int_to_bytes(p2) int_to_bytes(p3)];
end

