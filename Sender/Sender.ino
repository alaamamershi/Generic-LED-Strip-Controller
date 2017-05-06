/*
   Sender

   Sends IR codes to the LED strip controller.
*/

#include <IRremote.h>
#include <IRremoteInt.h>

byte serialPortData;
char buttonChar;

unsigned int off = 0xF740BF;
unsigned int on = 0xF7C03F;

unsigned int red = 0xF720DF;
unsigned int green = 0xF7A05F;
unsigned int blue = 0xF7609F;
unsigned int yellow = 0xF728D7;
unsigned int white = 0xF7E01F;
unsigned int uv = 0xF750AF;
unsigned int pink = 0xF76897;
unsigned int skyBlue = 0xF7B04F;

IRsend irSend;

void setup() {
  Serial.begin(9600);
}

void loop() {
  serialPortData = Serial.read();
  buttonChar = (char)serialPortData;
  
  if (buttonChar == 'o')
    irSend.sendNEC(off, 32);
  else if (buttonChar == 'O')
    irSend.sendNEC(on, 32);
  else if (buttonChar == 'R')
    irSend.sendNEC(red, 32);
  else if (buttonChar == 'G')
    irSend.sendNEC(green, 32);
  else if (buttonChar == 'B')
    irSend.sendNEC(blue, 32);
  else if (buttonChar == 'Y')
    irSend.sendNEC(yellow, 32);
  else if (buttonChar == 'W')
    irSend.sendNEC(white, 32);
    else if (buttonChar == 'U')
    irSend.sendNEC(uv, 32);
    else if (buttonChar == 'P')
    irSend.sendNEC(pink, 32);
    else if (buttonChar == 'S')
    irSend.sendNEC(skyBlue, 32);
}
