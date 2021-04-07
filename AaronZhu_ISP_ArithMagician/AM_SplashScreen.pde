// Splash Screen
class Splash { // use classes to make void draw a bit cleaner
  //https://processing.org/discourse/beta/num_1250556961.html
  int pos = 0; // variable to know where the splash screen is at
  int animate = 0; // variable to animate the elements of the splash screen
  int counter = 1; // variable to animate the operations
  final int R = 99; // finalized colours
  final int G = 128;
  final int B = 181;
  int r, g, b = 0; // colours that change
  void draw() {
    if (pos == 0)  // curtains
      curtains(); // call function
    else if (pos == 1) // magician
      magician();
    else if (pos == 2) // operations
      operations();
    else if (pos == 3) // text
      title();
    else if (pos == 4) { // delay before press any key message
      delay(1000);
      pos += 1;
    } else if (pos == 5) // press any key message
      pressAnyKey();
    else {// blackout
      background(0);
      masterSwitch = "mainMenu"; // master switch set to main menu
    }
  }

  void curtains() {
    background(0);
    image(openL, 0 + -1*animate, 0);
    image(openR, 0 + animate, 0);
    animate += 2;
    if (animate >= 500) {
      pos += 1;
      animate = 0; // reset animate
    }
  }

  void magician() {
    background(0);
    imageMode(CENTER);
    tint(animate);
    image(magician, 480, 300, 960, 600);
    tint(255);
    animate += 2;
    if (animate >= 255) {
      pos += 1;
      animate = 255;
    }
  }

  void operations() {
    imageMode(CORNER);
    if (r < R && g < G && b < B) {
      r += 11;
      g += 16;
      b += 23;
    }
    background(r, g, b);
    image(magician, 0, 0);
    if (counter == 1)
      image(operation1, 0, 0);
    else if (counter == 2)
      image(operation2, 0, 0);
    else if (counter == 3)
      image(operation3, 0, 0);
    else if (counter == 4)
      image(operation4, 0, 0);
    else if (counter == 5)
      image(operation5, 0, 0);
    else if (counter == 6)
      image(operation6, 0, 0);
    else if (counter >= 7) {
      r = R; // finalized colours
      g = G;
      b = B;
      image(operation7, 0, 0);
    }
    counter += 1;
    delay(50);
    if (counter == 12)
      pos += 1; // change slide
  }

  void title() {
    delay(1000);
    textFont(titleFont); // set font as title font
    textSize(80);
    textAlign(RIGHT);
    text("ArithMagician", 880, 100);
    textSize(30);
    text("Learn the Secret to Math", 880, 160);
    pos += 1; // next slide
  }

  void pressAnyKey() {
    textFont(pressKey);
    textSize(25);
    textAlign(CENTER);
    text("Press any key to continue.", 480, 550);
    if (keyPressed) { // delay cannot be in this if loop because then keyPressed messes up
      if (pos == 5) 
        pos += 1;
    }
  }
}
