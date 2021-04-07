/*
 Programmer: Aaron Zhu
 Teacher: Mr. Wong
 Date: 16 November 2020
 Description: (ISP) Make an educational program that teaches the user basic arithmetic
 (+, -, *, /). There should be a learning section, and a quiz section. The quiz should
 have three levels and ten questions (5 multiple choice and 5 answerable questions).
 A total score will be displayed at the end, and the score resets if the user tries the
 quiz again.
 
 Notes: quiz is completely randomized; quiz answers are always whole numbers;
 lessons are all animated; there is a lesson on order of operations
 */

import javax.script.ScriptEngine; // import javascript ScriptEngine to evaluate string equations
import javax.script.ScriptEngineManager;
// https://forum.processing.org/one/topic/execute-a-string.html
// https://forum.processing.org/two/discussion/21709/code-evaluation-during-program-execution 

String masterSwitch = "splashScreen"; // switch between the drawings

PFont titleFont;
PFont pressKey; // font for the "Press any key to continue" message
PFont MMOptions; // font for main menu options
PFont learnTitle; // font for learn title
PFont learnSub; // font for subtitles 
PFont learnFont; // font for the learn text

PImage openL, openR; // images for the splash screen
PImage magician;
PImage operation1, operation2, operation3, operation4, operation5, operation6, operation7;
Splash splash = new Splash();

PImage arithMagician; // images for main menu
PImage MM_bgLight, MM_bgDark;
PImage slide1, slide2, slide3, slide4, slide5, slide6;
MainMenu main = new MainMenu();

PImage Q_bgLight, Q_bgDark; // bg for learn and quiz
PImage L_startImage; // starting logo
PImage borderBigG, borderSmallG, borderBigO, borderSmallO, borderBigY, borderSmallY, borderBigR, borderSmallR, borderSmallP;
PImage apple, addSign, bookStore, walkOne, walkTwo, walkThree, jenStand, book, airplane, rock, truck, weight; // objects to enhance addition lesson
PImage peaches, minusSign, forestFire, forestFire2, tree, fire, monkey, banana, boat, notes;
PImage multiTable, multiSign, alien, finger, keyboard, keys, matchClose, matchOpen, match;
PImage divisionSign, furryGuy, rubixCube, cubeCounter, trumpetPlayer, trumpet, candyBox, candy;
Learn learn = new Learn();

PImage Q_startImage, Q_endImage; //images for quiz
String[] isCorrect = new String[10]; // declare an array to hold if user answers correct or incorrect
Quiz quiz = new Quiz(); 

