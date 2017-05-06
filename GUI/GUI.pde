/*
Led Strip Controller GUI
 
 GUI for the sernder sketch.
 */

import processing.serial.*;

Serial arduinoPort;

int sideLength = 50;
int row;

void setup() {
  size(500, 500);
  background(0);

  arduinoPort = new Serial(this, Serial.list()[1], 9600);
}

void draw() {
  // Power.
  row = 1;
  button(sideLength, sideLength, sideLength, #FF0000, (byte)'o');
  button(sideLength * 2, sideLength, sideLength, #10FF00, (byte)'O');

  // Colors.
  row = 2;
  button(sideLength, sideLength * row, sideLength, #FF0000, (byte)'R');
  button(sideLength * 2, sideLength * row, sideLength, #10FF00, (byte)'G');
  button(sideLength * 3, sideLength * row, sideLength, #0300FF, (byte)'B');
  button(sideLength * 4, sideLength * row, sideLength, #FFF700, (byte)'Y');
  button(sideLength * 5, sideLength * row, sideLength, #FFFFFF, (byte)'W');
  
  row = 3;
  button(sideLength, sideLength * row, sideLength, #A900FF, (byte)'U');
  button(sideLength * 2, sideLength * row, sideLength, #FF00FB, (byte)'P');
  button(sideLength * 3, sideLength * row, sideLength, #00CEFF, (byte)'S');

/*
  // Delay on mouse click to prevent signal interference and act as debounce.
  if (mouseButton == LEFT)
    delay(250);
    */
}

void button(int x, int y, int sideLength, color fillColor, byte code) {
  // Square.
  square(x, y, sideLength, fillColor);

  // Label properties.
  stroke(#000000);
  strokeWeight(3);
  textSize(sideLength * 0.75);

  // Mouse cursor on button.
  if ( mouseX >= x && mouseX <= x + sideLength
    && mouseY >= y && mouseY <= y + sideLength ) {
    fill(#00FFFD);      // Updating the label's fill color.

    // Sending the code to the arduino's serial port when the button is clicked.
    if (mousePressed && mouseButton == LEFT) {
      arduinoPort.write(code);
      println("Sent " + (char)code + " as byte " + code + ".");

      fill(#FE00FF);      // Updating the label's fill color.
    }
  }
  // Mouse cursor not on button.
  else
    fill(#000000);      // Updating the label's fill color.

  // Label.
  text(charToString((char)code), x + (sideLength * 0.25), y, x + sideLength, y + sideLength);
}

void square(int x, int y, int sideLength, color fillColor) {
  // Properties.
  stroke(#000000);
  strokeWeight(3);
  fill(fillColor);

  // Drawing the square.
  rect(x, y, sideLength, sideLength);
}

String charToString(char character) {
  return character + "";
}