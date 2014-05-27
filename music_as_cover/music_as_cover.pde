import ddf.minim.*;

Minim minim;
AudioPlayer player;
Boolean stop = true;

void setup()
{
  size(512, 100, P3D);
  minim = new Minim(this);
  player = minim.loadFile("eitr.mp3");
  player.play();
}

void draw()
{
  
  if (stop==true){
    background(0);
  }
  stroke(255);
  
  
  if (stop==true){
    for(int i = 0; i < player.bufferSize() - 1; i++)
    {
      float x1 = map( i, 0, player.bufferSize(), 0, width );
      float x2 = map( i+1, 0, player.bufferSize(), 0, width );
      //println(x1 + "/" + x2);
      line( x1, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50 );
      //line( x1, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*50 );
    }
  
  }
}


void keyPressed() 
{
  if ( key == ' ')
  {
    stop=!stop;
  }
}


/*
PImage img;
int y;

void setup() {
  size(1390, 1333);
  
  img = loadImage("1.jpeg");
}

void draw() {
  //background(img);
  image(img, 0, 0);
  
  
  //image(img, , 0);
  
  
  img2 = createImage(230, 230, ARGB);
  for(int i = 0; i < img.pixels.length; i++) {
    //steal pixels from main image, get sound, 
    float a = map(i, 0, img.pixels.length, 255, 0);
    img.pixels[i] = color(0, 153, 204, a); 
  }
  
  for (int y = 0; y < img.height; y++) {
      arrayCopy(img.pixels, signalOffset, pixels, y*width, img.width);
    }
    updatePixels();
  
  stroke(226, 204, 0);
  line(0, y, width, y);
  //plot as sound wave on top
  //just amplitude.. and get values from here and use to shift image up and down.
  
  y++;
  if (y > height) {
    y = 0; 
  }
}*/
