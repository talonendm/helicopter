




// Global variables
float radius = 50.0;
int X, Y;
int nX, nY;
int painovoima = 1;
int ilmanvastus = 0.99;
int kaantyykerralla = PI/32;
int kaasuaskel = 0.2;
int maxkaasu = painovoima*3;
//int delay = 4;
int delay = 10;   // oltava 1...

int koko = 100; // kopterinkoko
int potkurikoko = koko/2;
int potkurikerroin = 19;

// Declare and contruct two objects (h1, h2) from the class HLine 
// helikopterit
// x,y,vx,vy,kaasu,asento,suunta,potkuri,potkurisuunta
HLine h1 = new HLine(screen.width*0.9, 500,0,0,painovoima,PI/2,1,50,potkurikerroin); 
HLine h2 = new HLine(100,400,0,0,painovoima,PI/2,2,50,potkurikerroin); 




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


size(screen.width, screen.height);

  size( screen.width, screen.height );
  strokeWeight( 100 );
  frameRate( 30 );
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



s1 = loadShape("helicopter.svg");
s2 = loadShape("helicopter2.svg");
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





  h1.update(); 
  h2.update();  



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


class HLine { 
  // HUOM! tässä kans määriteltvä
  float xpos, ypos, xv,yv,kaasu,asento,suunta,potkuri,potkurisuunta; 
  HLine (float x, float y, float axv, float ayv,float akaasu, float aasento, float asuunta, float apotkuri, float apotkurisuunta) {  
    xpos = x;
    ypos = y; 
    xv = axv;
    yv = ayv;
    kaasu = akaasu;
    asento = aasento;
    suunta = asuunta;
    potkuri = apotkuri;
    potkurisuunta = apotkurisuunta;

  } 
  void update() { 


    xv = xv - this.kaasu*cos(asento);
    xv = xv*ilmanvastus;
    yv = yv - this.kaasu*sin(asento);
    yv = yv + painovoima;
    yv = yv*ilmanvastus;


    xpos += xv; 
    ypos += yv; 

    if (ypos > height) { 
      ypos = 0; 
    } 
    //line(0, ypos, width, ypos); 
    if (suunta==1){
    	shape(s1, xpos, ypos, koko, koko);
    }
    if (suunta==2){
    	shape(s2, xpos, ypos, koko, koko);
    }


    this.potkuri = this.potkuri + kaasu*potkurisuunta;



    //potkuri = potkuri + this.kaasu*this.potkurisuunta;
    
    if (this.potkuri>potkurikoko) {
	this.potkurisuunta = -potkurikerroin;
   
    }
    if (this.potkuri<0) {
	this.potkurisuunta = potkurikerroin;
   
    }

    strokeWeight(2);   // Thicker

    line(xpos-sin(asento)*this.potkuri, ypos + cos(asento)*this.potkuri, xpos+sin(asento)*this.potkuri, ypos- cos(asento)*this.potkuri);


    println(this.kaasu);
    println(this.potkuri);
    println(this.potkurisuunta);

  } 
  void move(key) {
 	if (key==97){
	
            this.kaasu +=kaasuaskel;

 		if (this.kaasu>maxkaasu) { this.kaasu = maxkaasu;}

	   println(this.kaasu);
      }



	   println(this.kaasu);
      }
      if (key==122){
	
            this.kaasu -=kaasuaskel;

           if (this.kaasu<0) { this.kaasu = 0;}

	   println(this.kaasu);
      }

      if (key==120){
	
            asento -=kaantyykerralla;

	   println(asento);

      s1.rotate(-kaantyykerralla);  


      }

     if (key==99){
	
            asento +=kaantyykerralla;

	   println(asento);

          s1.rotate(kaantyykerralla);  

      }


  }
}

void keyPressed() {

  println("pressed " + int(key) + " " + keyCode);
 
if ((key==97) || (key==122)|| (key==120)|| (key==99)){
   h1.move(key);
}
  

}



