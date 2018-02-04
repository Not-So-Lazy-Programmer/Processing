import processing.video.*;
Capture video;
int pointx = 0;
int pointy = 0;
float redvalue = 0;
float greenvalue = 0;
float bluevalue = 0;
float mincolorRed = 0;
float maxcolorRed = 0;
float mincolorGreen = 0;
float maxcolorGreen = 0;
float mincolorBlue = 0;
float maxcolorBlue = 0;
float threshRed = 20;
float threshGreen = 20;
float threshBlue = 20;

void setup() {
  size(640,480);

  String[] cameras = Capture.list();
  printArray(cameras);
  video = new Capture(this,640,480,30);
  video.start();  
}

void captureEvent(Capture video){
  video.read(); 
}

void draw(){ 
  
  video.loadPixels();
  image(video,0,0); 
  pointx = mouseX;
  pointy = mouseY;
  for(int x=0;x<video.width;x++){
    for(int y=0;y<video.height;y++){
     int loc = x+y*video.width;
     float r = red(video.pixels[loc]);
     float g = green(video.pixels[loc]);
     float b = blue(video.pixels[loc]);
      if ( r >= mincolorRed && r <= maxcolorRed && g >= mincolorGreen && g <= maxcolorGreen && b >= mincolorBlue  && b <= maxcolorBlue ){     
        set(x,y,color(0,0,0));
      }
    }
  }
  if(keyPressed){
    
    if(key == '1'){
      threshRed = threshRed +2;
    }else if(key == '2'){
      threshRed = threshRed -2;
    }
    if(key == '4'){
      threshGreen = threshGreen +2;
    }else if(key == '5'){      
      threshGreen = threshGreen -2;
    }
    if(key == '7'){
      threshBlue = threshBlue +2;
    }else if(key == '8'){
      threshBlue = threshBlue -2; 
    }
    mincolorRed = redvalue - threshRed/2;
    maxcolorRed = redvalue + threshRed*0.5;
    mincolorGreen = greenvalue - threshGreen/2;
    maxcolorGreen = greenvalue + threshGreen*0.5;
    mincolorBlue = bluevalue - threshBlue/2;
    maxcolorBlue = bluevalue + threshBlue*0.5;
  } 
  text("Targeted red value:" + redvalue, 10,20);
  text("Targeted green value:" + greenvalue, 10,30);
  text("Targeted blue value:" + bluevalue, 10,40);
  text("Maximum threshold for red value:" + maxcolorRed, 10, 60);
  text("Minimum threshold for red value:" + mincolorRed, 10, 70);
  text("Maximum threshold for green value:" + maxcolorGreen, 10, 90);
  text("Minimum threshold for green value:" + mincolorGreen, 10, 100);
  text("Minimum threshold for blue value:" + maxcolorBlue, 10, 120);
  text("Minimum threshold for blue value:" + mincolorBlue, 10, 130);
}

void mousePressed(){
  redvalue = red(get(pointx,pointy));  
  greenvalue = green(get(pointx,pointy));
  bluevalue = blue(get(pointx,pointy));
  
  mincolorRed = redvalue - threshRed/2;  // this equation..
  maxcolorRed = redvalue + threshRed*0.5;  // ...and this equation was very hard to make :(
  mincolorGreen = greenvalue - threshGreen/2;
  maxcolorGreen = greenvalue + threshGreen*0.5;
  mincolorBlue = bluevalue - threshBlue/2;
  maxcolorBlue = bluevalue + threshBlue*0.5;       
}