# Generic-LED-Strip-Controller
Controls many generic LED strips which are sold online on sites such as eBay and Amazon.  These LED strips use the same IR controller that accepts NEC-encoded IR signals from an included remote.  The NEC codes corresponding to the buttons in the GUI sketch are stored and transmitted by the arduino running the Sender sketch.

# How it Works
The GUI sketch sends byte versions of the button labels through the serial port.  The Sender sketch stores the IR codes and reads the byte coming from the GUI sketch.  Thereafter, it sends the corresponding IR code.  The IR code that was sent is read by the IR controller connected to the LED strip.

# Libaries Used
Serial for Processing.
IRremote for Arduino.
