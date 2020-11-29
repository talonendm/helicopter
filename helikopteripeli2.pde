//<!-- Helicopter v1.0 (31.5.2012)
// sun edit 6.6.2012
//2012 (c) Jaakko Talonen 
//talonen.dm@gmail.com
//-->
// Global variables
float radius = 50.0;
int X, Y;
int nX, nY;
int painovoima = 1.5;//0.01;//1;   // jotain vikaa ampumisessa.. cos ja sinit sekaisin..
int ilmanvastus = 0.92;
int kaantyykerralla = PI/32;
int panoksensatunnaisuus = 0.01;  // 1 prossa etäisyyden mukaan
int kaasuaskel = 0.4;
int laskeutumissallitaan = 1.2;
int pilvix;
int pilviy;
int pilvileveys;
int pilvikorkeus;
int pilvennopeus;

int aurinkox;
int aurinkoy;
int aurinkokoko;
int aurinkoactive;

int hiiriapu;

int panostuho = 5;
int tormaystuhokerroin = 3;

int maxkaasu = 2.5;
//int delay = 4;
int delay = 10;   // oltava 1...

int koko = 100; // kopterinkoko
int oikeakoko = 45; // SVG-piirturi on paska ja tyhjaa tulee
int potkurikoko = koko/2;
int potkurikerroin = 13;

// Declare and contruct two objects (h1, h2) from the class HLine 
// helikopterit
// x,y,vx,vy,kaasu,asento,suunta,potkuri,potkurisuunta,player,energia,panoksia,voitotY
//HLine h1 = new HLine(screen.width*0.1, 500,0,0,painovoima,PI/2,-1,50,potkurikerroin,1,100,100,0); 
//HLine h2 = new HLine(screen.width*0.9,400,0,0,painovoima,PI/2,1,50,potkurikerroin,2,100,100,0); 

int kuvaleveys = screen.width-50;
int kuvakorkeus = screen.height*0.84;
int maakorkeus = kuvakorkeus -60;


//int[] a = { 5, 20, 25, 45, 70 };

//int[] numbers = new int[3]; 

//int[] kokonaisvoitot = {0,0};
int alussx, alussy;
int nopeusX,nopeusY;

int pelimenossa = 0;

  // Set drag switch to false
  boolean dragging=false;

//s11 = loadShape("hel1.svg");   // pehmennykset ei workkaa
s11 = loadShape("helicopter.svg");
s12 = loadShape("helicopter2.svg");
s21 = loadShape("helicopterS2.svg");
s22 = loadShape("helicopterP22.svg");
pox = loadShape("pox.svg");
s1b = loadShape("helicopter1broken.svg");
s2b = loadShape("helicopter2broken.svg");
pilvi = loadShape("pilvi.svg");

sun = loadShape("sun.svg");
sun2 = loadShape("sun2.svg");

smooth();

//PImage b;

//b = loadImage("tausta.jpg");

//background(b);
//size(100, 100, P3D);



HLine h1 = new HLine(screen.width*0.1, 500,0,0,painovoima,PI/2,-1,50,potkurikerroin,1,100,100,0); 
HLine h2 = new HLine(screen.width*0.9,400,0,0,painovoima,PI/2,1,50,potkurikerroin,2,100,100,0); 

PFont myFont;


// ****************************************
// Setup the Processing Canvas
void setup(){
background( 0, 121, 184 );
//background(b);

size(kuvaleveys, kuvakorkeus);

 // size( screen.width, screen.height );
  strokeWeight( 100 );
  frameRate( 30 );  // voi olla vaik 50
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
  

  pilvix = random(kuvaleveys);
  pilviy = random(200)+30; 
  pilvileveys = 300 + random(150);
  pilvikorkeus = 80 + random(100);
  pilvennopeus = random(2)+1;


  aurinkoy = 30;
  aurinkokoko = 300;
  aurinkox = width-aurinkokoko;

  aurinkoactive = 0;

//numbers[0] = 90; 
//numbers[1] = 150; 
//numbers[2] = 30; 






  myFont = createFont("FFScala", 24);
  textFont(myFont);
  //text("!@#$%", 10, 50);
  

  font = loadFont("FFScala.ttf"); 

}

