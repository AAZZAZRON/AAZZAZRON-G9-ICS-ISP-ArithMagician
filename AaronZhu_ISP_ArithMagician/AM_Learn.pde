// learn class
class Learn {
  String operation; // gets the name of the operation the user is learning
  int slides = 0; // slide number
  int tint = 0; // tint variable (fade in)
  int position = 0;
  int x, y = 0; // x and y coords to move objects
  int r, g, b; // get the shade of the colour

  void draw() {
    if (slides == 0 || slides == 9) { // opening title screen
      opening();
    } else {
      if (operation == "Addition")
        slidesAdd();
      else if (operation == "Subtraction")
        slidesSub();
      else if (operation == "Multiplication")
        slidesMulti();
      else if (operation == "Division")
        slidesDivis();
      else if (operation == "Order Of Operations")
        OOOSlides();
    }
  }

  void opening() {
    operation = masterSwitch;
    if (operation == "Addition") { // set line colour to the theme
      r = 39;
      g = 78;
      b = 19;
    } else if (operation == "Subtraction") {
      r = 120;
      g = 63;
      b = 4;
    } else if (operation == "Multiplication") {
      r = 127;
      g = 96;
      b = 0;
    } else if (operation == "Division" || operation == "Order Of Operations") {
      r = 102;
      g = 0;
      b = 0;
    }

    textFont(learnTitle);
    if (operation != "Order Of Operations")
      textSize(80);
    else
      textSize(65);
    tint(tint);
    image(Q_bgLight, 0, 0); // bg is image so that tint() works as well
    image(L_startImage, 0, 0);
    fill(0);
    textAlign(CENTER);
    text("Learn " + operation, 480, 535); // type graphics
    if (tint >= 255) {
      tint = 255;
      delay(1000);
      tint = 0;
      slides += 1;
    } else
      tint += 2.5;
    tint(255);
  }

  void endScreen() { // ending screen
    textFont(learnSub);
    text("Now You Know How", 480, 280);
    text("To Do " + operation + "!", 480, 330);
    textFont(pressKey);
    textSize(20);
    text("Press any key or click mouse to exit to Main Menu.", 480, 430);
    if (mousePressed || keyPressed) { // at the end screen, program detects mouse or key
      delay(200); // sends code to main menu
      position = 0;
      x = 0;
      y = 0;
      slides = 0;
      masterSwitch = "mainMenu";
    }
  }

