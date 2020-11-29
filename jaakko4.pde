// Declare and contruct two objects (h1, h2) from the class HLine 

HLine h1 = new HLine(20, 2.0); 

HLine h2 = new HLine(50, 2.5); 

 

PShape s2;
s2 = loadShape("helicopter.svg");



void setup() 

{

  size(200, 200);

  frameRate(30);



}



void draw() { 

  background(204);

  h1.update(); 

  h2.update();  

 smooth();
shape(s2, 10, 10, 80, 80);


} 

 

class HLine { 

  float ypos, speed; 

  HLine (float y, float s) {  

    ypos = y; 

    speed = s; 

  } 

  void update() { 

    ypos += speed; 

    if (ypos > height) { 

      ypos = 0; 

    } 

    line(0, ypos, width, ypos); 

  } 

}
