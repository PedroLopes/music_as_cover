import ddf.minim.*;

Minim minim;
AudioPlayer player;
Boolean stop = true;
//samples[]

PImage img;
int y;

PImage oImg;
  
void setup()
{
  //size(1390, 1333);
  size(695,667);
  img = loadImage("1_small.jpeg");
  //size(512, 100); 
  minim = new Minim(this);
  player = minim.loadFile("eitr.mp3");
  player.play();
  oImg = loadImage("1_small.jpeg");
  size(oImg.width, oImg.height); 
}

void draw()
{
  if (stop==true){
    //background(0);
    //image(img, 0, 0);
  } 
  stroke(0);
  //--------------------
  pushMatrix();
  translate(0,height/3);
  
  if (stop==true){
    for(int i = 0; i < player.bufferSize() - 1; i++)
    {
      float x1 = map( i, 0, player.bufferSize(), 0, width );
      float x2 = map( i+1, 0, player.bufferSize(), 0, width );
      //line( x1, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50 );
      //deleted//line( x1, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*50 );
    }
  }
  //--------------------
  popMatrix();
  int chops = 10; 
  for(int i=0; i<chops; i++){
   //copy(src, sx, sy, sw, sh, dx, dy, dw, dh)
   pushMatrix();
   translate(0,random(-50,50));
   if (i==0) copy(oImg, (oImg.width/chops)*i,0,(oImg.width/chops)*(i+1),oImg.height,    0,0,(oImg.width)/chops,oImg.height);
   else {
     copy(oImg, (oImg.width/chops)*i,0,(oImg.width/chops)*(i),oImg.height,    (oImg.width/chops)*i,0,(oImg.width/chops)*(i+0),oImg.height);
   }
   popMatrix();
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
