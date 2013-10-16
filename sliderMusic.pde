
// for audio stuff
import ddf.minim.*;
AudioPlayer player;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;

Minim minim;
// for audio stuff


PFont f;
boolean isText = false;



import controlP5.*;

ControlP5 cp5;

controlP5.Slider b;
controlP5.Slider b2;
controlP5.Slider b3;
controlP5.Slider b4;

int buttonValue = 1;

boolean isOpen;

int myColorBackground = color(0, 0, 0);

PImage bg;

float newVal= 255;
float otherVal = 255;
float greenVal = 255;
float strokeW = 1;

float bedredVal = 255;
float bedgreenVal = 255;
float bedblueVal = 255;
float strokeBed = 1;



void setup() {
  //  size(700,400);
  size(237, 500, P2D);
  bg = loadImage("iphoneWhite.png");
  colorMode(RGB);
  smooth();

  f = createFont("Georgia", 12);
  textFont(f);
    textAlign(CENTER, CENTER);


  minim = new Minim(this);
  // load a file, give the AudioPlayer buffers that are 2048 samples long
  player = minim.loadFile("machucar.mp3", 2048);
  player1 = minim.loadFile ("02 Track No 10.mp3"); //should be sugarplum
  player2 = minim.loadFile ("05 Head Is A Flame (Cool With It).mp3");
  player3 = minim.loadFile ("Please Go Easy With Me.mp3");
  player4 = minim.loadFile("1991 - Azealia Banks.mp3"); 
  // player5 = minim.loadFile("SceneChamps.wav");







  cp5 = new ControlP5(this);
  // (1)
  // create some controllers


  b2 = cp5.addSlider("temp")
    .setValue(60)
      .setPosition(100, 105)
      .setRange(50,100)
        .setSize(100, 30)
          .setId(2);

  b = cp5.addSlider("music")
    .setValue(10)
      .setPosition(100, 170)
            .setRange(0,50)
        .setSize(100, 30)
          .setId(1);

  b3 = cp5.addSlider("video")
    .setValue(10)
      .setPosition(100, 235)
        .setSize(100, 30)
          .setId(3);
          
  b4 = cp5.addSlider("bed")
    .setValue(68)
     .setRange(50, 90)
      .setPosition(100, 300)
        .setSize(100, 30)
          .setId(4);

  // (2)
  // load a new font. ControlFont is a wrapper for processing's PFont
  // with processing 1.1 ControlFont.setSmooth() is not supported anymore.
  // to display a font as smooth or non-smooth, use true/false as 3rd parameter
  // when creating a PFont:

  PFont pfont = createFont("GeosansLight", 20, true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont, 241);



  // (3)
  // change the font and content of the captionlabels 
  // for both buttons create earlier.
  cp5.getController("music")
    .getCaptionLabel()
      .setFont(font)
        .toUpperCase(false)
          .setSize(24)
            .setText("MUSIC")
              ;

  b2.captionLabel()
    .setFont(font)
      .setSize(24)
        .toUpperCase(false)
          .setText("TEMP°")
            ;
  b3.captionLabel()
    .setFont(font)
      .setSize(24)
        .toUpperCase(false)
          .setText("VIDEO")
            ;
  b4.captionLabel()
    .setFont(font)
      .setSize(24)
        .toUpperCase(false)
          .setText("BED°")
            ;  
  // (4)
  // adjust the location of a catiption label using the 
  // style property of a controller.
  b.captionLabel().getStyle().marginLeft = -180;
  b.captionLabel().getStyle().marginTop = 0;

  b2.captionLabel().getStyle().marginLeft = -180;
  b2.captionLabel().getStyle().marginTop = 0;
  
  b3.captionLabel().getStyle().marginLeft = -180;
  b3.captionLabel().getStyle().marginTop = 0;
  
  b4.captionLabel().getStyle().marginLeft = -180;
  b4.captionLabel().getStyle().marginTop = 0;
}

