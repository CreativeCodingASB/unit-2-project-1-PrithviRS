import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;

Projectile[] p = new Projectile[1000];
float randomY = 0;

void setup() {
  minim = new Minim(this);
  song = minim.loadFile("beat.mp3", 2048);
  song.play();
  beat = new BeatDetect();
  fullScreen(P2D);
  background(0);
  for (int i = 0; i < p.length; i++) {

    p[i] = new Projectile();
  }
}

void draw() {
    beat.detect(song.mix);
  background(0);
  randomY *= 0;
  randomY += random(height);

  for (int i = 0; i < p.length; i++) {

    p[i].update();
    //p[i].checkEdges();
    p[i].display();
    p[i].setSpeed();

    if (keyPressed)
    {
      p[i].setSpeed();
    }
  }
}