function ser =  open_serial()
ser = serial('COM6','BaudRate',9600);
fopen(ser);
disp('After OPEN')
disp(ser)