//main menu class
class MainMenu {
  String place = "menu"; // variable to detect where the user is in main menu
  int ruleSlide = 1; // switch between rule slides (for rulesMenu)
  int finalSec; // variable for the five second countdown in quitMenu();
  boolean getSecond = true;

  void draw() {
    if (place == "menu") // draw the main mainMenu
      menuMain(); // call function
    else if (place == "learn")
      learnMenu();
    else if (place == "quiz")
      quizMenu();
    else if (place == "rules")
      rulesMenu();
    else if (place == "quit") {
      int second = second(); // gets the seconds so that the quit screen lasts for eight seconds only
      if (second + 8 >= 60 && getSecond) {
        finalSec = second + 8 - 60;
        getSecond = false;
      } else if (getSecond) { // getSecond only lets this if loop run once
        finalSec = second + 8;
        getSecond = false;
      }
      quitMenu();
    }
  }

  void menuMain() {
    background(MM_bgLight);
    rectMode(CORNERS);
    strokeWeight(3); // write the title for the main menu
    stroke(74, 134, 232);
    fill(217, 217, 217);
    rect(650, 100, 400, 10, 5);
    textFont(titleFont);
    fill(0);
    textAlign(RIGHT);
    textSize(35);
    text("ArithMagician", 645, 50);
    textSize(18);
    text("Learn the Secret to Math", 645, 76);

    // draw the boxes (for choices)
    fill(217, 217, 217);
    rectMode(CENTER); // if statements change colour of box if mouse is in the area
    if (280 <= mouseX && mouseX <= 680 && 220 <= mouseY && mouseY <= 280)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(480, 250, 400, 60, 5); // Learn box
    if (230 <= mouseX && mouseX <= 730 && 295 <= mouseY && mouseY <= 355)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(480, 325, 500, 60, 5); // Quiz box
    if (280 <= mouseX && mouseX <= 680 && 370 <= mouseY && mouseY <= 430)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(480, 400, 400, 60, 5); // Rules box
    if (330 <= mouseX && mouseX <= 630 && 445 <= mouseY && mouseY <= 505)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(480, 475, 300, 60, 5); // credit box
    if (380 <= mouseX && mouseX <= 580 && 520 <= mouseY && mouseY <= 580)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(480, 550, 200, 60, 5); // Quit box
    fill(217, 217, 217);
    textFont(MMOptions); // change font
    textAlign(CENTER);
    fill(0);
    textSize(30);
    text("Learn", 480, 260);
    text("Rules", 480, 410);
    textSize(40);
    text("Quiz", 480, 340);
    textSize(25);
    text("Credits", 480, 485);
    textSize(20);
    text("Quit", 480, 560);
    image(arithMagician, 0, 0);

    if (mousePressed) {
      delay(200); // delay mouse press to avoid misclicks (mousepressed sometimes unreliable)
      if (280 <= mouseX && mouseX <= 680 && 220 <= mouseY && mouseY <= 280)
        place = "learn";
      else if (280 <= mouseX && mouseX <= 680 && 295 <= mouseY && mouseY <= 355)
        place = "quiz";
      else if (280 <= mouseX && mouseX <= 680 && 370 <= mouseY && mouseY <= 430)
        place = "rules";
      else if (280 <= mouseX && mouseX <= 680 && 445 <= mouseY && mouseY <= 505)
        masterSwitch = "credits";
      else if (280 <= mouseX && mouseX <= 680 && 520 <= mouseY && mouseY <= 580)
        place = "quit";
    }
  }

  void learnMenu() {
    background(MM_bgDark);
    // draw the boxes (for choices)
    fill(217, 217, 217);
    rectMode(CENTER); // if statements change colour of box if mouse is in the area
    if (230 <= mouseX && mouseX <= 730 && 150 <= mouseY && mouseY <= 210)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(480, 180, 500, 60, 5); // Addition box
    if (230 <= mouseX && mouseX <= 730 && 225 <= mouseY && mouseY <= 285)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(480, 255, 500, 60, 5); // Subtraction box
    if (230 <= mouseX && mouseX <= 730 && 300 <= mouseY && mouseY <= 360)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(480, 330, 500, 60, 5); // Multiplication box
    if (230 <= mouseX && mouseX <= 730 && 375 <= mouseY && mouseY <= 435)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(480, 405, 500, 60, 5); // Division box
    if (230 <= mouseX && mouseX <= 730 && 445 <= mouseY && mouseY <= 505)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(480, 475, 500, 60, 5); // OrderOfOperation box
    if (60 <= mouseX && mouseX <= 180 && 47.5 <= mouseY && mouseY <= 92.5)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(120, 70, 120, 45, 5); // Escape box

    fill(217, 217, 217); // makes sure that the escape box doesn't make the title box black as well
    rect(480, 60, 300, 60, 5); // title box
    textFont(MMOptions); // change font
    textAlign(CENTER);
    fill(0);
    textSize(40);
    text("Learn", 480, 75); // text
    textSize(30);
    text("Addition", 480, 192);
    text("Subtraction", 480, 267);
    text("Multiplication", 480, 342);
    text("Division", 480, 417);
    text("Order of Operations", 480, 487);
    textSize(20);
    text("Escape", 120, 75);

    if (mousePressed) { // based on where mouse is clicked, go to that place
      delay(200);
      if (230 <= mouseX && mouseX <= 730 && 150 <= mouseY && mouseY <= 210) {
        masterSwitch = "Addition";
        place = "menu";
      } else if (230 <= mouseX && mouseX <= 730 && 225 <= mouseY && mouseY <= 285) {
        masterSwitch = "Subtraction";
        place = "menu";
      } else if (230 <= mouseX && mouseX <= 730 && 300 <= mouseY && mouseY <= 360) {
        masterSwitch = "Multiplication";
        place = "menu";
      } else if (230 <= mouseX && mouseX <= 730 && 375 <= mouseY && mouseY <= 435) {
        masterSwitch = "Division";
        place = "menu";
      } else if (230 <= mouseX && mouseX <= 730 && 445 <= mouseY && mouseY <= 505) {
        masterSwitch = "Order Of Operations";
        place = "menu";
      } else if (60 <= mouseX && mouseX <= 180 && 47.5 <= mouseY && mouseY <= 92.5)
        place = "menu"; // back to main menu
    }
  }

