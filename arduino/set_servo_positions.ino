/* Sweep
 by BARRAGAN <http://barraganstudio.com>
 This example code is in the public domain.

 modified 8 Nov 2013
 by Scott Fitzgerald
 http://www.arduino.cc/en/Tutorial/Sweep
*/

#include <Servo.h>

Servo myservo1;  // shoulder servo
Servo myservo2;  // arm servo
Servo myservo3;  // wrist servo
// twelve servo objects can be created on most boards

int in_byte = 0;

int def_pos_s1 = 0;
int def_pos_s2 = 0;
int def_pos_s3 = 130;

int cur_pos_s1 = def_pos_s1;
int cur_pos_s2 = def_pos_s2;
int cur_pos_s3 = def_pos_s3;

void setup() {

  Serial.begin(9600);
    
  myservo1.attach(5); 
  myservo2.attach(6);
  myservo3.attach(9);

  //myservo3.write(0);

  myservo1.write(cur_pos_s1); 
  myservo2.write(cur_pos_s2); 
  myservo3.write(cur_pos_s3);    

}

void loop() {

 

  Serial.println("Listening: ");
  if (Serial.available() > 0) {

    char b[9];
    Serial.readBytes(b, 9);
    int p1 = b[0]*100 + b[1]*10 + b[2];
     

    int p2 = b[3]*100 + b[4]*10 + b[5];
    

    int p3 = b[6]*100 + b[7]*10 + b[8];

    if (p1 > 180 || p2 > 180 || p3 > 180) {
      
      myservo1.write(cur_pos_s1); 
      myservo2.write(cur_pos_s2); 
      myservo3.write(cur_pos_s3); 
    } else {
      myservo1.write(p1); 
      //if(p3 > 100) {
      myservo3.write(130);
      //} else {
      //  myservo3.write(p3+50);
      //}
      delay(200);
      myservo2.write(p2);   
      delay(100);  
      myservo3.write(p3+20);
      delay(800);
      myservo3.write(p3);
      delay(100);
      myservo2.write(p2+10); //press harder

      cur_pos_s1 = p1;
      cur_pos_s2 = p2;
      cur_pos_s3 = p3;

      delay(100);

                  
//      if (p3 < 90 ) {
//        myservo3.write(90);
//      } else {
//        myservo3.write(p3);  
//      }      
    }
     
     //myservo1.write(def_pos_s1); 
     //myservo2.write(def_pos_s2); 
     //myservo3.write(def_pos_s3);     
    
        
//    for(int i=0;i<9;++i) {
//      int p1 = Serial.read()*100 + Serial.read()*10 + Serial.read();
//      int p2 = Serial.read()*100 + Serial.read()*10 + Serial.read();
//      int p3 = Serial.read()*100 + Serial.read()*10 + Serial.read();
//
//      myservo1.write(p1);  
//      delay(100);
//      //myservo2.write(p2);      
//      //delay(100);
//      //myservo3.write(p3);
//      //delay(100);
//    }


  } else {

     //myservo1.write(cur_pos_s1); 
     //myservo2.write(cur_pos_s2); 
     //myservo3.write(cur_pos_s3);      
  }
      myservo1.write(cur_pos_s1); 
      myservo2.write(cur_pos_s2); 
      myservo3.write(cur_pos_s3);   
  delay (10);
  

}

