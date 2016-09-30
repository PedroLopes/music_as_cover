import ddf.minim.*;

Minim minim;
AudioPlayer player;
Boolean stop = true;
int chops = 10; 
float[] translates = null;
int max_translate = 0;
int offset_index = 5;
PImage img;
int y;
PImage oImg;
  
void setup()
{ 
  size(1440, 900); 
  img = loadImage("1_medium.jpeg");
  oImg = loadImage("1_medium.jpeg");
  
  minim = new Minim(this);
  player = minim.loadFile("eitr.mp3");
  player.play();
  
  translates = new float[chops];
  max_translate = height/3;
}

void draw()
{
  //-------------------- calculate audio
  if (stop==true){
    for(int i = 0; i < player.bufferSize() - 1; i++)
    {
      int select_chop = i%chops;
      translates[select_chop] = (player.left.get(i+0) + player.left.get(i+1))/2  * max_translate; 
      //println(select_chop+ " / " + translates[select_chop]);  
    }
  
  //-------------------- stop if we press spacebar
  if (stop==true){
    background(255,254,238);
  }
  //-------------------- chop image into pieces
  for(int i=0; i<chops; i++){
     //copy(src, sx, sy, sw, sh, dx, dy, dw, dh)
     pushMatrix();
     //translate(0,random(-50,50)); 
     translate(0,translates[i]);
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
    //println(player.bufferSize());
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
}


void keyPressed() 
{
  if ( key == ' ')
  {
    stop=!stop;
  }
}