// Main draw loop
void draw(){
  
  radius = radius + sin( frameCount / 4 );
  
  // Track circle to new destination
  X+=(nX-X)/delay;
  Y+=(nY-Y)/delay;
  
  // Fill canvas grey
  background( 100 );
  //background(bbb);
  // Set fill-color to blue
  //fill( 0, 121, 184 );
  
  // Set stroke-color white
  //stroke(200); 
  
  // Draw circle
  //ellipse( X, Y, radius, radius );            
  pilvix = pilvix + pilvennopeus;
  if (pilvix>kuvaleveys) {
	pilvileveys = 300 + random(150);
  	pilvikorkeus = 80 + random(100);
	pilvix = -pilvileveys;
	pilviy = random(100)+30;
	}

// The font must be located in the sketch's 

// "data" directory to load successfully



//textFont(font); 

//text("O", 14, 30); 

// väri tekstille
//fill(220, 102, 153);



//text("O", alussx, alussy);

 //smooth();
//s2.enableStyle();
//shape(s2, alussx, alussy, 80, 80);


// fill(0, 102, 153, 51);

// text(radius, 15, 90+Y);



 // for(int i=0; i < a.length; i++) {

 //  strokeWeight(i+2);   // Thicker

  //  line(10+X, a[i], 500, a[i]);

 // }


strokeWeight(9);
stroke(50, 50, 50);
line(0, maakorkeus, kuvaleveys, maakorkeus);
//line(0, 100, screen.width, 100);




 // nopeusX = (X-keskipisteX)/50;
 // nopeusY = (Y-keskipisteY)/50;




 // alussx = alussx + nopeusX;
 // alussy = alussy + nopeusY;


  //if ((abs(alussx-X)<radius) && (abs(alussy-Y)<radius)) {

	//text("PAM", alussx, alussy);

    //  }


// radius oikeasti korkeus ja leveys pallolle
 // if ((sqrt(pow(alussx-X,2) + pow(alussy-Y,2))<radius/1.7)) {

// sama asia: Calculates the magnitude (or length) of a vector
 //if (mag(alussx-X,alussy-Y)<(radius/1.7)) {
//fill(220, 222, 153);
//	text("PAM", alussx, alussy);
          // huom! shapefilen yläkulmasta nyt ziigaa tota!
  //    }


if (aurinkoactive == 0) {
	shape(sun,aurinkox,aurinkoy,aurinkokoko,aurinkokoko);
} else {
	shape(sun2,aurinkox,aurinkoy,aurinkokoko,aurinkokoko);
}


  h1.update(); 
  h2.update();  


shape(pilvi,pilvix,pilviy,pilvileveys,pilvikorkeus);



//fill(82, 82, 42);
//  text("HELICOPTER 2012 (c) Jaakko Talonen", 20, 28);


if (pelimenossa == 0) {
	fill(220, 222, 253);
	textAlign(CENTER);
	text("START NEW GAME", kuvaleveys/2, maakorkeus+30);
}
else
{
	fill(120, 122, 153);
	textAlign(CENTER);
	text("RESTART GAME", kuvaleveys/2, maakorkeus+30);
}


}


// Set circle's next destination
void mouseMoved(){
  	nX = mouseX;
  	nY = mouseY;  


	

  

}




// *******************************************
// hiiri
// ******************************************
void mousePressed() {
  // Rotate the shape each time the mouse is pressed
 // s2.rotate(0.1);  

// pitäis kait olla 3D päällä
//s2.rotateX(HALF_PI*0.1);  

	
//setup();

// ei näin..
//h1 = HLine(screen.width*0.1, 500,0,0,painovoima,PI/2,-1,50,potkurikerroin,1,100,100); 
//h2 = HLine(screen.width*0.9,400,0,0,painovoima,PI/2,1,50,potkurikerroin,2,100,100); 


// AURINKOKLIKKAUS
	if (sqrt((nX-aurinkox)^2 + (nY-aurinkoy)^2)<aurinkokoko/2){
		if (aurinkoactive == 0){
			aurinkoactive = 1;
		} else {
			aurinkoactive = 0;
		}
	}


if (nY>maakorkeus){


	    
          
      s11.rotate(PI/2-h1.asento);  
      s12.rotate(-PI/2+h1.asento);  
	
  s21.rotate(PI/2-h2.asento);  
      s22.rotate(-PI/2+h2.asento);  

      asento = PI/2;


    

	h1.restart(screen.width*0.1, 500,0,0,painovoima,PI/2,-1,50,potkurikerroin,1,100,100,h1.voitotY); 
	h2.restart(screen.width*0.9,400,0,0,painovoima,PI/2,1,50,potkurikerroin,2,100,100,h2.voitotY); 
	pelimenossa = 1;
}
//s2.scale(1.1); 

//println("play");

}
// *******************************************

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
// *******************************************

