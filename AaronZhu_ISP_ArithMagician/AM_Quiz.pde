// quiz class
class Quiz {
  // variables that get the range of the numbers, based on difficulty of quiz
  int addLow, addHigh, subLow, subHigh, multiLow, multiHigh, divisLow, divisHigh;

  int tint = 0; // tint variable (fade in)
  int pos = 1; // where the program is at
  int position = 0; // order of code (small scale)
  int answer; // stores the correct answer for the question
  int answerChoice; // stores which multiple choice answer is correct
  int userAnswer; // stores what the user answered
  String answerPrompt; // prompts the answer in userInput (eg. What is 1 + 1?)
  int numOperations; // gets how many operations will be in the question
  int num; // assigned the random number for the questions
  int divisNum = -1; // variable makes sure that division output is whole number
  String equation = ""; // stores the equation (eg. 1 + 1)
  String difficulty; // difficulty of quiz
  boolean scoreGet; // only allows numRight to get bigger by one
  int quizCount = 0; // counts the quiz numbers
  String name = ""; // name of user
  int numRight = 0; // number of questions answered correct
  String[] operations; // assigned how many operations there are (based on the arrays [see below])
  int[] numbers; // randomly gets (#operations + 1) numbers
  String op; // gets operation[i] from operations - used in the randomizing number process
  int option; // gets a random number (0-3) - used to randomize the possible choices for multiple choice
  int[] possibleAnswers = new int[4]; // stores the correct answer, as well as three wrong answers
  boolean error; // error trap variable

  ArrayList<String> operators; // used a String arraylist

  //https://processing.org/reference/Array.html
  String[] choiceOptions = new String[4]; // options for multiple choice
  final int[] NUM_OPERATIONS_EASY = {1, 1, 1, 1, 1, 1, 1, 2, 2, 2}; // how many operations in the question
  final int[] NUM_OPERATIONS_MEDIUM = {1, 2, 2, 3, 3, 2, 1, 2, 2, 3}; // vary in difficulty
  final int[] NUM_OPERATIONS_HARD = {2, 4, 3, 3, 2, 3, 3, 4, 3, 3};

  void draw() {
    if (quizCount == 10 || quizCount == 12)
      tint = 0; // resets tint (for opening) a position before opening is called
    // this way, tint = 0; isn't called while the opening(); runs, creating an infinite loop
    if (quizCount != 0 && quizCount <= 5) {
      if (pos == 1) {// difficulty setting
        difficulty();
      }
      if (pos == 2) { // do the test
        if (masterSwitch == "easyQ")
          numOperations = NUM_OPERATIONS_EASY[(int) random(0, 10)];
        else if (masterSwitch == "mediumQ")
          numOperations = NUM_OPERATIONS_MEDIUM[(int) random(0, 10)];
        else if (masterSwitch == "hardQ")
          numOperations = NUM_OPERATIONS_HARD[(int) random(0, 10)];
        theQuizMultiple();
      }
    } else if (quizCount != 0 && quizCount <= 10) {
      if (pos == 1) {// difficulty setting
        difficulty();
      }
      if (pos == 2) { // do the test
        if (masterSwitch == "easyQ")
          numOperations = NUM_OPERATIONS_EASY[(int) random(0, 10)];
        else if (masterSwitch == "mediumQ")
          numOperations = NUM_OPERATIONS_MEDIUM[(int) random(0, 10)];
        else if (masterSwitch == "hardQ")
          numOperations = NUM_OPERATIONS_HARD[(int) random(0, 10)];
        theQuizAnswerable();
      }
    } else if (quizCount == 0 || quizCount == 11)
      opening();
    else if (quizCount == 12)
      endResults();
  }

  void difficulty() { // based on difficulty user wants, range of numbers changes
    if (masterSwitch == "easyQ") {
      difficulty = "Easy";
      addLow = 1; // range of random based on these variables
      addHigh = 31;
      subLow = 5;
      subHigh = 31;
      multiLow = 1;
      multiHigh = 11;
      divisLow = 1;
      divisHigh = 11;
    } else if (masterSwitch == "mediumQ") {
      difficulty = "Medium";
      addLow = 2;
      addHigh = 51;
      subLow = 2;
      subLow = 51;
      multiLow = 2;
      multiHigh = 13;
      divisLow = 2;
      divisHigh = 11;
    } else if (masterSwitch == "hardQ") {
      difficulty = "Hard";
      addLow = 2;
      addHigh = 101;
      subLow = 2;
      subHigh = 101;
      multiLow = 2;
      multiHigh = 16;
      divisLow = 2;
      divisHigh = 11;
    }
    pos += 1;
  }

