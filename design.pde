/*
 JIM YELLOW  (255, 255, 0);
 JIM BLUE color (0 153, 255);
 //String[] fontList = PFont.list();
 //printArray(fontList);
 */

import processing.pdf.*;
PFont amiri, liberation;

void setup() {

  boolean pdf = false;
  //size(400, 150, PDF, "varFreq.pdf");
  size(400, 150);

  color afimColor = color(#0072C9);
  // color(#0072C9) blue
  // color(#005b96) bleu foncé

  color linesColor = color(#FFD300);
  //yellow #FFD300
  // yellow2 orangé #FFBC00 

  if (!pdf) {
    amiri =loadFont("Amiri-Regular-200.vlw");
    liberation = loadFont("LiberationSans-20.vlw");
  } else {
    amiri =createFont("Amiri", 150);
    liberation = createFont("Liberation Sans", 20);
  }

  textAlign(CENTER, CENTER);
  //textMode(SHAPE);
  smooth();
  background(255);
  noFill();

  color blc = color(255);
  sinus(.7, 0, height/2 - 80, lerpColor(linesColor, blc, 0.0), 2 );
  sinus(.7, 0, height/2 - 60, lerpColor(linesColor, blc, 0.2), 3 );
  sinus(.7, 0, height/2 - 40, lerpColor(linesColor, blc, 0.3), 2 );
  sinus(.7, 0, height/2 - 20, lerpColor(linesColor, blc, 0.4), 1 );
  sinus(.7, 0, height/2,      lerpColor(linesColor, blc, 0.5), 1 );
  sinus(.7, 0, height/2 + 20, lerpColor(linesColor, blc, 0.6), 1 );
  sinus(.7, 0, height/2 + 40, lerpColor(linesColor, blc, 0.7), 1 );
  sinus(.7, 0, height/2 + 60, lerpColor(linesColor, blc, .7), 1 );

  textFont(amiri);
  textSize(150); 
  fill(afimColor);
  text("afim", width/2, height/2);
  //text("afim", width/2, height/2-28); FOR PDF

  textFont(liberation);
  textSize(15);
  fill(0);
  text("Association Francophone d'Informatique Musicale", width/2, height-10);

  if (! pdf) save("current.png");
  if (pdf) {
    println("done"); 
    exit();
  }
}

void sinus(float amp, float ang0, float y0, int col, float weight) {
  strokeWeight(weight);
  stroke(color(col));
  beginShape();
  float change, ampVar, angVar;
  ampVar = 0;
  for (float x = 0; x < width; x +=1) {
    change = x / width; // une var de 0 à 1
    
    if (change < .5) ampVar = map(pow(change, 1), 0, .45, amp, 0);
    if (change > .5) ampVar = map(pow(change, 1), .55, 1, 0, amp);


    float y = (height* ampVar) * map(sin(ang0), -1, 1, 0, 1);
    y += y0 -(height*ampVar)/2  ;
    vertex(x, y);

    //ang0+= angVar;
    ang0+= 0.09;
    //ang0+= map(pow(change, 5), 0, 1, 0.1, 0.3);
  }
  endShape();
}


/**
 SLOW DOWN PARAMETER
 for (float x = 0; x < width; x +=1) {
 change = x / width; // une var de 0 à 1
 
 float ampVar, angVar;
 if (change < .4) {
 ampVar = map(pow(change, 1), 0, .4, amp, amp);
 } else {
 ampVar = map(pow(change, 1), .4, 1, amp, amp);
 }
 angVar = map(pow(change, 0.073), 0, 1, 0.78, 0);
 
 float y = (height* ampVar) * map(sin(ang0), -1, 1, 0, 1);
 y += y0 -(height*ampVar)/2  ;
 vertex(x, y);
 
 ang0+= angVar;
 //ang0+= map(pow(change, 5), 0, 1, 0.1, 0.3);
 }
  **/
  
  /* SYMETRIE PARAMETRE
  ampVar = 0;
  for (float x = 0; x < width; x +=1) {
    change = x / width; // une var de 0 à 1
    
    if (change < .5) ampVar = map(pow(change, 1), 0, .45, amp, 0);
    if (change > .5) ampVar = map(pow(change, 1), .55, 1, 0, amp);


    float y = (height* ampVar) * map(sin(ang0), -1, 1, 0, 1);
    y += y0 -(height*ampVar)/2  ;
    vertex(x, y);

    //ang0+= angVar;
    ang0+= 0.09;
    //ang0+= map(pow(change, 5), 0, 1, 0.1, 0.3);
  }
  endShape();
  
  
  
  */