  void quizMenu() {
    background(MM_bgDark);
    // draw the boxes (for choices)
    fill(217, 217, 217);
    rectMode(CENTER); // if statements change colour of box if mouse is in the area
    if (280 <= mouseX && mouseX <= 680 && 200 <= mouseY && mouseY <= 260)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(480, 230, 500, 60, 5); // easy quiz box
    if (280 <= mouseX && mouseX <= 680 && 275 <= mouseY && mouseY <= 335)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(480, 305, 500, 60, 5); // medium quiz box
    if (280 <= mouseX && mouseX <= 680 && 350 <= mouseY && mouseY <= 410)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(480, 380, 500, 60, 5); // hard quiz box
    if (60 <= mouseX && mouseX <= 180 && 47.5 <= mouseY && mouseY <= 92.5)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(120, 70, 120, 45, 5); // Escape box

    fill(217, 217, 217); // makes sure that the escape box doesn't make the title box black as well
    rect(480, 60, 300, 60, 5); // title box
    textFont(MMOptions); // change font
    textAlign(CENTER);
    fill(0);
    textSize(40);
    text("Quiz", 480, 75); // text
    textSize(30);
    text("Easy Quiz", 480, 242);
    text("Medium Quiz", 480, 315);
    text("Hard Quiz", 480, 390);
    textSize(20);
    text("Escape", 120, 75);

    if (mousePressed) { // based on where mouse is clicked, go to that place
      delay(200);
      if (280 <= mouseX && mouseX <= 680 && 200 <= mouseY && mouseY <= 260) {
        masterSwitch = "easyQ";
        place = "menu";
      } else if (280 <= mouseX && mouseX <= 680 && 275 <= mouseY && mouseY <= 335) {
        masterSwitch = "mediumQ";
        place = "menu";
      } else if (280 <= mouseX && mouseX <= 680 && 350 <= mouseY && mouseY <= 410) {
        masterSwitch = "hardQ";
        place = "menu";
      } else if (60 <= mouseX && mouseX <= 180 && 47.5 <= mouseY && mouseY <= 92.5)
        place = "menu"; // back to main menu
    }
  }