void setup() {
  size(960, 600);
  
  // load images and fonts
  titleFont = loadFont("Font_Luminari-Regular-48.vlw");
  pressKey = loadFont("Font_PTSerif-Caption-48.vlw");
  MMOptions = loadFont("Font_PlantagenetCherokee-48.vlw");
  learnTitle = loadFont("Font_ToppanBunkyuGothicPr6N-DB-48.vlw");
  learnSub = loadFont("Font_Baskerville-Bold-48.vlw");
  learnFont = loadFont("Font_HannotateSC-W5-48.vlw");
  openL = loadImage("SS_CurtainOpenLeft.png");
  openR = loadImage("SS_CurtainOpenRight.png");
  magician = loadImage("SS_Magician.png");
  operation1 = loadImage("SS_ArithMagicianOperations1.png");
  operation2 = loadImage("SS_ArithMagicianOperations2.png");
  operation3 = loadImage("SS_ArithMagicianOperations3.png");
  operation4 = loadImage("SS_ArithMagicianOperations4.png");
  operation5 = loadImage("SS_ArithMagicianOperations5.png");
  operation6 = loadImage("SS_ArithMagicianOperations6.png");
  operation7 = loadImage("SS_ArithMagicianOperations7.png");
  arithMagician = loadImage("MM_ArithMagician.png");
  MM_bgLight = loadImage("MM_BackgroundLight.png");
  MM_bgDark = loadImage("MM_BackgroundDark.png");
  slide1 = loadImage("Rules_Slide1.png");
  slide2 = loadImage("Rules_Slide2.png");
  slide3 = loadImage("Rules_Slide3.png");
  slide4 = loadImage("Rules_Slide4.png");
  slide5 = loadImage("Rules_Slide5.png");
  slide6 = loadImage("Rules_Slide6.png");
  Q_bgLight = loadImage("Q_bg_Light.png");
  Q_bgDark = loadImage("Q_bg_Dark.png");
  L_startImage = loadImage("L_Logo.png");
  borderBigG = loadImage("L_BorderBigG.png");
  borderSmallG = loadImage("L_BorderSmallG.png");
  borderBigO = loadImage("L_BorderBigO.png");
  borderSmallO = loadImage("L_BorderSmallO.png");
  borderBigY = loadImage("L_BorderBigY.png");
  borderSmallY = loadImage("L_BorderSmallY.png");
  borderBigR = loadImage("L_BorderBigR.png");
  borderSmallR = loadImage("L_BorderSmallR.png");
  borderSmallP = loadImage("L_borderSmallP.png");
  apple = loadImage("L_apple.png");
  addSign = loadImage("L_AddSign.png");
  bookStore = loadImage("L_Bookstore.png");
  walkOne = loadImage("L_JenniferWalking1.png");
  walkTwo = loadImage("L_JenniferWalking2.png");
  walkThree = loadImage("L_JenniferWalking3.png");
  jenStand = loadImage("L_JenniferStanding.png");
  book = loadImage("L_book.png");
  airplane = loadImage("L_Airplane.png");
  rock = loadImage("L_Rock.png");
  truck = loadImage("L_Truck.png");
  weight = loadImage("L_Weight.png");
  peaches = loadImage("L_Peaches.png");
  minusSign = loadImage("L_MinusSign.png");
  forestFire = loadImage("L_ForestFire.jpg");
  forestFire2 = loadImage("L_ForestFire.png");
  tree = loadImage("L_Tree.png");
  fire = loadImage("L_Fire.png");
  monkey = loadImage("L_Monkey.png");
  banana = loadImage("L_Banana.png");
  boat = loadImage("L_Boat.png");
  notes = loadImage("L_Notes.png");
  multiTable = loadImage("L_MultiTable.png");
  multiSign = loadImage("L_MultiSign.png");
  alien = loadImage("L_Alien.png");
  finger = loadImage("L_Finger.png");
  keyboard = loadImage("L_Keyboard.png");
  keys = loadImage("L_Keys.png");
  matchClose = loadImage("L_MatchClose.png");
  matchOpen = loadImage("L_MatchOpen.png");
  match = loadImage("L_Match.png");
  divisionSign = loadImage("L_DivisionSign.png");
  furryGuy = loadImage("L_Division.png");
  rubixCube = loadImage("L_RubixCube.png");
  cubeCounter = loadImage("L_RubixCubeCounter.png");
  trumpetPlayer = loadImage("L_TrumpetPlayer.png");
  trumpet = loadImage("L_Trumpet.png");
  candyBox = loadImage("L_CandyBox.png");
  candy = loadImage("L_Candy.png");
  Q_startImage = loadImage("Q_Logo.png");
  Q_endImage = loadImage("Q_endLogo.png");
}

void draw() { // calls the draw function in each class based on masterSwitch
  if (masterSwitch == "splashScreen")
    splash.draw();
  else if (masterSwitch == "mainMenu")
    main.draw();
  else if (masterSwitch == "Addition" || masterSwitch == "Subtraction" || masterSwitch == "Multiplication" || masterSwitch == "Division" || masterSwitch == "Order Of Operations")
    learn.draw();
  else if (masterSwitch == "easyQ" || masterSwitch == "mediumQ" || masterSwitch == "hardQ")
    quiz.draw();
  else if (masterSwitch == "credits")
    main.credits();
  else if (masterSwitch == "done") {
    background(0);
    exit(); // program finishes
  }
}
