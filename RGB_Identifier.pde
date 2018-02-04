import processing.video.*;
Capture video;
//color trackColor;
int pointx = 320;
int pointy = 240;

void setup() {
  size(640,480);
  String[] cameras = Capture.list();
  printArray(cameras);
  video = new Capture(this,640,480,30); //"Microsoft LifeCam HD-3000",
  video.start();  
//  trackColor = color(255, 0, 0);
  Capture.list();
}

void captureEvent(Capture video){
  video.read(); 
}

void draw(){ 
  video.loadPixels();
  image(video,0,0); 


  fill(0);
  text("Red value:     "+red(get(pointx,pointy)),310,20);
  text("Green value:  "+green(get(pointx,pointy)), 310,30);
  text("Blue value:     "+blue(get(pointx,pointy)),310,40);
  noFill();
  ellipse(pointx,pointy,10,10);
  point (pointx,pointy);  
}  