  void rulesMenu() {
    background(MM_bgDark);
    if (60 <= mouseX && mouseX <= 180 && 47.5 <= mouseY && mouseY <= 92.5)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(120, 70, 120, 45, 5); // Escape box
    if (ruleSlide != 6) { // checks if the rule slide is not the last slide
      if (800 <= mouseX && mouseX <= 920 && 265 <= mouseY && mouseY <= 315)
        fill(190, 190, 190);
      else
        fill(217, 217, 217);
      rect(860, 290, 120, 50, 5); // next box
      textFont(MMOptions); // change font
      textAlign(CENTER);
      fill(0);
      textSize(20);
      text("Next", 860, 298);
    }
    if (ruleSlide != 1) { // checks if the rule slide is not the first slide
      if (40 <= mouseX && mouseX <= 160 && 265 <= mouseY && mouseY <= 315)
        fill(190, 190, 190);
      else
        fill(217, 217, 217);
      rect(100, 290, 120, 50, 5); // previous box
      textFont(MMOptions); // change font
      textAlign(CENTER);
      fill(0);
      textSize(20);
      text("Previous", 100, 298);
    }

    fill(217, 217, 217); // makes sure that the escape box doesn't make the title box black as well
    rect(480, 60, 300, 60, 5); // title box
    rect(480, 525, 600, 100, 5); // text box
    fill(0); // change text to black
    textSize(40);
    text("Quiz", 480, 75); // text
    textSize(20);
    text("Escape", 120, 75);
    if (ruleSlide == 1) {
      image(slide1, 0, 15); // picutre for slide 1 of rules
      textSize(20);
      text("ArithMagician is a TDSB program designed to teach", 480, 505);
      text("basic arithmetic (addition, subtraction, multiplication,", 480, 535);
      text("division), and the order of operations.", 480, 565); // text split like this so easier to see on small screen
    } else if (ruleSlide == 2) {
      image(slide2, 0, 15); // picutre for slide 2 of rules
      textSize(20);
      text("Click the “Learn” option, and be greeted with", 480, 505);
      text("five educational and interactive videos (one for each", 480, 535);
      text("operation and one for the order of operations).", 480, 565);
    } else if (ruleSlide == 3) {
      image(slide3, 0, 15); // picutre for slide 3 of rules
      textSize(20);
      text("Click the “Quiz” option, and test your arithmetic", 480, 505);
      text("skills with a randomized quiz of your", 480, 535);
      text("selected difficulty.", 480, 565);
    } else if (ruleSlide == 4) {
      image(slide4, 0, 15); // picutre for slide 4 of rules
      textSize(20);
      text("To complete the quiz, simply click one of four answers", 480, 505);
      text("(for multiple choice). For answering questions, click \"Click to", 480, 535);
      text("Answer Question\", and answer in the pop-up screen provided.", 480, 565);
    } else if (ruleSlide == 5) {
      image(slide5, 0, 15); // picutre for slide 5 of rules
      textSize(20);
      text("ArithMagician is a mouse & keyboard game. Use your mouse", 480, 505);
      text("to select and move around through the program, ", 480, 535);
      text("and use your keyboard to type in any required input.", 480, 565);
    } else if (ruleSlide == 6) {
      image(slide6, 0, 15); // picutre for slide 6 of rules
      textSize(20);
      text("Have fun and happy learning!", 480, 535);
    }

    if (mousePressed) {
      delay(200);
      if (ruleSlide != 1 && 40 <= mouseX && mouseX <= 160 && 265 <= mouseY && mouseY <= 315)
        ruleSlide -= 1;
      else if (ruleSlide != 6 && 800 <= mouseX && mouseX <= 920 && 265 <= mouseY && mouseY <= 315)
        ruleSlide += 1;
      else if (60 <= mouseX && mouseX <= 180 && 47.5 <= mouseY && mouseY <= 92.5) {
        ruleSlide = 1;
        place = "menu";
      }
    }
  }

  void credits() {
    background(MM_bgDark);
    if (60 <= mouseX && mouseX <= 180 && 47.5 <= mouseY && mouseY <= 92.5)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(120, 70, 120, 45, 5); // Escape box
    fill(217, 217, 217);
    rect(480, 60, 300, 60, 5); // title box
    rect(480, 340, 700, 400, 5);
    textFont(MMOptions); // change font
    textAlign(CENTER);
    fill(0);
    textSize(35);
    text("Credits", 480, 75); // text
    textSize(20);
    text("Exit", 120, 75);
    text("I couldn't have finished this project without the help and support of my", 480, 200);
    text("family and friends. These people have given me suggestions on my code and", 480, 230);
    text("how to make it better, as well as helping me test my program. Special", 480, 260);
    text("thanks to Zoe F.C., Katia M., Elly P., and my brother, for beta-testing my", 480, 290);
    text("program and acting like consumers. Special thanks to Shane Chen, Kailey", 480, 320);
    text("Cheng, Ryan Atlas, Judah Brill and more, who have talked with me and", 480, 350);
    text("given me suggestions on my code. Special thanks to Mr. Wong, for giving", 480, 380);
    text("me this amazing project to work on and dive into; this project has been", 480, 410);
    text("an absolute blast.", 480, 440);
    text(" - Aaron Zhu", 700, 470);
    textSize(15);
    text("Note: All code was written by Aaron Zhu.", 480, 520);
    textAlign(LEFT);
    textSize(20);

    if (mousePressed) { // based on where mouse is clicked, go to that place
      delay(200);
      if (60 <= mouseX && mouseX <= 180 && 47.5 <= mouseY && mouseY <= 92.5) {
        masterSwitch = "mainMenu"; // back to main menu
        place = "menu";
      }
    }
  }

  void quitMenu() {
    background(MM_bgDark);
    fill(217, 217, 217); // makes sure that the escape box doesn't make the title box black as well
    rect(480, 300, 600, 140, 5); // text box
    textFont(MMOptions); // change font
    textAlign(CENTER);
    fill(0);
    textSize(25);
    text("Thank you for playing ArithMagician,", 480, 270); // text
    text("a learning game designed by Aaron Zhu.", 480, 310);
    text("Have a nice day!", 480, 350);
    int currentSec = second();
    if (currentSec == finalSec)
      masterSwitch = "done"; // calls done (basically black screen)
  }
}