class HLine { 
  // HUOM! tässä kans määriteltvä
  float xpos, ypos, xv,yv,kaasu,asento,suunta,potkuri,potkurisuunta,player,energia,panoksia; 
  HLine (float x, float y, float axv, float ayv,float akaasu, float aasento, float asuunta, float apotkuri, float apotkurisuunta, float aplayer, float aenergia, float apanoksia, float avoitotY) {  
    xpos = x;
    ypos = y; 
    xv = axv;
    yv = ayv;
    kaasu = akaasu;
    asento = aasento;
    suunta = asuunta;
    potkuri = apotkuri;
    potkurisuunta = apotkurisuunta;
    player = aplayer; 
    energia = aenergia;
    panoksia = apanoksia;
    voitotY = avoitotY;

    //PShape s11;
    //PShape s12;
   //PShape s21;
    //PShape s22;
  } 

void restart(float x, float y, float axv, float ayv,float akaasu, float aasento, float asuunta, float apotkuri, float apotkurisuunta, float aplayer, float aenergia, float apanoksia, float avoitotY) {  
    xpos = x;
    ypos = y; 
    xv = axv;
    yv = ayv;
    kaasu = akaasu;
    asento = aasento;
    suunta = asuunta;
    potkuri = apotkuri;
    potkurisuunta = apotkurisuunta;
    player = aplayer; 
    energia = aenergia;
    panoksia = apanoksia;
    voitotY = avoitotY;



}


void fire() {
	// jos kutsutaan funktiosta, ni kait pitää olla tuol alla..
//println("poo " + int(this.player));
//xv = xv - this.kaasu*cos(asento)*suunta;
  //  xv = xv*ilmanvastus;
   // yv = yv - this.kaasu*sin(asento);
  //  yv = yv + painovoima;
  //  yv = yv*ilmanvastus;

	//panosx = (xpos) + 100*(cos(asento-HALF_PI)*suunta + sin(asento-HALF_PI)*suunta);
	//panosy = (ypos-oikeakoko) + 100*(sin(asento-HALF_PI)*suunta + cos(asento-HALF_PI)*suunta);
	

	//tykkix = xpos + 20*(cos((asento-HALF_PI))*suunta - sin(asento-HALF_PI)*suunta);
	//tykkiy = ypos + oikeakoko*(sin(asento-HALF_PI)+ cos(asento-HALF_PI));

	tykkix = xpos + 20*suunta*(cos((asento)) - sin(asento));
	tykkiy = ypos + 40*(sin(asento) + cos(asento));



		// LASKETAAN sitä mitä ammutaan keskiosa..
	if (player == 2){
			//h1.energia = h1.energia - 2;
			//shape(pox, h1.xpos, h1.ypos, koko, koko);
			keskiosax = h1.xpos + 5*h1.suunta*(cos((h1.asento)) - sin(h1.asento));
			keskiosay = h1.ypos + 20*(sin(h1.asento) + cos(h1.asento));


		} else {
			keskiosax = h2.xpos + 5*h2.suunta*(cos((h2.asento)) - sin(h2.asento));
			keskiosay = h2.ypos + 20*(sin(h2.asento) + cos(h2.asento));
		}
	

	

	//tykkix = xpos - 30*(sin((asento-HALF_PI))*suunta);
	//tykkiy = ypos + oikeakoko*(cos((asento-HALF_PI)));

	// helkkarien välinen etäisyys
	//etaisyysH = sqrt(pow(h1.xpos-h2.xpos,2) + pow(h1.ypos-h2.ypos,2));
	etaisyysH = sqrt(pow(tykkix-keskiosax,2) + pow(tykkiy-keskiosay,2));
	
	//float r = random(1);
	//etaisyysH = random(1)*etaisyysH;







        panosx = tykkix - etaisyysH*suunta*(cos(asento-HALF_PI));
	panosy = tykkiy - etaisyysH*(sin((asento-HALF_PI)));


	// enemmän randomia kauempaan kutiin
	panosx = (random(panoksensatunnaisuus)*2+(1-panoksensatunnaisuus))*panosx;
	panosy = (random(panoksensatunnaisuus)*2+(1-panoksensatunnaisuus))*panosy;


	osumaetaisyys = sqrt(pow(panosx-keskiosax,2) + pow(panosy-keskiosay,2));

	if ((osumaetaisyys<20)){
		// println("osuma");
		if (player == 2){
			h1.energia = h1.energia - panostuho;
			h1.energiacheck();
			h1.xv = h1.xv + (panosx-tykkix)/etaisyysH;
			h1.yv = h1.yv + (panosy-tykkiy)/etaisyysH;
			shape(pox, h1.xpos, h1.ypos, koko, koko);
		} else {
			h2.energia = h2.energia - panostuho;
			shape(pox, h2.xpos, h2.ypos, koko, koko);

			h2.xv = h2.xv + (panosx-tykkix)/etaisyysH;
			h2.yv = h2.yv + (panosy-tykkiy)/etaisyysH;

			h2.energiacheck();
		}

		shape(pox, keskiosax,keskiosay, koko, koko);

	} else {
		

		// piirretään hutikuti
		etaisyysH = random(1)*etaisyysH;







        	panosx = tykkix - etaisyysH*suunta*(cos(asento-HALF_PI));
		panosy = tykkiy - etaisyysH*(sin((asento-HALF_PI)));
		//ellipse(panosx, panosy, 3, 3);
		stroke(244);
		strokeWeight(4);
		point(panosx, panosy);
	}

	

	//panosx = xpos + (20+200)*suunta*(cos((asento)) - sin(asento));
	//panosy = ypos + (40+0)*(sin(asento) + cos(asento));


	shape(pox, tykkix, tykkiy, koko/3, koko/3);
	
	// ***********
	// VIIVA TYKILLE
	// ***********
	// strokeWeight(1); 
	// line(tykkix,tykkiy,panosx,panosy);

	//ellipse(xpos, ypos, 5, 5);

	//ellipse(tykkix, tykkiy, 8, 8);

	//println("poo " + int(xpos)+","+ int(ypos));
	//apu = (abs(atan((h1.ypos - h2.ypos)/(h1.xpos - h2.xpos)) - asento-HALF_PI*3));  // % on mod
	//apu = apu%(2*PI);
	//println(apu);

	//if ((apu<0.2) || (2*PI-apu<0.2)){
	//	println("osuma");
	//	if (player == 2){
	//		h1.energia = h1.energia - 2;
	//		shape(pox, h1.xpos, h1.ypos, koko, koko);
	//	} else {
	//		h2.energia = h2.energia - 2;
	//		shape(pox, h2.xpos, h2.ypos, koko, koko);
	//	}

	//}


	
	//println("poo " + int(keskiosax)+","+ int(keskiosay));
}