void draw() {

  cp5.draw();
  background(bg);

if (isText==true){
 text("...What Does the Fox Say?", width/2, 225); 
}

  // animate button b
  //  b.position().x += ((isOpen==true ? 0:-200) - b.position().x) * 0.2;
  line(0, height/2+110, 600, height/2+110); //vid line
text("Adjust the settings", width/2, height/2+140);
text("of your surroundings.", width/2, height/2+150);

stroke(newVal, greenVal, otherVal);
strokeWeight(strokeW);
  line(16, 85, 220, 85); //temp line

stroke(255);
strokeWeight(1);
  line(0, 215, 600, 215); //vid line

stroke(bedredVal, bedgreenVal, bedblueVal);
  strokeWeight(strokeBed);
  line(16, 280, 220, 280); //bed line

stroke(255);
strokeWeight(1);
  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  // note that if the file is MONO, left.get() and right.get() will return the same value
  for (int i = 0; i < player.left.size()-1; i++)
  {
    //    line(i, 50 + player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50);
    line(20+i, 150 + player.right.get(i)*10, (i+1), 150 + player.right.get(i+1)*10);
  }
  for (int i = 0; i < player1.left.size()-1; i++)
  {
    //    line(i, 50 + player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50);
    line(20+i, 150 + player1.right.get(i)*10, i+1, 150 + player1.right.get(i+1)*10);
  }
  for (int i = 0; i < player2.left.size()-1; i++)
  {
    //    line(i, 50 + player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50);
    line(20+i, 150 + player2.right.get(i)*10, i+1, 150 + player2.right.get(i+1)*10);
  }
  for (int i = 0; i < player3.left.size()-1; i++)
  {
    //    line(i, 50 + player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50);
    line(20+i, 150 + player3.right.get(i)*10, i+1, 150 + player3.right.get(i+1)*10);
  }
  for (int i = 0; i < player4.left.size()-1; i++)
  {
    //    line(i, 50 + player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50);
    line(20+i, 150 + player4.right.get(i)*10, i+1, 150 + player4.right.get(i+1)*10);
  }
  //    for (int i = 0; i < player5.left.size()-1; i++)
  //  {
  //    //    line(i, 50 + player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50);
  //    line(20+i, 150 + player5.right.get(i)*50, i+1, 150 + player5.right.get(i+1)*50);
  //  }
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.controller().id());
}

public void temp(float tempValue) {
  println("a temp event. "+tempValue);
  newVal = map (tempValue, 50, 100, 0, 255);
  otherVal = map (tempValue, 50, 100, 255, 0);
  greenVal = map (tempValue, 50, 100, 255, 0);
  if (tempValue>60 || tempValue < 59){
    strokeW = map (tempValue, 50, 100, 1, 5);
  }
}

public void bed(float bedValue) {
  println("a bed event. "+bedValue);
  bedredVal = map (bedValue, 50, 100, 0, 255);
  bedgreenVal = map (bedValue, 50, 100, 255, 0);
  bedblueVal = map (bedValue, 50, 100, 255, 0);
  if (bedValue>68 || bedValue < 67){
    strokeBed = map (bedValue, 50, 100, 1, 5);
  }
}
public void video(float vidValue) {
  if (vidValue>60){
  isText = true;
  }
}

public void music(float theValue) {
  println("a music event. "+theValue);
  //  isOpen = !isOpen;
  //  cp5.controller("button").setCaptionLabel((isOpen==true) ? "close":"open");

  if (theValue<10) {
    println ("go play chill tunes");
    player.play();
  }
  else {
    player.pause();
  }
  if (theValue>10 && theValue<20) {
    //    println ("go play chill tunes");
    player1.play();
  }
  else {
    player1.pause();
  }
  if (theValue>20 && theValue<30) {
    //    println ("go play chill tunes");
    player2.play();
  }
  else {
    player2.pause();
  }
  if (theValue>30 && theValue<40) {
    //    println ("go play chill tunes");
    player3.play();
  }
  else {
    player3.pause();
  }
  if (theValue>40 && theValue<50) {
    //    println ("go play chill tunes");
    player4.play();
  }
  else {
    player4.pause();
  }
}

//void playChillTunes(float theValue) {
//  player.play(); 
//  println (theValue+"intunes");
//
//}

void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();

  super.stop();
}