  void opening() {
    tint(tint);
    image(Q_bgLight, 0, 0); // bg is image so that tint() works as well
    image(Q_startImage, 0, 0);
    if (tint >= 255) {
      tint = 255;
      delay(1000);
      if (quizCount == 0) { // starting screen
        while (true) {
          name = getString("Please enter your name."); // get name for the end screen
          if (name.length() >= 1) { // error trap for no input
            delay(500);
            error = false;
            quizCount += 1;
          } else
            error = true;
          break;
        }
        if (error == true) {
          fill(0);
          textSize(30);
          text("You didn't enter anything. Please try again.", 480, 525);
        }
      } else if (quizCount == 11) { // ending screen
        delay(1000);
        quizCount += 1;
      }
    } else
      tint += 2.5;
    tint(255);
  }

  void theQuizMultiple() { // multiple choice questions
    background(Q_bgDark);
    if (position == 0) {
      randomize();
      position += 1;
    } else if (position == 1 || position == 2)
      displayMultiple();
    else if (position == 3) {
      background(0);
      position = 0;
      pos = 1;
      quizCount += 1;
    }
  }

  void theQuizAnswerable() { // answerable questions
    background(Q_bgDark);
    if (position == 0) {
      randomize();
      position += 1;
    } else if (position == 1 || position == 2 || position == 3) {
      displayAnswerable();
    } else if (position == 4) {
      background(0);
      position = 0;
      pos = 1;
      quizCount += 1;
    }
  }

