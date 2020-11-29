// Global variables
float radius = 50.0;
int X, Y;
int nX, nY;
//int delay = 4;
int delay = 10;   // oltava 1...


int[] a = { 5, 20, 25, 45, 70 };

int[] numbers = new int[3]; 


int alussx, alussy;
int nopeusX,nopeusY;


PShape s2;
  // Set drag switch to false
  boolean dragging=false;


// Setup the Processing Canvas
void setup(){
background( 0, 121, 184 );
  size( 500, 400 );
  strokeWeight( 100 );
  frameRate( 25 );
  X = width / 2;
  Y = height / 2;

  keskipisteX = X;
  keskipisteY = Y;

  nX = X;
  nY = Y;

  alussx = X*1.4;
  alussy = Y;

  nopeusX = 0;
  nopeusY = 0;
  

numbers[0] = 90; 

numbers[1] = 150; 

numbers[2] = 30; 




s2 = loadShape("heli.svg");
//size(100, 100, P3D);
smooth();

  
}

// Main draw loop
void draw(){
  
  radius = radius + sin( frameCount / 4 );
  
  // Track circle to new destination
  X+=(nX-X)/delay;
  Y+=(nY-Y)/delay;
  
  // Fill canvas grey
  background( 100 );
  
  // Set fill-color to blue
  fill( 0, 121, 184 );
  
  // Set stroke-color white
  stroke(200); 
  
  // Draw circle
  ellipse( X, Y, radius, radius );            


// The font must be located in the sketch's 

// "data" directory to load successfully

font = loadFont("FFScala.ttf"); 

textFont(font); 

text("O", 14, 30); 

// väri tekstille
fill(220, 102, 153);



//text("O", alussx, alussy);

 //smooth();
//s2.enableStyle();
shape(s2, alussx, alussy, 80, 80);


fill(0, 102, 153, 51);

text(radius, 15, 90+Y);



  for(int i=0; i < a.length; i++) {

   strokeWeight(i+2);   // Thicker

    line(10+X, a[i], 500, a[i]);

  }




  nopeusX = (X-keskipisteX)/50;
  nopeusY = (Y-keskipisteY)/50;




  alussx = alussx + nopeusX;
  alussy = alussy + nopeusY;


  //if ((abs(alussx-X)<radius) && (abs(alussy-Y)<radius)) {

	//text("PAM", alussx, alussy);

    //  }


// radius oikeasti korkeus ja leveys pallolle
 // if ((sqrt(pow(alussx-X,2) + pow(alussy-Y,2))<radius/1.7)) {

// sama asia: Calculates the magnitude (or length) of a vector
 if (mag(alussx-X,alussy-Y)<(radius/1.7)) {
fill(220, 222, 153);
	text("PAM", alussx, alussy);
          // huom! shapefilen yläkulmasta nyt ziigaa tota!
      }


}


// Set circle's next destination
void mouseMoved(){
  nX = mouseX;
  nY = mouseY;  
}


void mousePressed() {
  // Rotate the shape each time the mouse is pressed
  s2.rotate(0.1);  

// pitäis kait olla 3D päällä
//s2.rotateX(HALF_PI*0.1);  
s2.scale(1.1); 
}


  // If use drags mouse...
  void mouseDragged(){
    // Set drag switch to true
    dragging=true;
  }
  // If user releases mouse...
  void mouseReleased(){
    // ..user is no-longer dragging
    dragging=false;
  }



