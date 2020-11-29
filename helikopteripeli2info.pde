//<!-- Helicopter v1.0 (31.5.2012)
//2012 (c) Jaakko Talonen 
//talonen.dm@gmail.com
//-->


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

int kuvaleveys = screen.width-50;
int kuvakorkeus = screen.height*0.03;



// The following short XML file called "sites.xml" is parsed 
// in the code below. It must be in the project's "data" directory
// <?xml version="1.0"?>
// <websites>
//   <site id="0" url="processing.org">Processing</site>
//   <site id="1" url="mobile.processing.org">Processing Mobile</site>
// </websites>

XMLElement xml;


// Setup the Processing Canvas
void setup(){
  //size( 500, 400 );
 size(kuvaleveys, kuvakorkeus);
  fill(82, 82, 42);

PFont font;
// The font must be located in the current sketch's 
// "data" directory to load successfully 
font = loadFont("EurekaMonoCond-Bold.ttf"); 
textFont(font, 16);
textAlign(LEFT);

background( 130 );
//textFont(font, 18);
//  text("HELICOPTER 2012 (c) jaakko.talonen@gmail.com", 20, kuvakorkeus*0.8);
fill(222, 0, 0);
text("1 player: A) more gas, Z) less gas, X) turn left, C) turn right, S) turn around, SPACE) FIRE!!!",kuvaleveys*0.01,kuvakorkeus*0.6);
fill(0, 222, 0);
textAlign(RIGHT);
text("2 player: 4) more gas, 1) less gas, 2) turn left, 3) turn right, 5) turn around, ENTER) FIRE!!!",kuvaleveys*0.99,kuvakorkeus*0.6);

fill(255, 255, 255);
textAlign(CENTER);
text("INFO",kuvaleveys/2,kuvakorkeus*0.6);


}




//textFont(font, 12);
//text("HELICOPTER 2012 (c) Jaakko Talonen", 20, kuvakorkeus*0.8);




// Main draw loop
void draw(){
 
  
}

// *******************************************
// hiiri
// ******************************************
void mousePressed() {

	link("https://sites.google.com/site/helicoptergame2012/"); 

}