  void slidesAdd() { // slides for addition
    background(Q_bgDark);
    if (slides == 1) {
      image(borderSmallG, 0, 0);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("What is Addition?", 480, 130);
      textFont(learnFont);
      textSize(25);
      text("Addition is defined as taking two or more numbers, and", 480, 170);
      text("combining their values together. For example, Tommy has 2", 480, 200);
      text("apples. If Jimmy comes over, and gives him 3 more apples,", 480, 230);
      text("Tommy will have 5 apples in total.", 480, 260);

      if (position == 0) // timer to wait four seconds before animations start
        position += 1;
      else if (position == 1) {
        delay(4000);
        position += 1;
      }

      if (position == 2 && x <= 500) { // get apples
        frameRate(95); // speed up
        image(apple, x - 300, 400, 150, 150); // apples
        image(apple, y - 150, 370, 150, 150);
        image(apple, 1100 + -1*x, 340, 150, 150);
        image(apple, 950 + -1*y, 370, 150, 150);
        image(apple, 1150 + x*-1.1, 430, 150, 150);
        textSize(100);
        text("+", 480, 460);
        x += 2;
        y += 1.5;
      } else if (position == 2) { // wait and reset
        frameRate(60); // reset
        delay(1000);
        x = 0;
        y = 0;
        position += 1;
      }
      if (position == 3 && x >= -150) { // move apples closer to one another
        image(apple, 200 + y, 400, 150, 150); // apples
        image(apple, 100 + y, 370, 150, 150);
        image(apple, 600 + x, 340, 150, 150);
        image(apple, 700 + x, 370, 150, 150);
        image(apple, 600 + x, 430, 150, 150);
        x -= 2.5;
        y += 2.5;
      } else if (position == 3) { // wait and reset
        delay(500);
        x = 0;
        y = 0;
        position += 1;
      }
      if (position >= 4 && position <= 8) { // add numbers on the apples to count
        delay(300);
        image(apple, 350, 400, 150, 150);
        image(apple, 250, 370, 150, 150);
        image(apple, 450, 340, 150, 150);
        image(apple, 550, 370, 150, 150);
        image(apple, 450, 430, 150, 150);
        textSize(40);
        if (position >= 4)
          text("1", 325, 470); // count the apples one by one
        if (position >= 5)
          text("2", 425, 500);
        if (position >= 6)
          text("3", 525, 440);
        if (position >= 7)
          text("4", 525, 530);
        if (position >= 8)
          text("5", 625, 470);
        position += 1;
      } else if (position >= 9) {
        if (position == 9) {
          delay(800);
          position += 1;
        }
        image(apple, 350, 400, 150, 150);
        image(apple, 250, 370, 150, 150);
        image(apple, 450, 340, 150, 150);
        image(apple, 550, 370, 150, 150);
        image(apple, 450, 430, 150, 150);
        textSize(40);
        text("1", 325, 470);
        text("2", 425, 500);
        text("3", 525, 440);
        text("4", 525, 530);
        text("5", 625, 470);
        textSize(20);
        text("Press any key to continue.", 480, 315);
      }
      if (position == 10)
        nextSlide();
    } else if (slides == 2) {
      background(Q_bgDark);
      image(borderSmallG, 0, 0, 960, 470);
      textFont(learnSub);
      textSize(40);
      text("The Operation", 480, 130);
      textFont(learnFont);
      textSize(25);
      text("Addition uses an operation that looks like “+”. This symbol is", 480, 170);
      text("known as the Plus Sign, and it is used to represent addition.", 480, 200);
      if (position == 0)
        position += 1;
      else if (position == 1) {
        delay(2500);
        position += 1;
      }
      if (x >= -500 && position == 2) {
        imageMode(CENTER);
        image(addSign, 980 + x, 450, 300, 300); // police plus sign comes in from right
        imageMode(CORNER);
        x -= 10;
      } else if (position == 2) {
        delay(800);
        position += 1;
        x = 0;
      }
      if (position == 3) {
        textSize(20);
        text("Press any key to continue.", 480, 250); // press any key
        imageMode(CENTER);
        image(addSign, 480, 450, 300, 300);
        imageMode(CORNER);
        nextSlide();
      }
    } else if (slides == 3) {
      background(Q_bgDark);
      image(borderSmallG, 0, 0);
      textFont(learnSub);
      textSize(40);
      text("Example One", 480, 130);
      textFont(learnFont);
      textSize(20); // ask question
      text("Jennifer loves to read. Currently, her bookshelf has 21 books.", 480, 170);
      text("One day, Jennifer goes to Indigo, and buys the Harry Potter series,", 480, 200);
      text("a series that she has been longing to read. If the Harry Potter series", 480, 230);
      text("consists of 7 books, how many books will Jennifer have in total?", 480, 260);
      image(bookStore, 620, 250, 350, 350); // bookstore

      if (position == 1) {
        image(jenStand, 678, 485); // jennifer standing in the doorway of library
        textSize(20);
        text("Press any key for the answer.", 480, 325); // press any key
      }
      if (position == 0) {
        if (x + y < 1055) {
          frameRate(90);
          delay(150); // animate Jennifer walking to the bookstore
          if (x % 3 == 0)
            image(walkTwo, -390 + y + x, 485);
          else if (x % 3 == 1)
            image(walkThree, -390 + y + x, 485);
          else if (x % 3 == 2)
            image(walkOne, - 390 + y + x, 485);
          x += 1;
          y += 12;
        } else {
          image(jenStand, 678, 485);
          frameRate(60);
          position += 1;
        }
      }  
      if (position == 1)
        nextSlide();
    } else if (slides == 4) {
      background(Q_bgDark); // outside of loop so it runs all the time
      image(borderBigG, 0, 0);
      textFont(learnSub);
      textSize(40);
      text("Solution", 480, 130);
      textFont(learnFont);
      textSize(20); // text
      text("If you couldn't tell, this was an addition question. When", 480, 170);
      text("Jennifer goes to buy more books, she is combining the books she", 480, 200);
      text("buys with the ones she already has.", 480, 230);
      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(3500);
        position += 2;
      } else if (position >= 1 && position <= 4) {
        if (position == 1 || position == 2)
          delay(1000);
        for (int i = 160; i < 440; i += 40) {  // draw old books
          for (int j = 250; j < 370; j += 40)
            image(book, i, j, 40, 40); // prints 21 books
        }
        if (position >= 1 && position < 3)
          text("Jennifer's current bookshelf", 300, 400);

        if (position >= 2 && position <= 3) { // draw new books
          for (int i = 500; i < 780; i += 40) // prints Jennifer's 7 new books
            image(book, i, 290, 40, 40);
        }
        if (position == 1)
          position += 1;
        else if (position == 2) { 
          text("Jennifer's new books", 640, 400);
          position += 1;
        } else if (position == 3) { // delay
          delay(2000);
          y = 290;
          position += 1;
        } else if (position == 4) { // move new books down
          for (int i = 500; i < 780; i += 40) // prints Jennifer's 7 new books
            image(book, i, y, 40, 40);
          if (y < 370)
            y += 1;
          else {
            delay(500);
            y = 0; // reset y
            x = 0;
            position += 1;
          }
        }
      } else if (position == 5) { // combine the books
        for (int i = 500; i < 780; i += 40) // prints Jennifer's 7 new books
          image(book, i - x, 370, 40, 40);

        for (int i = 160; i < 440; i += 40) { 
          for (int j = 250; j < 370; j += 40)
            image(book, i + x, j, 40, 40); // prints 21 books
        }
        if (x <= 170)
          x += 1;
        else {
          delay(1000);
          x = 0;
          position += 1; // reset
        }
      }
      if (position >= 6 && position <= 9) { // count the books
        delay(400);
        for (int i = 330; i < 610; i += 40) { 
          for (int j = 250; j <= 370; j += 40)
            image(book, i + x, j, 40, 40); // prints 28 books
        }
        if (position >= 6) // count numbers based on positions
          text(7, 630, 280);
        if (position >= 7)
          text(14, 630, 320);
        if (position >= 8)
          text(21, 630, 360);
        if (position >= 9)
          text(28, 630, 400);
        position += 1;
      } else if (position >= 10) {
        if (position == 10) {
          delay(800);
          position += 1;
        } else if (position >= 11) {
          if (position == 11) {
            delay(1000);
            position += 1;
          }
          textSize(15);
          text("Press any key to continue.", 480, 500); // press any key
        }
        for (int i = 330; i < 610; i += 40) { 
          for (int j = 250; j <= 370; j += 40)
            image(book, i + x, j, 40, 40); // prints 28 books
        }
        textSize(20);
        text(7, 630, 280);
        text(14, 630, 320);
        text(21, 630, 360);
        text(28, 630, 400);
        text("21 books + 7 books = 28 books", 480, 440);
        text("Jessica has 28 books on her bookshelf.", 480, 470);

        if (position == 12)
          nextSlide();
      }
    } else if (slides == 5) {
      background(Q_bgDark);
      image(borderSmallG, 0, 0);
      textFont(learnSub);
      textSize(40);
      text("Example Two", 480, 130);
      textFont(learnFont);
      textSize(20); // ask question
      text("Bob Dylan is a rock collector. He currently has 105 unique rocks", 480, 170);
      text("in his collection. One day, Bob Dylan went to Cuba, a place he has never", 480, 200);
      text("been before. There, he found 23 new rocks to add to his collection. After", 480, 230);
      text("his trip to Cuba, how big is Bob Dylan's rock collection?", 480, 260);
      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(2500);
        position += 2;
      }
      if (position == 1) {
        if (x < 550) {
          delay(10); // plane flying
          imageMode(CENTER);
          image(airplane, 480, 470, x, x*0.51);
          imageMode(CORNER);
          x += 5;
        } else
          position += 1;
      }
      if (position == 2) {
        imageMode(CENTER);
        image(airplane, 480, 470, 550, 550*0.51);
        imageMode(CORNER);
        textSize(20);
        text("Press any key for the answer.", 480, 325); // press any key
        nextSlide();
      }
    } else if (slides == 6) {
      background(Q_bgDark); // outside of loop so it runs all the time
      image(borderBigG, 0, 0);
      textFont(learnSub);
      textSize(40);
      text("Solution", 480, 130);
      textFont(learnFont);
      textSize(20); // text
      text("Bob Dylan is combining his current rock collection with the", 480, 170);
      text("new rocks that he found on Cuba. This is addition!", 480, 200);
      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(3500);
        position += 2;
      } else if (position >= 1 && position <= 4) {
        if (position == 1 || position == 2)
          delay(1000);
        for (int i = 130; i < 460; i += 22) {  // draw current rock collection
          for (int j = 230; j < 349; j += 17)
            image(rock, i, j, 30, 15.9); // prints 105 rocks
        }
        if (position >= 1 && position < 3)
          text("Bob Dylan's current rock collection", 300, 380);

        if (position >= 2 && position <= 3) { // draw new rocks
          for (int i = 500; i < 830; i += 22) // prints Bob Dylan's 23 new rocks
            image(rock, i, 264, 30, 15.9);
          for (int i = 500; i < 676; i += 22)
            image(rock, i, 281, 30, 15.9);
        }
        if (position == 1)
          position += 1;
        else if (position == 2) { 
          text("Bob Dylan's new rocks", 660, 380);
          position += 1;
        } else if (position == 3) { // delay
          delay(2000);
          y = 264;
          position += 1;
        } else if (position == 4) { // move new rocks down
          for (int i = 500; i < 830; i += 22) // prints Bob Dylan's 23 new rocks
            image(rock, i, y, 30, 15.9);
          for (int i = 500; i < 676; i += 22)
            image(rock, i, y + 17, 30, 15.9);
          if (y < 349)
            y += 1;
          else {
            delay(500);
            y = 0; // reset y
            x = 0;
            position += 1;
          }
        }
      } else if (position == 5) { // combine the rocks
        for (int i = 500; i < 830; i += 22) // prints Bob Dylan's 23 new rocks
          image(rock, i - x, 349, 30, 15.9);
        for (int i = 500; i < 676; i += 22)
          image(rock, i - x, 366, 30, 15.9);

        for (int i = 130; i < 460; i += 22) {  // draw current rock collection
          for (int j = 230; j < 349; j += 17)
            image(rock, i + x, j, 30, 15.9); // prints 105 rocks
        }
        if (x <= 185)
          x += 1;
        else {
          delay(1000);
          x = 0;
          position += 1; // reset
        }
      }
      if (position >= 6 && position <= 14) { // count the rocks
        delay(400);
        for (int i = 315; i < 645; i += 22) {  // draw current rock collection
          for (int j = 230; j < 366; j += 17)
            image(rock, i, j, 30, 15.9); // prints all rocks
        }
        for (int i = 315; i < 491; i += 22)
          image(rock, i, 366, 30, 15.9);
        textSize(15);
        if (position >= 6) // count numbers based on positions
          text(15, 670, 242);
        if (position >= 7)
          text(30, 670, 259);
        if (position >= 8)
          text(45, 670, 276);
        if (position >= 9)
          text(60, 670, 293);
        if (position >= 10)
          text(75, 670, 310);
        if (position >= 11)
          text(90, 670, 327);
        if (position >= 12)
          text(105, 670, 344);
        if (position >= 13)
          text(120, 670, 361);
        if (position >= 14)
          text(128, 670, 378);
        textSize(20);
        position += 1;
      } else if (position >= 15) {
        if (position == 15) {
          delay(800);
          position += 1;
        } else if (position >= 16) {
          if (position == 16) {
            delay(800);
            position += 1;
          }
          textSize(15);
          text("Press any key to continue.", 480, 500); // press any key
        }
        for (int i = 315; i < 645; i += 22) {  // draw current rock collection
          for (int j = 230; j < 366; j += 17)
            image(rock, i, j, 30, 15.9); // prints all rocks
        }
        for (int i = 315; i < 491; i += 22)
          image(rock, i, 366, 30, 15.9);
        textSize(15);
        text(15, 670, 242);
        text(30, 670, 259);
        text(45, 670, 276);
        text(60, 670, 293);
        text(75, 670, 310);
        text(90, 670, 327);
        text(105, 670, 344);
        text(120, 670, 361);
        text(128, 670, 378);
        textSize(20);
        text("105 rocks + 23 rocks = 128 rocks", 480, 430);
        text("Bob Dylan has 128 unique rocks in his rock collection.", 480, 460);

        if (position == 17)
          nextSlide();
      }
    } else if (slides == 7) {
      background(Q_bgDark);
      image(borderSmallG, 0, 0);
      textFont(learnSub);
      textSize(40);
      text("Example Three", 480, 130);
      textFont(learnFont);
      textSize(20); // ask question
      text("Ravi's delivery truck usually carries 150 kilograms of packages.", 480, 170);
      text("One day, as Ravi is delivering packages, one of his clients gives him", 480, 200);
      text("94 more kilograms of packages. Assuming Ravi's truck can handle the extra", 480, 230);
      text("weight, how many kilograms of packages are now on the truck?", 480, 260);
      if (position == 0) {
        if (x < 1160) {
          delay(10); // truck driving
          image(truck, -500 + x, 420, 300, 187.5);
          x += 4;
        } else
          position += 1;
      }
      if (position == 1) {
        image(truck, 660, 420, 300, 187.5);
        textSize(20);
        text("Press any key for the answer.", 480, 320); // press any key
        nextSlide();
      }
    } else if (slides == 8) {
      background(Q_bgDark); // outside of loop so it runs all the time
      image(borderBigG, 0, 0);
      textFont(learnSub);
      textSize(40);
      text("Solution", 480, 130);
      textFont(learnFont);
      textSize(20); // text
      text("Ravi's truck already has 150 kilograms of packages. If we want", 480, 175);
      text("to add more package weight to his truck, we need to do addition.", 480, 205);
      if (position == 0) // this if is for delay; gives user time to read the text
        position -= 1;
      else if (position == -1) {
        delay(3500);
        position += 2;
      } else if (position >= 1 && position <= 4) {
        if (position == 1 || position == 2)
          delay(1000);
        for (int i = 140; i < 470; i += 22) {  // draw truck's current weight
          for (int j = 220; j < 380; j += 16)
            image(weight, i, j, 20, 15); // prints 150 1kg weights
        }
        if (position >= 1 && position < 3) {
          text("Weight of Packages on Ravi's truck", 305, 400);
          text("(in one kilogram weights)", 305, 425);
        }

        if (position >= 2 && position <= 3) { // draw added weight
          for (int i = 490; i < 820; i += 22) {
            for (int j = 236; j < 332; j += 16)
              image(weight, i, j, 20, 15); // prints 90 1kg weights
          }
          for (int i = 490; i < 578; i += 22) // prints the remaining 4
            image(weight, i, 332, 20, 15);
        }
        if (position == 1)
          position += 1;
        else if (position == 2) { 
          text("Ravi's added weight", 665, 400);
          position += 1;
        } else if (position == 3) { // delay
          delay(2000);
          y = 0;
          position += 1;
        } else if (position == 4) {  // move weights down
          for (int i = 490; i < 820; i += 22) { 
            for (int j = 236; j < 332; j += 16)
              image(weight, i, j + y, 20, 15); // prints 90 1kg weights
          }
          for (int i = 490; i < 578; i += 22) // prints the remaining 4
            image(weight, i, 332 + y, 20, 15);
          if (y < 144)
            y += 1;
          else {
            delay(500);
            y = 0; // reset y
            x = 0;
            position += 1;
          }
        }
      } else if (position == 5) { // combine the weights
        for (int i = 490; i < 820; i += 22) { 
          for (int j = 236; j < 332; j += 16)
            image(weight, i - x, j + 144, 20, 15); // prints 90 1kg weights
        }
        for (int i = 490; i < 578; i += 22) // prints the remaining 4
          image(weight, i - x, 332 + 144, 20, 15);

        for (int i = 140; i < 470; i += 22) {  
          for (int j = 220; j < 380; j += 16)
            image(weight, i + x, j, 20, 15); // prints 150 1kg weights
        }
        if (x < 175)
          x += 1;
        else {
          delay(1000);
          position += 1; // reset
        }
      } else if (position >= 6 && position <= 22) { // count the weights
        delay(400);
        for (int i = 315; i < 403; i += 22) // prints the remaining 4
          image(weight, i, 476, 20, 15);
        for (int i = 315; i < 645; i += 22) {  
          for (int j = 220; j < 476; j += 16)
            image(weight, i, j, 20, 15); // prints 150 1kg weights
        }

        textSize(15);
        if (position >= 6)
          text(15, 660, 234);
        if (position >= 7)
          text(30, 660, 250);
        if (position >= 8)
          text(45, 660, 266);
        if (position >= 9)
          text(60, 660, 282);
        if (position >= 10)
          text(75, 660, 298);
        if (position >= 11)
          text(90, 660, 314);
        if (position >= 12)
          text(105, 660, 330);
        if (position >= 13)
          text(120, 660, 346);
        if (position >= 14)
          text(135, 660, 362);
        if (position >= 15)
          text(150, 660, 378);
        if (position >= 16)
          text(165, 660, 394);
        if (position >= 17)
          text(180, 660, 410);
        if (position >= 18)
          text(195, 660, 426);
        if (position >= 19)
          text(210, 660, 442);
        if (position >= 20)
          text(225, 660, 458);
        if (position >= 21)
          text(240, 660, 474);
        if (position >= 22)
          text(244, 660, 490);
        textSize(20);
        position += 1;
      } else if (position >= 23) {
        if (position == 23) {
          delay(800);
          position += 1;
        } else if (position >= 24) {
          if (position == 24) {
            delay(800);
            position += 1;
          }
          textSize(15);
          text("Press any key to continue.", 480, 510); // press any key
        }
        for (int i = 315; i < 403; i += 22) // prints all weights
          image(weight, i, 476, 20, 15);
        for (int i = 315; i < 645; i += 22) {  
          for (int j = 220; j < 476; j += 16)
            image(weight, i, j, 20, 15);
        }
        textSize(15);
        text(15, 660, 234);
        text(30, 660, 250);
        text(45, 660, 266);
        text(60, 660, 282);
        text(75, 660, 298);
        text(90, 660, 314);
        text(105, 660, 330);
        text(120, 660, 346);
        text(135, 660, 362);
        text(150, 660, 378);
        text(165, 660, 394);
        text(180, 660, 410);
        text(195, 660, 426);
        text(210, 660, 442);
        text(225, 660, 458);
        text(240, 660, 474);
        text(244, 660, 490);
        textSize(20);
        fill(255);
        text("150 kilograms + 94 kilograms = 244 kilograms", 480, 550);
        text("Ravi's truck has 244 kilograms of packages.", 480, 580);
        fill(0);

        if (position == 25)
          nextSlide();
      }
    } else if (slides == 10) { // ending screen
      image(borderBigG, 0, 0);
      endScreen();
    }
  }

  void slidesSub() {
    background(Q_bgDark);
    if (slides == 1) {
      image(borderSmallO, 0, -15);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("What is Subtraction?", 480, 130);
      textFont(learnFont);
      textSize(25);
      text("Subtraction is the process of taking one amount away from", 480, 170);
      text("another amount. The result of a subtraction problem is known", 480, 200);
      text("as the difference.", 480, 230);
      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(4000);
        position += 2;
      }
      if (x <= 250 && position == 1) { // fades in peaches
        imageMode(CENTER);
        image(peaches, 480, 470, x*1.27, x);
        imageMode(CORNER);
        x += 2;
      } else if (position == 1) {
        imageMode(CENTER);
        image(peaches, 480, 470, x*1.27, x);
        imageMode(CORNER);
        textSize(20);
        text("Press any key to continue.", 480, 300); // press any key
        nextSlide();
      }
    } else if (slides == 2) {
      image(borderSmallO, 0, -15);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("The Operation", 480, 130);
      textFont(learnFont);
      textSize(25);
      text("Subtraction uses an operation that looks like “-”. This symbol", 480, 170);
      text("is known as the Minus Sign, and it is used to represent", 480, 200);
      text("subtraction.", 480, 230);
      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(4000);
        position += 2;
      }
      if (x < 360 && position == 1) {
        pushMatrix(); // spins minus sign onto screen
        translate(480, 450);
        rotate(radians(x));
        imageMode(CENTER);
        image(minusSign, 360 - x, 360 - x, x*1.45, x);
        imageMode(CORNER);
        popMatrix();
        x += 2;
      } else if (position == 1) {
        imageMode(CENTER);
        image(minusSign, 480, 450, x*1.45, x);
        imageMode(CORNER);
        textSize(20);
        text("Press any key to continue.", 480, 280); // press any key
        nextSlide();
      }
    } else if (slides == 3) {
      background(Q_bgDark);
      image(forestFire, 0, 330, 480, 270);
      image(forestFire2, 480, 330, 480, 300);
      image(borderSmallO, 0, 0);
      textFont(learnSub);
      textSize(40);
      text("Example One", 480, 130);
      textFont(learnFont);
      textSize(20); // text
      text("There are 12 trees in a forest. A forest fire occurs, and 5 of the", 480, 170);
      text("trees burn up and die. Assuming the fire only spread to the 5 dead trees,", 480, 200);
      text("how many trees are left in the forest?", 480, 230);

      if (position == 0)
        position = 1;
      else if (position == 1) {
        delay(3500);
        position += 1;
      } else if (position == 2) {
        textSize(20);
        text("Press any key to for the answer.", 480, 300); // press any key
        nextSlide();
      }
    } else if (slides == 4) {
      background(Q_bgDark);
      image(borderBigO, 0, 0);
      textFont(learnSub);
      textSize(40);
      text("Solution", 480, 130);
      textFont(learnFont);
      textSize(20); // text
      text("If there were 12 trees, and 5 died, how many trees are left?", 480, 170);
      text("This is a subtraction problem, and we are taking away trees from", 480, 200);
      text("the forest.", 480, 230);
      if (position >= 1 && position <= 20) { // trees before some burn
        for (int i = 205; i < 805; i += 50) {
          imageMode(CENTER);
          image(tree, i, 300, 50, 96);
          imageMode(CORNER);
        }
      } else if (position >= 22) { // draw remaining trees
        for (int i = 205; i < 555; i += 50) {
          imageMode(CENTER);
          image(tree, i + x, 300, 50, 96);
          imageMode(CORNER);
        }
      }
      if (position == 0)
        position += 1;
      else if (position == 1) {
        delay(3500);
        position += 1;
      } else if (position >= 2 && position <= 14) {
        delay(400); // number the trees
        if (position >= 2)
          text(1, 205, 370);
        if (position >= 3)
          text(2, 255, 370);
        if (position >= 4)
          text(3, 305, 370);
        if (position >= 5)
          text(4, 355, 370);
        if (position >= 6)
          text(5, 405, 370);
        if (position >= 7)
          text(6, 455, 370);
        if (position >= 8)
          text(7, 505, 370);
        if (position >= 9)
          text(8, 555, 370);
        if (position >= 10)
          text(9, 605, 370);
        if (position >= 11)
          text(10, 655, 370);
        if (position >= 12)
          text(11, 705, 370);
        if (position >= 13)
          text(12, 755, 370);
        if (position == 14)
          delay(800);
        position += 1;
      } else if (position >= 15 && position <= 20) { // burn some trees
        delay(500);
        if (position >= 15)
          image(fire, 730, 300, 50, 50);
        if (position >= 16)
          image(fire, 680, 300, 50, 50);
        if (position >= 17)
          image(fire, 630, 300, 50, 50);
        if (position >= 18)
          image(fire, 580, 300, 50, 50);
        if (position >= 19)
          image(fire, 530, 300, 50, 50);
        if (position == 20)
          delay(1000);
        position += 1;
      } else if (position == 21) {
        for (int i = 205; i < 555; i += 50) {
          imageMode(CENTER);
          image(tree, i + x, 300, 50, 96);
          imageMode(CORNER);
        }
        if (x < 125)
          x += 1;
        else if (position == 21) {
          delay(500);
          position += 1;
        }
      } else if (position >= 22) {
        if (position <= 28)
          delay(400); // number the remaining trees
        if (position >= 22)
          text(1, 205 + x, 370);
        if (position >= 23)
          text(2, 255 + x, 370);
        if (position >= 24)
          text(3, 305 + x, 370);
        if (position >= 25)
          text(4, 355 + x, 370);
        if (position >= 26)
          text(5, 405 + x, 370);
        if (position >= 27)
          text(6, 455 + x, 370);
        if (position >= 28)
          text(7, 505 + x, 370);
        if (position == 29 || position == 31)
          delay(800);

        if (position >= 30) { // print answer
          text("12 trees - 5 trees = 7 remaining trees", 480, 420);
          text("There are 7 trees left in the forest.", 480, 450);
        }
        if (position == 32) {
          textSize(20);
          text("Press any key to continue.", 480, 500); // press any key
          nextSlide();
        }
        if (position <= 31)
          position += 1;
      }
    } else if (slides == 5) {
      background(Q_bgDark);
      image(borderSmallO, 0, 0);
      textFont(learnSub);
      textSize(40);
      text("Example Two", 480, 130);
      textFont(learnFont);
      textSize(20); // text
      text("Jacob's pet monkey loves bananas. Jacob bought 121 bananas for his pet", 480, 170);
      text("monkey to eat. Much to his surprise, his pet monkey only ate 64 bananas.", 480, 200);
      text("How many bananas does Jacob have left?", 480, 230);
      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(2500);
        position += 2;
      }
      if (position == 1) { // send in monkey
        if (x <= 500) {
          image(monkey, -500 + x, 200);
          x += 2;
        } else {
          image(monkey, -500 + x, 200);
          textSize(20);
          text("Press any key to continue.", 480, 300); // press any key
          nextSlide();
        }
      }
    } else if (slides == 6) {
      background(Q_bgDark);
      image(borderBigO, 0, 0);
      textFont(learnSub);
      textSize(40);
      text("Solution", 480, 130);
      textFont(learnFont);
      textSize(20); // text
      text("Jacob's pet monkey ate, or subtracted, 64 of the 121 bananas", 480, 170);
      text("that Jacob bought. We need to use subtraction to solve this problem.", 480, 200);
      if (position >= 1 && position <= 20) { // all bananas
        for (int i = 330; i < 630; i += 25) {
          for (int j = 220; j < 495; j += 25)
            image(banana, i, j, 25, 25);
        }
      }

      if (position >= 21) {
        for (int i = 330; i < 630; i += 25) { // after bananas are eaten
          for (int j = 220; j < 345; j += 25)
            image(banana, i, j, 25, 25);
        }
        for (int i = 330; i < 380; i += 25)
          image(banana, i, 345, 25, 25);
      }

      if (position == 0)
        position += 1;
      else if (position == 1) {
        delay(4500);
        position += 1;
      } else if (position >= 2 && position <= 13) {
        delay(400); // number the bananas
        if (position >= 2)
          text(11, 650, 235);
        if (position >= 3)
          text(22, 650, 260);
        if (position >= 4)
          text(33, 650, 285);
        if (position >= 5)
          text(44, 650, 310);
        if (position >= 6)
          text(55, 650, 335);
        if (position >= 7)
          text(66, 650, 360);
        if (position >= 8)
          text(77, 650, 385);
        if (position >= 9)
          text(88, 650, 410);
        if (position >= 10)
          text(99, 650, 435);
        if (position >= 11)
          text(110, 650, 460);
        if (position >= 12)
          text(121, 650, 485);
        if (position == 13)
          delay(800);
        position += 1;
      } else if (position >= 14 && position <= 20) {
        stroke(204, 0, 0);
        delay(400);
        if (position >= 14)
          line(320, 483, 640, 483); // cross off eaten bananas
        if (position >= 15)
          line(320, 458, 640, 458);
        if (position >= 16)
          line(320, 433, 640, 433);
        if (position >= 17)
          line(320, 408, 640, 408);
        if (position >= 18)
          line(320, 383, 640, 383);
        if (position >= 19)
          line(385, 358, 640, 358);
        if (position == 20)
          delay(800);
        position += 1;
        stroke(r, g, b);
      } else if (position == 21) {
        delay(800);
        position += 1;
      } else if (position >= 22) {
        if (position >= 22 && position <= 28)
          delay(400); // number the remaining bananas
        if (position >= 22)
          text(11, 650, 235);
        if (position >= 23)
          text(22, 650, 260);
        if (position >= 24)
          text(33, 650, 285);
        if (position >= 25)
          text(44, 650, 310);
        if (position >= 26)
          text(55, 650, 335);
        if (position >= 27)
          text(57, 650, 360);
        if (position >= 28 && position <= 30)
          delay(800);

        if (position >= 29) { // print answer
          text("121 bananas - 64 bananas = 57 bananas left", 480, 420);
          text("Jacob has 57 bananas left.", 480, 450);
        }
        if (position == 31) {
          textSize(20);
          text("Press any key to continue.", 480, 500); // press any key
          nextSlide();
        }
        if (position <= 30)
          position += 1;
      }
    } else if (slides == 7) {
      background(Q_bgDark);
      image(borderSmallO, 0, 0);
      textFont(learnSub);
      textSize(40);
      text("Example Three", 480, 130);
      textFont(learnFont);
      textSize(20); // text
      text("Max is riding on a boat, with 342 pages of notes on him. Suddenly,", 480, 170);
      text("a wave hits the boat and soaks 146 of his notes, making them unusable.", 480, 200);
      text("How many of Max's notes are usable now?", 480, 230);

      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(3500);
        position += 2;
      }

      if (position == 1) {
        if (x <= 1000) {
          image(boat, -500 + x, 400);
          x += 5;
        } else {
          image(boat, -500 + x, 400);
          textSize(20);
          text("Press any key to continue.", 480, 300); // press any key
          nextSlide();
        }
      }
    } else if (slides == 8) {
      background(Q_bgDark);
      image(borderBigO, 0, 0);
      textFont(learnSub);
      textSize(40);
      text("Solution", 480, 130);
      textFont(learnFont);
      textSize(20); // text
      text("Poor Max, he lost 146 of his 342 notes. How many notes", 480, 170);
      text("does he still have though? We can use subtraction to figure this out.", 480, 200);

      if (position >= 1 && position <= 21) { // all pages of notes
        tint(230);
        for (int i = 262; i < 712; i += 15) {
          for (int j = 220; j < 440; j += 20) {
            imageMode(CENTER);
            image(notes, i, j, 20, 20);
            imageMode(CORNER);
          }
        }
        imageMode(CENTER);
        image(notes, 262, 440, 20, 20);
        imageMode(CORNER);
        tint(255);
      }
      if (position >= 22) { // leftover pages of notes
        tint(230);
        for (int i = 262; i < 712; i += 15) {
          for (int j = 220; j < 340; j += 20) {
            imageMode(CENTER);
            image(notes, i, j, 20, 20);
            imageMode(CORNER);
          }
        }
        for (int i = 262; i < 412; i += 15) {
          imageMode(CENTER);
          image(notes, i, 340, 20, 20);
          imageMode(CORNER);
        }
        tint(255);
      }

      if (position == 0)
        position += 1;
      else if (position == 1) {
        delay(4500);
        position += 1;
      } else if (position >= 2 && position <= 14) {
        delay(400); // number the notes
        textSize(15);
        if (position >= 2)
          text(31, 720, 225);
        if (position >= 3)
          text(62, 720, 245);
        if (position >= 4)
          text(93, 720, 265);
        if (position >= 5)
          text(124, 720, 285);
        if (position >= 6)
          text(155, 720, 305);
        if (position >= 7)
          text(186, 720, 325);
        if (position >= 8)
          text(217, 720, 345);
        if (position >= 9)
          text(248, 720, 365);
        if (position >= 10)
          text(279, 720, 385);
        if (position >= 11)
          text(310, 720, 405);
        if (position >= 12)
          text(341, 720, 425);
        if (position >= 13)
          text(342, 720, 445);
        if (position == 14)
          delay(800);
        position += 1;
      } else if (position >= 15 && position <= 21) {
        stroke(204, 0, 0);
        delay(400);
        if (position >= 15)
          line(253, 440, 270, 440); // cross off unusable sheets
        if (position >= 16)
          line(253, 420, 705, 420);
        if (position >= 17)
          line(253, 400, 705, 400);
        if (position >= 18)
          line(253, 380, 705, 380);
        if (position >= 19)
          line(253, 360, 705, 360);
        if (position >= 20)
          line(405, 340, 705, 340);
        if (position == 21)
          delay(800);
        position += 1;
        stroke(r, g, b);
      } else if (position >= 22) {
        if (position >= 22 && position <= 28)
          delay(400); // number the remaining notes
        textSize(15);
        if (position >= 22)
          text(31, 720, 225);
        if (position >= 23)
          text(62, 720, 245);
        if (position >= 24)
          text(93, 720, 265);
        if (position >= 25)
          text(124, 720, 285);
        if (position >= 26)
          text(155, 720, 305);
        if (position >= 27)
          text(186, 720, 325);
        if (position >= 28)
          text(196, 720, 345);
        if (position >= 29 && position <= 30)
          delay(800);
        textSize(20);

        if (position >= 29) { // print answer
          text("342 notes - 146 notes = 196 notes left", 480, 420);
          text("Max still has 196 usable notes left.", 480, 450);
        }
        if (position == 31) {
          textSize(20);
          text("Press any key to continue.", 480, 500); // press any key
          nextSlide();
        }
        if (position <= 30)
          position += 1;
      }
    } else if (slides == 10) {
      image(borderBigO, 0, 0);
      endScreen();
    }
  }

  void slidesMulti() {
    background(Q_bgDark);
    if (slides == 1) {
      image(borderSmallY, 0, -15);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("What is Multiplication?", 480, 130);
      textFont(learnFont);
      textSize(25);
      text("Multiplication is a quick and powerful way to add the same", 480, 170);
      text("number over and over again. If you know addition, multiplication", 480, 200);
      text("isn't really that hard. The answer of a multiplication problem is", 480, 230);
      text("known as the product.", 480, 260);
      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(3000);
        position += 2;
      }

      if (x <= 680 && position == 1) {
        imageMode(CENTER);
        image(multiTable, -200 + x, 450, 250, 250);
        imageMode(CORNER);
        x += 5;
      } else if (position == 1) {
        imageMode(CENTER);
        image(multiTable, -200 + x, 450, 250, 250);
        imageMode(CORNER);
        textSize(20);
        text("Press any key to continue.", 480, 300); // press any key
        nextSlide();
      }
    } else if (slides == 2) {
      image(borderSmallY, 0, -15);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("The Operation", 480, 130);
      textFont(learnFont);
      textSize(25);
      text("Multiplication uses the “x” symbol. This symbol is known as the", 480, 170);
      text("Times Symbol. Other ways of showing multiplication include the", 480, 200);
      text("“*” symbol, or through the use of brackets (eg. (5)(6)).", 480, 230);

      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(3000);
        position += 2;
      }

      if (x <= 700 && position == 1) {
        imageMode(CENTER);
        image(multiSign, 1180 - x, 480, 350, 350);
        imageMode(CORNER);
        x += 5;
      } else if (position == 1) {
        imageMode(CENTER);
        image(multiSign, 1180 - x, 480, 350, 350);
        imageMode(CORNER);
        textSize(20);
        text("Press any key to continue.", 480, 300); // press any key
        nextSlide();
      }
    } else if (slides == 3) { 
      image(borderSmallY, 0, 0);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("Example One", 480, 130);
      textFont(learnFont);
      textSize(25);
      text("Terrace is part of an alien race that has 6 fingers on", 480, 170);
      text("each hand. If Terrace has 4 hands, how many fingers does", 480, 200);
      text("he have?", 480, 230);

      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(4000);
        position += 2;
      }
      if (x < 360 && position == 1) {
        pushMatrix(); // spins minus sign onto screen
        translate(480, 450);
        rotate(radians(-x));
        imageMode(CENTER);
        image(alien, 0, 0, x - 100, x - 100);
        imageMode(CORNER);
        popMatrix();
        x += 2;
      } else if (position == 1) {
        imageMode(CENTER);
        image(alien, 480, 450, x - 100, x - 100);
        imageMode(CORNER);
        textSize(20);
        text("Press any key to show answer.", 480, 280); // press any key
        nextSlide();
      }
    } else if (slides == 4) {
      image(borderBigY, 0, 0);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("Solution", 480, 130);
      textFont(learnFont);
      textSize(20);
      text("We could solve this problem by doing 6 + 6 + 6 + 6,", 480, 170);
      text("but that would be slow and not efficient. Instead, we should", 480, 200);
      text("use multiplication, which is faster and easier to do.", 480, 230);
      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(4500);
        position += 2;
      }
      if (position >= 7) {
        for (int i = 430; i < 670; i += 40) {
          for (int j = 260; j < 460; j += 50) {
            imageMode(CENTER);
            image(finger, i - x, j, 50, 50);
            imageMode(CORNER);
          }
        }
      }
      if (position >= 1 && position <= 5) { // display hands
        if (position == 1) {
          textAlign(RIGHT);
          text("One Hand = ", 420, 270);
          textAlign(LEFT);
        }
        for (int i = 430; i < 670; i += 40) {
          imageMode(CENTER);
          image(finger, i, 260, 50, 50);
          imageMode(CORNER);
        }
      }
      if (position >= 2 && position <= 5) {
        if (position == 2) {
          textAlign(RIGHT);
          text("Two Hands = ", 420, 270);
          textAlign(LEFT);
        }
        for (int i = 430; i < 670; i += 40) {
          imageMode(CENTER);
          image(finger, i, 310, 50, 50);
          imageMode(CORNER);
        }
      }
      if (position >= 3 && position <= 5) {
        if (position == 3) {
          textAlign(RIGHT);
          text("Three Hands = ", 420, 270);
          textAlign(LEFT);
        }
        for (int i = 430; i < 670; i += 40) {
          imageMode(CENTER);
          image(finger, i, 360, 50, 50);
          imageMode(CORNER);
        }
      }
      if (position >= 4 && position <= 5) {
        if (position == 4) {
          textAlign(RIGHT);
          text("Four Hands = ", 420, 270);
          textAlign(LEFT);
        }
        for (int i = 430; i < 670; i += 40) {
          imageMode(CENTER);
          image(finger, i, 410, 50, 50);
          imageMode(CORNER);
        }
        textAlign(LEFT);
      }
      if (position >= 1 && position <= 4) {
        delay(800);
        position += 1;
      } else if (position == 5 || position == 7 || position == 12 || position == 14) {
        delay(1000);
        position += 1;
      }
      if (position == 6) {
        if (x < 60) {
          for (int i = 430; i < 670; i += 40) {
            for (int j = 260; j < 460; j += 50) {
              imageMode(CENTER);
              image(finger, i - x, j, 50, 50);
              imageMode(CORNER);
            }
          }
          x += 1;
        } else {
          for (int i = 430; i < 670; i += 40) {
            for (int j = 260; j < 460; j += 50) {
              imageMode(CENTER);
              image(finger, i - x, j, 50, 50);
              imageMode(CORNER);
            }
          }
          position += 1;
        }
      } else if (position >= 8) { // count hands
        if (position <= 11)
          delay(800);
        if (position >= 8)
          text(6, 345, 270);
        if (position >= 9)
          text(12, 340, 320);
        if (position >= 10)
          text(18, 340, 370);
        if (position >= 11)
          text(24, 340, 420);
        if (position <= 12)
          position += 1;
      }
      if (position >= 13) {
        textAlign(CENTER);
        if (position == 13)
          position += 1;
        if (position >= 13) { // print answer
          text("6 fingers x 4 hands = 24 fingers in total", 480, 460);
          text("Terrace has 24 fingers!", 480, 490);
        }
        if (position == 15) {
          textSize(15);
          text("Press any key to continue.", 480, 515); // press any key
          nextSlide();
        }
      }
    } else if (slides == 5) {
      image(borderSmallY, 0, 0);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("Example Two", 480, 130);
      textFont(learnFont);
      textSize(20);
      text("Zoe wants to buy computer keyboard keys. She has her eyes set", 480, 170);
      text("on a newly invented keyboard that has 16 keys. If Zoe decides", 480, 200);
      text("to buy three of these keyboards, how many keys will she have?", 480, 230);

      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(3000);
        position += 2;
      }
      if (x < 660 && position == 1) {
        imageMode(CENTER);
        image(keyboard, -180 + x, 450, 300, 236);
        imageMode(CORNER);
        x += 5;
      } else if (position == 1) {
        imageMode(CENTER);
        image(keyboard, 480, 450, 300, 236);
        imageMode(CORNER);
        textSize(20);
        text("Press any key to show answer.", 480, 300); // press any key
        nextSlide();
      }
    } else if (slides == 6) {
      image(borderBigY, 0, 0);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("Solution", 480, 130);
      textFont(learnFont);
      textSize(20);
      text("This is a multiplication question, if you couldn't tell.", 480, 170);
      text("We need to multiply 16 by 3.", 480, 200);

      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(4500);
        position += 2;
      }
      if (position >= 1 && position <= 4) { // display keys
        if (position == 1) {
          textAlign(RIGHT);
          text("One Keyboard = ", 310, 240);
          textAlign(LEFT);
        }
        for (int i = 320; i < 800; i += 30) {
          imageMode(CENTER);
          image(keys, i, 230, 30, 30);
          imageMode(CORNER);
        }
      }
      if (position >= 2 && position <= 4) {
        if (position == 2) {
          textAlign(RIGHT);
          text("Two Keyboards = ", 310, 240);
          textAlign(LEFT);
        }
        for (int i = 320; i < 800; i += 30) {
          imageMode(CENTER);
          image(keys, i, 280, 30, 30);
          imageMode(CORNER);
        }
      }
      if (position >= 3 && position <= 4) {
        if (position == 3) {
          textAlign(RIGHT);
          text("Three Keyboards = ", 310, 240);
          textAlign(LEFT);
        }
        for (int i = 320; i < 800; i += 30) {
          imageMode(CENTER);
          image(keys, i, 330, 30, 30);
          imageMode(CORNER);
        }
      }
      if (position >= 1 && position <= 3) {
        delay(800);
        position += 1;
      } else if (position == 4 || position == 11) {
        delay(1000);
        position += 1;
      }
      if (position == 5) {
        if (x < 65) {
          for (int i = 320; i < 800; i += 30) {
            for (int j = 230; j < 380; j += 50) {
              imageMode(CENTER);
              image(keys, i - x, j, 30, 30);
              imageMode(CORNER);
            }
          }
          x += 1;
        } else {
          delay(1000);
          position += 1;
        }
      }
      if (position >= 6) { // draw the keys in the center
        for (int i = 320; i < 800; i += 30) {
          for (int j = 230; j < 380; j += 50) {
            imageMode(CENTER);
            image(keys, i - x, j, 30, 30);
            imageMode(CORNER);
          }
        }
        if (position <= 9)
          delay(800);
        if (position >= 6)
          text(16, 750, 235);
        if (position >= 7)
          text(32, 750, 285);
        if (position >= 8)
          text(48, 750, 335);
        if (position <= 9)
          position += 1;
      }
      if (position >= 10) {
        textAlign(CENTER);

        if (position >= 10) { // print answer
          text("16 keys x 3 keyboards = 48 keys", 480, 400);
          text("Zoe will have 48 keys.", 480, 430);
        }
        if (position == 10)
          position += 1;
        if (position == 12) {
          textSize(15);
          text("Press any key to continue.", 480, 480); // press any key
          nextSlide();
        }
      }
    } else if (slides == 7) {
      image(borderSmallY, 0, 0);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("Example Three", 480, 130);
      textFont(learnFont);
      textSize(25);
      text("A box of matches contains 14 matchsticks. If Rachael buys", 480, 170);
      text("9 boxes of matches, how many matchsticks will she have?", 480, 200);

      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(4000);
        position += 2;
      }
      if (x < 660 && position == 1) {
        imageMode(CENTER);
        image(matchClose, 1140 - x, 450, 270, 270);
        imageMode(CORNER);
        x += 3;
      } else if (position == 1) {
        delay(1000);
        position += 1;
        imageMode(CENTER);
        image(matchClose, 480, 450, 270, 270);
        imageMode(CORNER);
      } else if (position == 2) {
        imageMode(CENTER);
        image(matchOpen, 480, 450, 300, 300);
        imageMode(CORNER);
        textSize(20);
        text("Press any key to show answer.", 480, 300); // press any key
        nextSlide();
      }
    } else if (slides == 8) {
      image(borderBigY, 0, 0);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("Solution", 480, 130);
      textFont(learnFont);
      textSize(20);
      text("If you solve this problem using addition, you wouldn't be", 480, 170);
      text("wrong. But there is a much better way through the use of", 480, 200);
      text("multiplication.", 480, 230);

      if (position >= 11) {
        for (int i = 360; i < 770; i += 30) {
          for (int j = 260; j < 440; j += 20) {
            imageMode(CENTER);
            image(match, i - x, j, 30, 30);
            imageMode(CORNER);
          }
        }
      }

      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(4500);
        position += 2;
      }

      if (position >= 1 && position <= 10) { // display matchboxes
        if (position == 1) {
          textAlign(RIGHT);
          text("One Matchbox = ", 350, 265);
          textAlign(LEFT);
        }
        for (int i = 360; i < 770; i += 30) {
          imageMode(CENTER);
          image(match, i, 260, 30, 30);
          imageMode(CORNER);
        }
      }
      if (position >= 2 && position <= 10) {
        if (position == 2) {
          textAlign(RIGHT);
          text("Two Matchboxes = ", 350, 265);
          textAlign(LEFT);
        }
        for (int i = 360; i < 770; i += 30) {
          imageMode(CENTER);
          image(match, i, 280, 30, 30);
          imageMode(CORNER);
        }
      }
      if (position >= 3 && position <= 10) {
        if (position == 3) {
          textAlign(RIGHT);
          text("Three Matchboxes = ", 350, 265);
          textAlign(LEFT);
        }
        for (int i = 360; i < 770; i += 30) {
          imageMode(CENTER);
          image(match, i, 300, 30, 30);
          imageMode(CORNER);
        }
      }
      if (position >= 4 && position <= 10) {
        if (position == 4) {
          textAlign(RIGHT);
          text("Four Matchboxes = ", 350, 265);
          textAlign(LEFT);
        }
        for (int i = 360; i < 770; i += 30) {
          imageMode(CENTER);
          image(match, i, 320, 30, 30);
          imageMode(CORNER);
        }
      }
      if (position >= 5 && position <= 10) {
        if (position == 5) {
          textAlign(RIGHT);
          text("Five Matchboxes = ", 350, 265);
          textAlign(LEFT);
        }
        for (int i = 360; i < 770; i += 30) {
          imageMode(CENTER);
          image(match, i, 340, 30, 30);
          imageMode(CORNER);
        }
      }
      if (position >= 6 && position <= 10) {
        if (position == 6) {
          textAlign(RIGHT);
          text("Six Matchboxes = ", 350, 265);
          textAlign(LEFT);
        }
        for (int i = 360; i < 770; i += 30) {
          imageMode(CENTER);
          image(match, i, 360, 30, 30);
          imageMode(CORNER);
        }
      }
      if (position >= 7 && position <= 10) {
        if (position == 7) {
          textAlign(RIGHT);
          text("Seven Matchboxes = ", 350, 265);
          textAlign(LEFT);
        }
        for (int i = 360; i < 770; i += 30) {
          imageMode(CENTER);
          image(match, i, 380, 30, 30);
          imageMode(CORNER);
        }
      }
      if (position >= 8 && position <= 10) {
        if (position == 8) {
          textAlign(RIGHT);
          text("Eight Matchboxes = ", 350, 265);
          textAlign(LEFT);
        }
        for (int i = 360; i < 770; i += 30) {
          imageMode(CENTER);
          image(match, i, 400, 30, 30);
          imageMode(CORNER);
        }
      }
      if (position >= 9 && position <= 10) {
        if (position == 9) {
          textAlign(RIGHT);
          text("Nine Matchboxes = ", 350, 265);
          textAlign(LEFT);
        }
        for (int i = 360; i < 770; i += 30) {
          imageMode(CENTER);
          image(match, i, 420, 30, 30);
          imageMode(CORNER);
        }
      }
      if (position == 10 || position == 21 || position == 23) {
        delay(1000);
        position += 1;
      }
      if (position  >= 1 && position <= 9) {
        delay(800);
        position += 1;
      }
      if (position == 11) {
        if (x < 75) {
          x += 1;
        } else {
          delay(1000);
          position += 1;
        }
      }
      if (position >= 12) { // count matches
        textSize(15);
        if (position <= 20)
          delay(800);
        if (position >= 12)
          text(14, 700, 266);
        if (position >= 13)
          text(28, 700, 286);
        if (position >= 14)
          text(42, 700, 306);
        if (position >= 15)
          text(56, 700, 326);
        if (position >= 16)
          text(70, 700, 346);
        if (position >= 17)
          text(84, 700, 366);
        if (position >= 18)
          text(98, 700, 386);
        if (position >= 19)
          text(112, 700, 406);
        if (position >= 20)
          text(126, 700, 426);
        textSize(20);
        if (position <= 20)
          position += 1;
      }
      if (position >= 22) {
        text("14 matchsticks x 9 boxes = 126 matchsticks", 480, 460);
        text("Rachael has 126 matchsticks.", 480, 490);
        if (position == 22)
          position += 1;
        if (position == 24) {
          textSize(15);
          text("Press any key to continue.", 480, 515); // press any key
          nextSlide();
        }
      }
    } else if (slides == 10) {
      image(borderBigY, 0, 0);
      endScreen();
    }
  }

  void slidesDivis() {
    background(Q_bgDark);
    if (slides == 1) {
      image(borderSmallR, 0, -15);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("What is Division?", 480, 130);
      textFont(learnFont);
      textSize(25);
      text("Division is the method of distributing a group of things", 480, 170);
      text("into equal parts. Division is often known as the opposite of", 480, 200);
      text("multiplication, and it is one of the four basic operations", 480, 230);
      text("of arithmetic.", 480, 260);

      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(3500);
        position += 2;
      }

      if (x <= 720 && position == 1) {
        pushMatrix();
        translate(-240 + x, 450);
        rotate(radians(x));
        imageMode(CENTER);
        image(divisionSign, 0, 0, 250, 250);
        imageMode(CORNER);
        popMatrix();
        x += 5;
      } else if (position == 1) {
        imageMode(CENTER);
        image(divisionSign, -240 + x, 450, 250, 250);
        imageMode(CORNER);
        textSize(20);
        text("Press any key to continue.", 480, 300); // press any key
        nextSlide();
      }
    } else if (slides == 2) {
      image(borderSmallR, 0, -15);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("The Operation", 480, 130);
      textFont(learnFont);
      textSize(25);
      text("Division uses the “÷” symbol. This symbol is known as the", 480, 170);
      text("Division Sign. Division can also be represented as", 480, 200);
      text("a fraction, and can use the “/” sign.", 480, 230);

      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(4000);
        position += 2;
      }
      if (x < 360 && position == 1) {
        pushMatrix(); // spins furryGuy onto screen
        translate(480, 440);
        rotate(radians(x));
        imageMode(CENTER);
        image(furryGuy, 360 - x, 360 - x, -50 + x, -50 + x);
        imageMode(CORNER);
        popMatrix();
        x += 2;
      } else if (position == 1) {
        imageMode(CENTER);
        image(furryGuy, 480, 440, -50 + x, -50 + x);
        imageMode(CORNER);
        textSize(20);
        text("Press any key to continue.", 480, 280); // press any key
        nextSlide();
      }
    } else if (slides == 3) {
      image(borderSmallR, 0, 0);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("Example One", 480, 130);
      textFont(learnFont);
      textSize(25);
      text("Cheesy has 10 identical rubix cubes. She doesn't need so", 480, 170);
      text("many cubes, so she decides to give some away to her friends.", 480, 200);
      text("If Cheesy has 4 friends (5 including herself), how many rubix", 480, 230);
      text("cubes do each person get to ensure everybody is happy?", 480, 260);
      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(5000);
        position += 2;
      }
      if (x < 560 && position == 1) {
        imageMode(CENTER);
        image(rubixCube, 1040 - x, 450, 0 + x/2, 0 + x/2);
        imageMode(CORNER);
        x += 4;
      } else if (position == 1) {
        imageMode(CENTER);
        image(rubixCube, 480, 450, x/2, x/2);
        imageMode(CORNER);
        textSize(20);
        text("Press any key to continue.", 480, 300); // press any key
        nextSlide();
      }
    } else if (slides == 4) {
      background(Q_bgDark); // outside of loop so it runs all the time
      image(borderBigR, 0, 0);
      textFont(learnSub);
      textSize(40);
      text("Solution", 480, 130);
      textFont(learnFont);
      textSize(20); // text
      text("To make everybody happy, each person needs to receive the", 480, 170);
      text("same amount of rubix cubes. Let's use division to solve this problem!", 480, 200);

      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(4500);
        position += 2;
      }

      if (position >= 3) { // divide
        stroke(255, 0, 0);
        if (position <= 6)
          delay(800);
        if (position >= 3)
          line(330, 230, 330, 290);
        if (position >= 4)
          line(430, 230, 430, 290);
        if (position >= 5)
          line(530, 230, 530, 290);
        if (position >= 6)
          line(630, 230, 630, 290);
        if (position <= 7)
          position += 1;
        stroke(r, g, b);
      }

      if (position >= 1) {
        for (int i = 255; i < 755; i += 50) {
          imageMode(CENTER);
          image(cubeCounter, i, 260, 50, 50);
          imageMode(CORNER);
        }
        if (position == 1)
          position += 1;
      }
      if (position == 2 || position == 8 || position == 15 || position == 17) {
        delay(1000);
        position += 1;
      }
      if (position >= 9) {
        if (position <= 13)
          delay(800);
        if (position >= 9)
          text(1, 280, 300);
        if (position >= 10)
          text(2, 380, 300);
        if (position >= 11)
          text(3, 480, 300);
        if (position >= 12)
          text(4, 580, 300);
        if (position >= 13)
          text(5, 680, 300);
        if (position <= 14)
          position += 1;
      }
      if (position >= 16) {
        text("10 rubix cubes / 5 friends = 2 rubix cubes each", 480, 400);
        text("Each friend (including Cheesy) gets 2 rubix cubes.", 480, 430);
        if (position == 16)
          position += 1;
        if (position == 18) {
          textSize(15);
          text("Press any key to continue.", 480, 500); // press any key
          nextSlide();
        }
      }
    } else if (slides == 5) {
      image(borderSmallR, 0, 0);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("Example Two", 480, 130);
      textFont(learnFont);
      textSize(25);
      text("Michael has 24 trumpets, and he is giving them away. If", 480, 170);
      text("8 people want trumpets, and Michael doesn't want any for", 480, 200);
      text("himself, how many trumpets does each person get?", 480, 230);

      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(4000);
        position += 2;
      }
      if (x < 500 && position == 1) {
        image(trumpetPlayer, 1060 - x, 200, 400, 400);
        x += 4;
      } else if (position == 1) {
        image(trumpetPlayer, 560, 200, 400, 400);
        textSize(20);
        text("Press any key to continue.", 480, 300); // press any key
        nextSlide();
      }
    } else if (slides == 6) {
      background(Q_bgDark); // outside of loop so it runs all the time
      image(borderBigR, 0, 0);
      textFont(learnSub);
      textSize(40);
      text("Solution", 480, 130);
      textFont(learnFont);
      textSize(20); // text
      text("There are 24 trumpets and 8 people want them... This is a", 480, 170);
      text("division problem! We need to figure out 24 divided by 8.", 480, 200);

      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(4500);
        position += 2;
      }

      if (position >= 3) { // divide
        stroke(255, 0, 0);
        if (position <= 9)
          delay(800);
        if (position >= 3)
          line(260, 230, 260, 340);
        if (position >= 4)
          line(330, 230, 330, 340);
        if (position >= 5)
          line(400, 230, 400, 340);
        if (position >= 6)
          line(470, 230, 470, 340);
        if (position >= 7)
          line(540, 230, 540, 340);
        if (position >= 8)
          line(610, 230, 610, 340);
        if (position >= 9)
          line(680, 230, 680, 340);
        if (position <= 10)
          position += 1;
        stroke(r, g, b);
      }

      if (position >= 1) {
        for (int i = 225; i < 785; i += 70) {
          for (int j = 240; j < 375; j += 45) {
            imageMode(CENTER);
            image(trumpet, i, j, 60, 41);
            imageMode(CORNER);
          }
        }
        if (position == 1)
          position += 1;
      }
      if (position == 2 || position == 11 || position == 21 || position == 23) {
        delay(1000);
        position += 1;
      }

      if (position >= 12) {
        if (position <= 19)
          delay(800);
        if (position >= 12)
          text(1, 225, 380);
        if (position >= 13)
          text(2, 295, 380);
        if (position >= 14)
          text(3, 365, 380);
        if (position >= 15)
          text(4, 435, 380);
        if (position >= 16)
          text(5, 505, 380);
        if (position >= 17)
          text(6, 575, 380);
        if (position >= 18)
          text(7, 645, 380);
        if (position >= 19)
          text(8, 715, 380);
        if (position <= 20)
          position += 1;
      }

      if (position >= 22) {
        text("24 trumpets / 8 people = 3 trumpets each", 480, 430);
        text("Each person gets 3 trumpets.", 480, 460);
        if (position == 22)
          position += 1;
        if (position == 24) {
          textSize(15);
          text("Press any key to continue.", 480, 500); // press any key
          nextSlide();
        }
      }
    } else if (slides == 7) {
      image(borderSmallR, 0, 0);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("Example Three", 480, 130);
      textFont(learnFont);
      textSize(25);
      text("A family of four has 112 candies. Each person wants the", 480, 170);
      text("same amount of candies as everyone else. How many candies", 480, 200);
      text("does each family member receive?", 480, 230);

      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(5000);
        position += 2;
      }
      if (x < 560 && position == 1) {
        imageMode(CENTER);
        image(candyBox, 480, -100 + x, x/2, x/2*0.93);
        imageMode(CORNER);
        x += 4;
      } else if (position == 1) {
        imageMode(CENTER);
        image(candyBox, 480, 460, x/2, x/2*0.93);
        imageMode(CORNER);
        textSize(20);
        text("Press any key to continue.", 480, 300); // press any key
        nextSlide();
      }
    } else if (slides == 8) {
      background(Q_bgDark); // outside of loop so it runs all the time
      image(borderBigR, 0, 0);
      textFont(learnSub);
      textSize(40);
      text("Solution", 480, 130);
      textFont(learnFont);
      textSize(20); // text
      text("To make sure each family member is happy, each person needs", 480, 170);
      text("to receive the same amount of candy. We can use division to solve this.", 480, 200);

      if (position == 0)
        position -= 1;
      else if (position == -1) {
        delay(4500);
        position += 2;
      }

      if (position >= 3) { // divide
        stroke(0);
        if (position <= 5)
          delay(800);
        if (position >= 3)
          line(237, 267, 720, 267);
        if (position >= 4)
          line(237, 317, 720, 317);
        if (position >= 5)
          line(237, 367, 720, 367);
        if (position <= 6)
          position += 1;
        stroke(r, g, b);
      }

      if (position >= 1) {
        for (int i = 257; i < 733; i += 34) {
          for (int j = 230; j < 430; j += 25) {
            imageMode(CENTER);
            image(candy, i, j, 25, 25);
            imageMode(CORNER);
          }
        }
        if (position == 1)
          position += 1;
      }

      if (position == 2 || position == 7 || position == 13 || position == 15) {
        delay(1000);
        position += 1;
      }

      if (position >= 8) {
        if (position <= 11)
          delay(800);
        if (position >= 8)
          text(1, 225, 252);
        if (position >= 9)
          text(2, 225, 302);
        if (position >= 10)
          text(3, 225, 352);
        if (position >= 11)
          text(4, 225, 402);
        if (position <= 12)
          position += 1;
      }

      if (position >= 14) {
        text("112 candies / 4 family members = 28 candies each", 480, 450);
        text("Each family member gets 28 candies.", 480, 480);
        if (position == 14)
          position += 1;
        if (position == 16) {
          textSize(15);
          text("Press any key to continue.", 480, 510); // press any key
          nextSlide();
        }
      }
    } else if (slides == 10) { // ending screen
      image(borderBigR, 0, 0);
      endScreen();
    }
  }

  void OOOSlides() {
    background(Q_bgDark);
    if (slides == 1) {
      image(borderSmallP, 0, -90, 960, 1100);
      textAlign(CENTER);
      textFont(learnSub);
      textSize(40);
      text("Order of Operations", 480, 130);
      textFont(learnFont);
      textSize(20); // print text
      text("Order of operations a collection of rules that tell us which", 480, 170);
      text("operations to perform before others. Order of operation uses an acronym", 480, 200);
      text("known as BEDMAS or PEDMAS. This stands for: brackets/parentheses,", 480, 230);
      text("exponents, division, multiplication, addition, and subtraction. In this program,", 480, 260);
      text("we should only worry about the four basic operations. When solving a math", 480, 290);
      text("equation, multiplication and division are ranked on the same level. If they", 480, 320);
      text("are both present in an equation, we do them from left to right. Addition", 480, 350);
      text("and subtraction are also on the same level. They are solved from left", 480, 380);
      text("to right after all multiplication and division portions", 480, 410);
      text("have been solved.", 480, 440);

      textSize(15);
      text("Press any key to continue.", 480, 500); // press any key
      nextSlide();
    } else if (slides == 2)
      opening();
    else if (slides == 3) {
      image(borderBigR, 0, 0);
      endScreen();
    }
  }


  void nextSlide() { // move to the next slide
    if (60 <= mouseX && mouseX <= 180 && 47.5 <= mouseY && mouseY <= 92.5)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    stroke(r, g, b); // stroke to match the colour palette of the learn boxes
    rect(120, 70, 120, 45, 5); // Escape box
    stroke(74, 134, 232); // reset colour
    textFont(MMOptions);
    textSize(20);
    fill(0);
    text("Exit", 120, 75);
    textFont(learnFont);
    textSize(20);

    if (mousePressed) { // based on where mouse is clicked, go to that place
      delay(200);
      if (60 <= mouseX && mouseX <= 180 && 47.5 <= mouseY && mouseY <= 92.5) {
        position = 0;
        x = 0;
        y = 0;
        slides = 0;
        masterSwitch = "mainMenu";
      }
    }
    if (keyPressed) {
      slides += 1;
      x = 0;
      y = 0;
      position = 0; // reset
    }
  }
}