 void lisaavoitto(){
	voitotY = voitotY + 1;
  }


void update() { 





	// ********************************************* HIIRELLÄ LIIKKUMINEN
	// 6.6.2012 - rotate ei toimi kuin maassa=!??
	// *************************************
	if (player == 2) {


	if (aurinkoactive == 1) {

		// svg paska.. tyhjää mukana.. + jokin arvo
		hiiriapu = (-nY+aurinkoy+aurinkokoko/2-60)/500;
		
		if (abs(hiiriapu)<kaasuaskel/15){
			hiiriapu = 0;
		} else {
			if (hiiriapu<0) {
				hiiriapu = hiiriapu + kaasuaskel/15;
			} else {
				hiiriapu = hiiriapu - kaasuaskel/15;
			}
		}


		// jokakiekka, ei pystyis noin nopeesti naputtaa.. sen takia 3:lla jaettu
		if (hiiriapu>kaasuaskel/5){
			hiiriapu = kaasuaskel/5;
		}
		if (hiiriapu<-kaasuaskel/5){
			hiiriapu = -kaasuaskel/5;
		}

		h2.kaasu +=hiiriapu;
	
		if (h2.kaasu>maxkaasu) { h2.kaasu = maxkaasu;}
		if (h2.kaasu<0) { h2.kaasu = 0;}


		// kääntyminen
		// svg paska.. tyhjää mukana.. + jokin arvo

		if ((h2.kaasu > 0) || (h2.ypos<maakorkeus)) {		

			hiiriapu = (nX-aurinkox-aurinkokoko/2-24)/2000;
		
			if (abs(hiiriapu)<kaantyykerralla/15){
				hiiriapu = 0;
			} else {
				if (hiiriapu<0) {
					hiiriapu = hiiriapu + kaantyykerralla/15;
				} else {
					hiiriapu = hiiriapu - kaantyykerralla/15;
				}
		
				// jokakiekka, ei pystyis noin nopeesti naputtaa.. sen takia 3:lla jaettu
			if (hiiriapu>kaantyykerralla/5){
				hiiriapu = kaantyykerralla/5;
			}
			if (hiiriapu<-kaantyykerralla/5){
				hiiriapu = -kaantyykerralla/5;
			}

			h2.asento +=hiiriapu*h2.suunta;
	
			hiiriapu = hiiriapu*h2.suunta;

	//	asento -=kaantyykerralla*suunta;
	   		s21.rotate(hiiriapu);  
			s22.rotate(-hiiriapu);  	
		
  
			// oli nää vastakkaisena.. 6.6. ongelma ok..

	        //	asento +=kaantyykerralla*suunta;
	      //  	s21.rotate(hiiriapu*h2.suunta);  
		//	s22.rotate(-hiiriapu*h2.suunta);  


		//s21.rotate(PI/2-h2.asento);  
      		//s22.rotate(-PI/2+h2.asento);  


		}


	



		}


	
	
		
	


	}



}




    xv = xv - this.kaasu*cos(asento)*suunta;
    if ((pilvikorkeus + pilviy)>ypos) {
	if (xv<pilvennopeus){
		xv = xv + (pilvennopeus - xv)/20;
	} else {
		xv = xv + pilvennopeus/100;
	}
    }


    xv = xv*ilmanvastus;

    //xv = xv*(v));


    yv = yv - this.kaasu*sin(asento);
    yv = yv + painovoima;
    yv = yv*ilmanvastus;

    xpos += xv; 
    ypos += yv; 

   // osuuko maahan
    if (ypos + oikeakoko > maakorkeus) { 
      	ypos = maakorkeus-oikeakoko;
      	yv = -yv/5;
      	xv = xv/3; 

	//println(yv);
      	if ((-yv>laskeutumissallitaan) || (abs(asento - PI/2)>kaantyykerralla/2)){
        	energia = energia + yv*3*tormaystuhokerroin;  // negatiivinen  ja jotkin kertoinet
		energia = energia - abs(asento - PI/2)*5*tormaystuhokerroin;
		this.energiacheck();
      		shape(pox, xpos, ypos, koko, koko);
      	}
      	else {
      		panoksia = panoksia + 1;
      		if (panoksia >100) {

			panoksia = 100; 

			if ((h1.energia>0) && (h2.energia<=0) && (player == 1)){
				//textSize(24);
				//color(255,0,0);
    				//strokeWeight(8);   // Thicker
    				fill(200, 0,0);
    				//stroke(c2);
				text("WINNER", kuvaleveys/2, kuvakorkeus/2);
				h1.kaasu = 0; 
				if (pelimenossa == 1){
					//h1.voitotY = h1.voitotY  + 1;

					h1.lisaavoitto();
				}
				//text(float(h1.voitotY) + " - " +float(h2.voitotY), kuvaleveys/2, kuvakorkeus/2+40);
				//text(int(h1.voitotY ) + " - " +int(h2.voitotY ), kuvaleveys/2, kuvakorkeus/2+40);
				//println(int(kokonaisvoitot[1]) + " - " +int(kokonaisvoitot[2]));
				pelimenossa = 0;
			}

			if ((h2.energia>0) && (h1.energia<=0) && (player == 2)){
				//textSize(24);
				//color(255,0,0);
    				//strokeWeight(8);   // Thicker
    				fill(0, 200,0);
    				//stroke(c2);
				text("WINNER", kuvaleveys/2, kuvakorkeus/2);
				h2.kaasu = 0; 
				if (pelimenossa == 1){
					//h2.voitotY = h2.voitotY  + 1;
					h2.lisaavoitto();
				}
				//text(float(h1.voitotY ) + " - " +float(h2.voitotY ), kuvaleveys/2, kuvakorkeus/2+40);
				pelimenossa = 0;
			}

			
		}

      }


      if (player == 1) {
          
      		s11.rotate(PI/2-asento);  
      		s12.rotate(-PI/2+asento);  
	} else
	{
  		s21.rotate(PI/2-asento);  
      		s22.rotate(-PI/2+asento);  
	}	
      asento = PI/2;


    } 

// osuuko kattoon
    if (ypos < 0) { 
	kaasu = 0;

}

   if (xpos < 0) { 
	xpos = kuvaleveys-1;
	energia = energia - 5;
	this.energiacheck();
}
    
  if (xpos > kuvaleveys) { 
	xpos = 1;
	energia = energia - 5;
	this.energiacheck();
}





    //line(0, ypos, width, ypos); 


   


    if (this.player == 1){

	// testailuu
	//tykkix = xpos + 20*suunta*(cos((asento)) - sin(asento));
	//tykkiy = ypos + 40*(sin(asento) + cos(asento));

	if (energia>0){
    	if (suunta==1){
    		shape(s11, xpos, ypos, koko, koko);

		
		//line(xpos,ypos,tykkix,tykkiy);
		//println(cos(asento));
    	}
    	else {
    		shape(s12, xpos, ypos, koko, koko);
		//line(xpos,ypos,tykkix,tykkiy);
    	}
	} else {
		shape(s1b, xpos, ypos, koko, koko);
	}
     }
 
   if (this.player == 2){
	if (energia>0){
    	if (suunta==1){
    		shape(s21, xpos, ypos, koko, koko);
    	}
    	else {
    		shape(s22, xpos, ypos, koko, koko);
    	}
	} else {
		shape(s2b, xpos, ypos, koko, koko);
	}
     }


	
    this.potkuri = this.potkuri + kaasu*potkurisuunta;



    //potkuri = potkuri + this.kaasu*this.potkurisuunta;
    
    if (this.potkuri>potkurikoko) {
	this.potkurisuunta = -potkurikerroin;
   	potkuri = potkurikoko-random(3);
    }
    if (this.potkuri<0) {
	this.potkurisuunta = potkurikerroin;
   
    }


    if (this.energia>0){
    strokeWeight(2);   // Thicker
    color c2 = color(200, 200,200);
    stroke(c2);
    line(xpos-sin(asento)*this.potkuri*suunta, ypos + cos(asento)*this.potkuri, xpos+sin(asento)*this.potkuri*suunta, ypos- cos(asento)*this.potkuri);
    } else {
	this.kaasu = 0;
	}

	

	


    strokeWeight(5);
    apu = kuvaleveys*0.8*(player-1)+0.1*kuvaleveys;

	//fill(204, 102, 0); // mites viivojen väri

color c1 = color((2-player)*222, (player-1)*222, 0);
	stroke(c1);

    line(apu, maakorkeus+20,apu+energia*(player*2-3),maakorkeus+20);
 line(apu, maakorkeus+30,apu+panoksia*(player*2-3),maakorkeus+30);

	if (kaasu<painovoima) {
	color c1 = color(0, 0, 0);
	} 
	stroke(c1);

    line(apu, maakorkeus+10,apu+kaasu*25*(player*2-3),maakorkeus+10);


// joku ihmevika tossa .. voisko olla, etta maksimimaara muuttujia ylitetty..!?
	//text(int(h1.voitotY) + " - " +int(h2.voitotY), kuvaleveys/2, kuvakorkeus/2+40);

    //println(this.kaasu);
    //println(this.potkuri);
    //println(this.potkurisuunta);

  } 

