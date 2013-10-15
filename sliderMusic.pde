/**
 * ControlP5 controlFont. 
 *
 * this example shows how to create a button with controlP5 (1), how to
 * load and use a PFont with controlP5 (2), apply a ControlFont to
 * the caption label of a button (3), and adjust the location of a
 * caption label using the style() property of a controller.
 * 
 * by andreas schlegel, 2012
 */
 // for audio stuff
import ddf.minim.*;
AudioPlayer player;
Minim minim;
// for audio stuff
 
 
 
 
 
 
import controlP5.*;

ControlP5 cp5;

controlP5.Slider b;

int buttonValue = 1;

boolean isOpen;

int myColorBackground = color(0,0,0);

PImage bg;

void setup() {
//  size(700,400);
    size(270, 500, P2D);
    bg = loadImage("smartphone2.png");
  smooth();
  
    minim = new Minim(this);
  // load a file, give the AudioPlayer buffers that are 2048 samples long
  player = minim.loadFile("machucar.mp3", 2048);

  
  
  
  
  
  
  
  cp5 = new ControlP5(this);
  // (1)
  // create some controllers
  b = cp5.addSlider("button")
     .setValue(10)
     .setPosition(100,100)
     .setSize(100,30)
     .setId(1);
     
//  b = cp5.addSlider("buttonValue")
//         .setValue(4)
//         .setPosition(100,190)
//         .setSize(200,200)
//         .setId(2);
  
  // (2)
  // load a new font. ControlFont is a wrapper for processing's PFont
  // with processing 1.1 ControlFont.setSmooth() is not supported anymore.
  // to display a font as smooth or non-smooth, use true/false as 3rd parameter
  // when creating a PFont:
  
  PFont pfont = createFont("Arial",20,true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont,241);
 
  

  // (3)
  // change the font and content of the captionlabels 
  // for both buttons create earlier.
  cp5.getController("button")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(24)
     .setText("music")
     ;
     
//  b.captionLabel()
//   .setFont(font)
//   .setSize(50)
//   .toUpperCase(false)
//   .setText("music")
//   ;
//  
  // (4)
  // adjust the location of a catiption label using the 
  // style property of a controller.
  b.captionLabel().getStyle().marginLeft = -180;
  b.captionLabel().getStyle().marginTop = 4;

}

void draw() {
  cp5.draw();
   background(bg);

  // animate button b
//  b.position().x += ((isOpen==true ? 0:-200) - b.position().x) * 0.2;
  
  
  
  
  
  
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

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.controller().id());
}

public void button(float theValue) {
  println("a button event. "+theValue);
//  isOpen = !isOpen;
//  cp5.controller("button").setCaptionLabel((isOpen==true) ? "close":"open");

  if (theValue>10 && theValue<20) {
    println ("go play chill tunes");
    playChillTunes(theValue);
  }


}

void playChillTunes(float theValue) {
  player.play(); 
  println (theValue+"intunes");
//  if (theValue>120) {
//    player.close();
//    minim.stop();
//    super.stop();
//  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();

  super.stop();
}




