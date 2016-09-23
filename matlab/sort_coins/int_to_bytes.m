function ibytes = int_to_bytes(i)
i = int16(i);
ibytes = [int8(idivide(int16(i),int16(100), 'floor')), int8(idivide(int16(mod(i,100)),int16(10), 'floor')), int8(floor(mod(i,10)))];
disp('i,ibytes')
disp(i)
disp(ibytes)
end