  void energiacheck(){
	if (energia<0) {
		energia = 0;
		
	}
  }
 
  void move(key) {
	if (this.energia>0){
 	if (key==97){
		
            	this.kaasu +=kaasuaskel;
   		if (this.kaasu>maxkaasu) { this.kaasu = maxkaasu;}
	   	//println(this.kaasu);
		
		
        }
      	if (key==122){
	        this.kaasu -=kaasuaskel;
		if (this.kaasu<0) { this.kaasu = 0;}
	   	//println(this.kaasu);
      	}
	if (key==120){
		if ((kaasu > 0) || (ypos>maakorkeus)) {
		asento -=kaantyykerralla*suunta;
	   	//println(asento);
      		//if (suunta == 1) {
          		s11.rotate(-kaantyykerralla*suunta);  
		//} else {
			s12.rotate(kaantyykerralla*suunta);  
		//}
	}
      	}
     	if (key==99){
		if ((kaasu > 0) || (ypos>maakorkeus)) {
	        asento +=kaantyykerralla*suunta;
	   	//println(asento);
		//if (suunta == 1) {
          		s11.rotate(kaantyykerralla*suunta);  
		//} else {
			s12.rotate(-kaantyykerralla*suunta);  
		//}
	}
        }
 
       if (key==115){
		if (suunta==1){
			suunta = -1;
		} else {
			suunta = 1;
		}
	        //asento +=kaantyykerralla;
	   	//println(asento);
          	//s1.rotate(kaantyykerralla);  
        }
	if (key==32){
		if (panoksia>0){
			panoksia = panoksia - 1;
			h1.fire();
		}
        }




	if (key==52){
		if (this.energia>0){
            		this.kaasu +=kaasuaskel;
   			if (this.kaasu>maxkaasu) { this.kaasu = maxkaasu;}
	   		//println(this.kaasu);
		}
        }
      	if (key==49){
	        this.kaasu -=kaasuaskel;
		if (this.kaasu<0) { this.kaasu = 0;}
	   	//println(this.kaasu);
      	}
	if (key==50){
		if ((kaasu > 0) || (ypos>maakorkeus)) {
			asento -=kaantyykerralla*suunta;
	   		s21.rotate(-kaantyykerralla*suunta);  
			s22.rotate(kaantyykerralla*suunta);  	
		}
      	}
     	if (key==51){
		if ((kaasu > 0) || (ypos>maakorkeus)) {
	        	asento +=kaantyykerralla*suunta;
	        	s21.rotate(kaantyykerralla*suunta);  
			s22.rotate(-kaantyykerralla*suunta);  	
		}
        }
 
       if (key==53){
		if (suunta==1){
			suunta = -1;
		} else {
			suunta = 1;
		}
	        //asento +=kaantyykerralla;
	   	//println(asento);
          	//s1.rotate(kaantyykerralla);  
        }
	if (key==10){
		if (panoksia>0){
			panoksia = panoksia - 1;
			h2.fire();
		}
		// testivaan.. eli onnistuu viittaus tietty tällee		
		//panoksia = h1.xpos;
		// aivan vastustaja on player 1
		
		// testataan onko tykin kulman asteluku sama kuin helikopteri.. ei siis piirretä panoksia.
		// pelkkä pox
		
		//h2.fire();
		
        }
	}

  }
// CLASS helkkariloppuu
}



// *******************************************
void keyPressed() {

  //println("pressed " + int(key) + " " + keyCode);
 
if ((key==97) || (key==122)|| (key==120)|| (key==99)|| (key==115)|| (key==32)){
   h1.move(key);
}
  
if ((key==52) || (key==49)|| (key==50)|| (key==51)|| (key==53)|| (key==10)){
   h2.move(key);
}

}



