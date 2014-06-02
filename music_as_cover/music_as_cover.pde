import ddf.minim.*;

Minim minim;
AudioPlayer player;
Boolean stop = true;
int chops = 10; 

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
  //-------------------- calculate audio
  if (stop==true){
    for(int i = 0; i < player.bufferSize() - 1; i++)
    {
      float x1 = map( i, 0, player.bufferSize(), 0, width ); //check if belongs to chop, if so, store?
      float x2 = map( i+1, 0, player.bufferSize(), 0, width );
    }
  }
  //--------------------
  //if (stop==true){
    //background(0);
    //image(img, 0, 0);
  //}
  //-------------------- chop image into pieces
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
  //-------------------- //draw audio, already computed before. (currently in lame mode, is re-computing)
  stroke(0);
  pushMatrix();
  translate(0,height/2-50);
  if (stop==true){
    for(int i = 0; i < player.bufferSize() - 1; i++)
    {
      float x1 = map( i, 0, player.bufferSize(), 0, width );
      float x2 = map( i+1, 0, player.bufferSize(), 0, width );
      line( x1, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50 );
    }
  }
  popMatrix();
  //--------------------
}


void keyPressed() 
{
  if ( key == ' ')
  {
    stop=!stop;
  }
}