  void randomize() {
    for (int i = 0; i < 4; i++) {
      choiceOptions[i] = "";
    }
    numbers = new int[numOperations + 1];
    operations = new String[numOperations];
    equation = "";
    operators = new ArrayList<String>(); // used a String arraylist
    operators.add("+"); // add the values
    operators.add("-"); // adds them every time easyQ gets called because they will be deleted
    operators.add("*");
    operators.add("/");
    operators.add("*"); // two of everything except division (division is very hard to do)
    operators.add("-");
    operators.add("+");
    //https://processing.org/reference/ArrayList.html

    //these arrays are declared in the function because their lengths change every question
    for (int i = operations.length; i > 0; i--) { // randomized operations
      int operatorPlace = floor(random(0, operators.size()));
      operations[i - 1] = operators.get(operatorPlace); // gets the operator, and declares the -i list variable as it
      operators.remove(operatorPlace);
    }

    for (int i = 0; i < numOperations; i++) { // randomized numbers
      op = operations[i]; // get the operation used
      if (divisNum != -1) { // divisNum assigned to num
        num = divisNum;     // value of divisNum comes from last round
        divisNum = -1;
      } else if (op == "+") {
        if (i != 0 && operations[i - 1] == "*") {
          num = (int) random(multiLow, multiHigh);
          divisNum = -1;
        } else {
          num = (int) random(addLow, addHigh); // get a number within these restraints
          divisNum = -1;
        }
      } else if (op == "-") {
        if (i != 0 && operations[i - 1] == "*") {
          num = (int) random(multiLow, multiHigh);
          divisNum = -1;
        } else {
          num = (int) random(subLow, subHigh); 
          divisNum = -1;
        }
      } else if (op == "*") {
        num = (int) random(multiLow, multiHigh);
        divisNum = -1;
      } else if (op == "/") { // answer needs to be a whole number, so code must make sure that the division results in a whole number
        divisNum = (int) random(divisLow, divisHigh); //ax / x = a (always whole number)
        num = (int) random(multiLow, multiHigh);
        num *= divisNum;
      }
      numbers[i] = num;
    }
    // get one more number (#operators = #numbers + 1)
    if (divisNum != -1) { // divisNum assigned to num
      num = divisNum;     // value of divisNum comes from last round
      divisNum = -1;
    } else if (operations[operations.length - 1] == "*") {
      num = (int) random(multiLow, multiHigh);
      divisNum = -1;
    } else {
      num = (int) random(addLow, addHigh); // get a number within these restraints
      divisNum = -1;
    }
    numbers[operations.length] = num;

    for (int i = 0; i < operations.length; i += 1) { // get equation
      equation = equation + numbers[i] + operations[i];
    }
    equation = equation + numbers[operations.length];
    ScriptEngineManager manager = new ScriptEngineManager();
    ScriptEngine engine = manager.getEngineByName("js");
    try {
      answer = (int) engine.eval(equation); // assigns the engine.eval to answer
    } 
    catch (Exception ex) { // try/catch is needed in order for it to work
    }
    possibleAnswers[0]= answer;
    possibleAnswers[1] = answer + (int) random(1, 6);
    possibleAnswers[2] = answer - (int) random(2, 20);
    possibleAnswers[3] = answer + (int) random(6, 51);
    // creates an array of possible answers

    for (int i = 0; i < 4; i++) { // randomizes the list of possible answers
      option = (int) random(0, 4); // so the correct answer isn't always "A"
      while (choiceOptions[option] != "") {
        option = (int) random(0, 4);
      }
      if (i == 0) {
        answerChoice = option; // get where the right answer is
      }
      choiceOptions[option] = Integer.toString(possibleAnswers[i]);
    }
  }
  void displayMultiple() {
    background(Q_bgDark);
    rectMode(CENTER);
    if (60 <= mouseX && mouseX <= 180 && 47.5 <= mouseY && mouseY <= 92.5)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(120, 70, 120, 45, 5); // Escape box
    stroke(74, 134, 232);
    if (215 <= mouseX && mouseX <= 465 && 435 <= mouseY && mouseY <= 485)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    if (position == 2) { // when mousePressed, the answer is revealed
      if (answerChoice == 0)
        fill(0, 204, 102);
      else
        fill(255, 135, 135);
    }
    rect(340, 460, 250, 50, 5); // option A
    if (495 <= mouseX && mouseX <= 745 && 435 <= mouseY && mouseY <= 485)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    if (position == 2) {
      if (answerChoice == 1)
        fill(0, 204, 102);
      else
        fill(255, 135, 135);
    }
    rect(620, 460, 250, 50, 5); // option B
    if (215 <= mouseX && mouseX <= 465 && 505 <= mouseY && mouseY <= 555)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    if (position == 2) {
      if (answerChoice == 2)
        fill(0, 204, 102);
      else
        fill(255, 135, 135);
    }
    rect(340, 530, 250, 50, 5); // option C
    if (495 <= mouseX && mouseX <= 745 && 505 <= mouseY && mouseY <= 555)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    if (position == 2) {
      if (answerChoice == 3)
        fill(0, 204, 102);
      else
        fill(255, 135, 135);
    }
    rect(620, 530, 250, 50, 5); // option D

    fill(217, 217, 217);
    rect(480, 60, 300, 60, 5); // title box
    rect(480, 270, 700, 250, 5); // question box (possibly picture)
    textFont(MMOptions); // change font
    textAlign(CENTER);
    fill(0);
    textSize(20);
    text("Exit", 120, 75);
    if (position == 2) {
      textFont(pressKey);
      textSize(20);
      text("Press any key to continue.", 480, 390);
      textFont(MMOptions);
    }
    textSize(30);
    text("Question #" + quizCount, 480, 75); // text
    textSize(50);
    text(equation + "=", 480, 290);
    textSize(30);
    text(choiceOptions[0], 340, 470);
    text(choiceOptions[1], 620, 470);
    text(choiceOptions[2], 340, 540);
    text(choiceOptions[3], 620, 540);
    if (mousePressed) {
      delay(200);
      if (60 <= mouseX && mouseX <= 180 && 47.5 <= mouseY && mouseY <= 92.5) {
        quizCount = 0;
        numRight = 0;
        scoreGet = false; // set scoreGet to false for the next round
        pos = 1;
        position = 0;
        tint = 0;
        masterSwitch = "mainMenu";
      }
      if (position == 1) {
        if (215 <= mouseX && mouseX <= 465 && 435 <= mouseY && mouseY <= 485) {
          if (answerChoice == 0) { // checks if answer is right or wrong
            isCorrect[quizCount - 1] = "Correct";
            if (!scoreGet) {
              numRight += 1;
              scoreGet = true;
            }
          } else
            isCorrect[quizCount - 1] = "Incorrect";
          position += 1;
        } else if (495 <= mouseX && mouseX <= 745 && 435 <= mouseY && mouseY <= 485) {
          if (answerChoice == 1) {
            isCorrect[quizCount - 1] = "Correct";
            if (!scoreGet) {
              numRight += 1;
              scoreGet = true;
            }
          } else
            isCorrect[quizCount - 1] = "Incorrect";
          position += 1;
        } else if (215 <= mouseX && mouseX <= 465 && 505 <= mouseY && mouseY <= 555) {
          if (answerChoice == 2) {
            isCorrect[quizCount - 1] = "Correct";
            if (!scoreGet) {
              numRight += 1;
              scoreGet = true;
            }
          } else
            isCorrect[quizCount - 1] = "Incorrect";
          position += 1;
        } else if (495 <= mouseX && mouseX <= 745 && 505 <= mouseY && mouseY <= 555) {
          if (answerChoice == 3) {
            isCorrect[quizCount - 1] = "Correct";
            if (!scoreGet) {
              numRight += 1;
              scoreGet = true;
            }
          } else
            isCorrect[quizCount - 1] = "Incorrect";
          position += 1;
        }
      }
    }

    if (keyPressed && position == 2) {
      delay(200);
      scoreGet = false; // set scoreGet to false for the next question
      position += 1;
    }
  }

