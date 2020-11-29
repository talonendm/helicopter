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
  size( 500, 400 );
  strokeWeight( 10 );
  frameRate( 15 );
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


 // size(200, 200);
  xml = new XMLElement(this, "simple.xml");
  int numSites = xml.getChildCount();
  for (int i = 0; i < numSites; i++) {
    XMLElement kid = xml.getChild(i);
    int id = kid.getInt("id"); 
    String url = kid.getString("url"); 
    String site = kid.getContent();
    println(id + " : " + url + " : " + site);    
  }

  
}

// Main draw loop
void draw(){
  
  radius = radius + sin( frameCount / 4 );
  
  // Track circle to new destination
  X+=(nX-X)/delay;
  Y+=(nY-Y)/delay;
  
  // Fill canvas grey
  //background( 100 );
  
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
text("O", alussx, alussy);

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
 if ((sqrt(pow(alussx-X,2) + pow(alussy-Y,2))<radius/1.7)) {

	text("PAM", alussx, alussy);

      }


}


// Set circle's next destination
void mouseMoved(){
  nX = mouseX;
  nY = mouseY;  
}

void mouseOut() {

  background(140,50,80);

}
void mouseOver() {

  background(50,80,140);

}

void keyPressed() {

  println("pressed " + int(key) + " " + keyCode);




//void setup() {

//}


}


