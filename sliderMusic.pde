import controlP5.*;
// for audio stuff
import ddf.minim.*;
AudioPlayer player;
Minim minim;
// for audio stuff

//PFont font;
public Slider s1;
public ControlP5 controlP5;
//Textfield myTextfield;

PImage bg;
PFont font;
//ControlP5 controlP5;

int myColorBackground = color(0, 0, 0);

int sliderValue = 100;

void setup() {
  size(270, 500, P2D);

  bg = loadImage("smartphone2.png");

  minim = new Minim(this);
  // load a file, give the AudioPlayer buffers that are 2048 samples long
  player = minim.loadFile("Waters of March - Águas de Março - Tom Jobim.mp3", 2048);


  font = loadFont("Avenir-Book-14.vlw");
  textFont(font);
  colorMode(RGB);

  controlP5 = new ControlP5(this);
//   myTextarea.valueLabel().setFont(index);
//   int index = Label.bitFontRenderer.addBitFont(loadImage("yourFont.gif"));
  //name, minimum, maximum, default, xpos, ypos, width, height
  // 45, 85, 47.5, 10, 625, 670, 40);
//   controlP5.setControlFont(new font(createFont("Arial",8), 8));
  controlP5.addSlider("music", 0, 100, 68, 40, 260, 140, 40);

  smooth();
  //  noStroke();


  background(bg);
  //  controlP5.addSlider("sliderValue",100,200,100,100,200,100,10);
}

void draw() {
//  background(bg);

  //  background(myColorBackground);
  controlP5.draw();
  //  fill(sliderValue);
  //  rect(0,0,width,100);

  stroke(255);
  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  // note that if the file is MONO, left.get() and right.get() will return the same value
  for (int i = 0; i < player.left.size()-1; i++)
  {
    //    line(i, 50 + player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50);
    line(20+i, 150 + player.right.get(i)*50, i+1, 150 + player.right.get(i+1)*50);
  }
}

void music(float theColor) {
  myColorBackground = color(theColor);
  println("a slider event. setting background to "+theColor);
  if (theColor>10 && theColor<20) {
    println ("go play chill tunes");
    playChillTunes(theColor);
  }
  if (theColor>120) {
    println (theColor+"stopping");
    player.close();
    minim.stop();
    super.stop();
  }
}

void playChillTunes(float theColor) {
  player.play(); 
  println (theColor+"intunes");
  if (theColor>120) {
    player.close();
    minim.stop();
    super.stop();
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();

  super.stop();
}

