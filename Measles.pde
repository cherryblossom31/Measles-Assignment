//Global Variables
String title = "Wahoo!";
float xFace, yFace, widthDiameterFace, heightDiameterFace, faceRadius, xCenter, smallerDimension;
float xLeftEye, yLeftEye, xRightEye, yRightEye, eyeDiameter;
float xLeftPupil, yLeftPupil, xRightPupil, yRightPupil, pupilDiameter;
float xNoseBridge, yNoseBridge, xLeftNostril, yLeftNostril, xRightNostril, yRightNostril;
float xLeftMouth, yLeftMouth, xRightMouth, yRightMouth;
int thin=30;
color black=#000000;
color white=#FFFFFF;
float xMeasle, yMeasle, measleDiameter;
color resetWhite=#FFFFFF, red=#FF0000; //similar to int declaration
color backgroundColour;
Boolean nightMode=false;
float quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight;
color blue=#AEC6CF, pink=#F8C8DC, resetButtonColour=#C3B1E1, buttonFill; //Not Night Mode Friendly Colours
//
String quitbuttonText= "Quit";
PFont buttonFont;
color purple = #2C08FF; //Note Night Mode Friendly, all of the blue is included
//
void setup()
{
  //CANVAS will will be added to later
  size(800, 600); //Landscape
  //
  //Population
  xCenter = width/2;
  float yCenter = height/2;
  xFace = xCenter;
  yFace = yCenter;
  if ( width >= height ) {
    smallerDimension = height;
  } else {
    smallerDimension = width;
  }//End dimension choice
  int centerX = width*1/5;
  int centerY = height*1/15;
  int centeringButtonWidth = width*1/10;
  int centeringButtonHeight = height*1/15;
  quitButtonX = centerX - centeringButtonWidth;
  quitButtonY = centerY - centeringButtonHeight;
  quitButtonWidth = width*1/10;
  quitButtonHeight = height*1/9;
  widthDiameterFace = smallerDimension;
  heightDiameterFace = smallerDimension;
  xLeftEye = xCenter-smallerDimension*1/4.5;
  yLeftEye = yCenter-smallerDimension*1/5;
  xRightEye = xCenter+smallerDimension*1/4.5;
  yRightEye = yCenter-smallerDimension*1/5;
  eyeDiameter = smallerDimension*1/8;
  xLeftPupil = xCenter-smallerDimension*1/4.5;
  yLeftPupil = yCenter-smallerDimension*1/5;
  xRightPupil = xCenter+smallerDimension*1/4.5;
  yRightPupil = yCenter-smallerDimension*1/5;
  pupilDiameter = smallerDimension*1/15;
  xNoseBridge = xCenter;
  yNoseBridge = yCenter-smallerDimension*1/10;
  xLeftNostril = xCenter-smallerDimension*1/10; 
  yLeftNostril = yCenter+smallerDimension*1/10;
  xRightNostril = xCenter+smallerDimension*1/10;
  yRightNostril = yLeftNostril;
  xLeftMouth = xLeftNostril;
  yLeftMouth = yCenter+smallerDimension*1/4;
  xRightMouth = xRightNostril;
  yRightMouth = yLeftMouth;
  faceRadius = smallerDimension/2;
  //
  backgroundColour = ( nightMode==true ) ? color( random(255), random(255), 0 ) : color( random(255), random(255), random(255) ) ; //ternary operator, similar to IF-Else
  background( backgroundColour );
  ellipse(xFace, yFace, widthDiameterFace, heightDiameterFace);
  //
  //
  //Text Setup
  //String[] fontList = PFont.list(); //To list all fonts available on system
  println("Start of Console");
  //printArray(fontList); //For listing all possible fonts to choose, then createFont
  buttonFont = createFont ("times new roman", 30); //Must also Tools / Create Font / Find Font / Do Not Press "OK"
  //
}//End setup
//
void draw()
{
  //Hover-over
  if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight ) {
    buttonFill = blue;
  } else {
    buttonFill = pink;
  }//End Hover-Over
  fill(buttonFill); //2-colours to start, remember that nightMode adds choice
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  fill(resetButtonColour);
  //
  fill(black);
  ellipse(xLeftEye, yLeftEye, eyeDiameter, eyeDiameter);
  ellipse(xRightEye, yRightEye, eyeDiameter, eyeDiameter);
  fill(white);
  ellipse(xLeftPupil, yLeftPupil, pupilDiameter, pupilDiameter);
  ellipse(xRightPupil, yRightPupil, pupilDiameter, pupilDiameter);
  fill(black);
  triangle(xNoseBridge, yNoseBridge, xLeftNostril, yLeftNostril, xRightNostril, yRightNostril);
  strokeCap(ROUND); //ROUND (default), PROJECT
  strokeWeight(thin);
  line(xLeftMouth, yLeftMouth, xRightMouth, yRightMouth);
  strokeWeight(1); //resets default
  //
  xMeasle = random(xCenter-faceRadius, xCenter+faceRadius);
  yMeasle = random(smallerDimension); //if zero is first, then default
  fill(backgroundColour);
  noStroke();
  measleDiameter = random(smallerDimension*1/75, smallerDimension*1/25); //smallerDimension*1/50;
  ellipse(xMeasle, yMeasle, measleDiameter, measleDiameter);
  stroke(1); //reset default
  fill(resetWhite);
  //
  //Text Draw, General Code for any text
  //Note: visualization rectangle is in main program
  fill(purple); //Ink, hexidecimal copied from Color Selector
  textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
  textFont(buttonFont, 25); //Change the number until it fits, largest font size
  //
  //Specific Text per button
  text(quitbuttonText, quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  //text(buttonText2, buttonX2, buttonY2, buttonWidth2, buttonHeight2);
  fill(white); //Will change the fill() on all shapes the second time repeated in draw()
  //
}//End draw
//
void keyPressed() {
}//End keyPressed
//
void mousePressed() {
 if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight ) exit();
  //
  if ( mouseButton == LEFT ) { //Night Mode FALSE
    backgroundColour = color( random(255), random(255), random(255) ) ; 
    background( backgroundColour );
    ellipse(xFace, yFace, widthDiameterFace, heightDiameterFace);
  }//End Left Mouse Button
  //
  if ( mouseButton == RIGHT ) { //Night Mode TRUE
    backgroundColour = color( random(255), random(255), 0 );
    background( backgroundColour );
    ellipse(xFace, yFace, widthDiameterFace, heightDiameterFace);
    //
  }//End Right Mouse Button
  //
  //Note: Mouse WHEEL is also available
  //if ( mouseButton == WHEEL ) {}//End Mouse WHEEL
  //
  /* For any button
   if ( nightMode == false ) { //NightMode Switch
   nightMode = true;
   } else {
   nightMode = false;
   } //End nightMode switch
   //
   backgroundColour = ( nightMode==true ) ? color( random(255), random(255), 0 ) : color( random(255), random(255), random(255) ) ; //ternary operator, similar to IF-Else
   background( backgroundColour );
   ellipse(xFace, yFace, widthDiameterFace, heightDiameterFace);
   */
  //
}//End mousePressed
//
//End MAIN Program