  void displayAnswerable() {
    background(Q_bgDark);
    if (60 <= mouseX && mouseX <= 180 && 47.5 <= mouseY && mouseY <= 92.5)
      fill(190, 190, 190);
    else
      fill(217, 217, 217);
    rect(120, 70, 120, 45, 5); // Escape box
    fill(217, 217, 217);
    rect(480, 60, 300, 60, 5); // title box
    rect(480, 270, 700, 260, 5); // question box
    if (position == 3 && userAnswer != answer) { // if answer wrong, output correct answer
      fill(0);
      textSize(25);
      text("Correct Answer: " + answer, 480, 350);
    }
    if (position == 1) {
      if (280 <= mouseX && mouseX <= 680 && 425 <= mouseY && mouseY <= 575)
        fill(190, 190, 190);
      else
        fill(217, 217, 217);
      rect(480, 500, 400, 150, 5); // click to answer
    }

    fill(217, 217, 217);
    textFont(MMOptions); // change font
    textAlign(CENTER);
    if (position == 3) {
      if (userAnswer == answer)
        fill(0, 204, 102);
      else
        fill(255, 135, 135);
      rect(480, 500, 550, 60, 5); // answer box
    }

    fill(0);
    textSize(20);
    text("Exit", 120, 75);
    if (position == 1) {
      textSize(40);
      text("Click to Answer", 480, 480);
      text("Question", 480, 540);
    }
    if (position == 3) {
      textSize(30);
      text("Answer: " + userAnswer, 480, 510); // output user answer
      textSize(20);
      text("Press any key to continue.", 480, 390);
    }
    textSize(30);
    text("Question #" + quizCount, 480, 75); // text
    textSize(50);
    answerPrompt = "What is " + equation + "?";
    if (position == 3) {
      if (userAnswer == answer) {// if answer right, print correct; else print incorrect
        text("Correct!", 480, 290);
        isCorrect[quizCount - 1] = "Correct";
        if (!scoreGet) {
          numRight += 1;
          scoreGet = true;
        }
      } else {
        text("Incorrect", 480, 290);
        isCorrect[quizCount - 1] = "Incorrect";
      }
    } else
      text(answerPrompt, 480, 290);

    if (position == 2) { // error trap
      while (true) {
        userAnswer = getInt(answerPrompt);
        if (userAnswer != -987957997) {
          position += 1;
          error = false;
          break;
        } else {
          error = true;
          break;
        }
      }
      if (error == true) {
        fill(217, 217, 217);
        rect(480, 500, 400, 150, 5); // click to answer
        fill(0);
        textSize(20);
        text("Please enter a whole number in the correct range.", 480, 390);
        textSize(40);
        text("Click to Answer", 480, 480);
        text("Question", 480, 540);
        fill(217, 217, 217);
      }
    }
    if (position == 3 && keyPressed) {
      delay(200);
      scoreGet = false; // set scoreGet to false for the next question
      position += 1;
    }
    if (mousePressed) {
      delay(200);
      if (60 <= mouseX && mouseX <= 180 && 47.5 <= mouseY && mouseY <= 92.5) {
        quizCount = 0;
        numRight = 0;
        scoreGet = false; // set scoreGet to false for the next round
        pos = 1;
        position = 0;
        tint = 0;
        masterSwitch = "mainMenu";
      }
      if (position == 1 && 280 <= mouseX && mouseX <= 680 && 425 <= mouseY && mouseY <= 575)
        position += 1;
    }
  }

  void endResults() {
    background(Q_bgDark);
    fill(217, 217, 217);
    rect(480, 310, 700, 440, 5);
    image(Q_endImage, 0, -20);
    fill(0);
    textAlign(LEFT);
    textSize(25);
    text("User: " + name, 380, 125);
    text("Difficulty: " + difficulty, 380, 155);
    text("Score: " + numRight + "/10", 380, 185);
    text("Percentage: " + numRight*10 + "%", 380, 215);
    textSize(20);
    for (int i = 0; i < 10; i++) {
      text("Question " + (i + 1) + ": " + isCorrect[i], 380, 250 + 25*i);
    }
    textAlign(CENTER);
    text("Press any key to continue.", 480, 510);

    if (keyPressed) { // reset to mainMenu
      delay(200);
      quizCount = 0;
      numRight = 0;
      scoreGet = false; // set scoreGet to false for the next round
      masterSwitch = "mainMenu";
    }
  }
}
