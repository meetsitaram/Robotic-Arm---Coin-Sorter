t = 0:0.01:1;
y = [t; exp(t)];
fID = fopen('A0_data.txt','w');

fprintf(fID,'%3.2f %12.8f \n',y);
fclose(fID);