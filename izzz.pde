boolean gameone=true;
boolean tricycle =false;
boolean stop=false;
boolean perm_1=true;
boolean perm_2=false;
boolean perm_3=false;
int firex=200;
int firey=200;
int dist=0;
int vies=3;
boolean bagnole = false;


int niveau =0;
void setup (){
  size (500,300);
}
void hiro(){
  background (200);
  fill (240,220,240);
  rect (10,100,50,200);
  fill (0);
  rect (10,100,50,20);
  fill (175);
  rect (10,160,50,150);
  fill (200);
  rect (10,230,50,100);
  fill (0);
  rect (15,125,15,15);
  rect (40,125,15,15);
  fill (240,220,240);
  rect (17,127,11,11);
  rect (42,127,11,11);
  textSize (15);
  fill (0);
  text ("Sorry but it is an act of buglary, i dont wanna be in trubble",10,20);
  text ("but i will pick you up by my latest motorized tricycle",10,40);
  stop=true;
  bagnole=true;
  text ("N next",300,300);
  if (keyPressed){
    if (key=='n'){
      stop=false;
    }
  }
}
void restart (){
  if (keyPressed){
    if (key == 'r'){
      gameone = true;
      stop= false;
      perm_1=true;
      perm_2=false;
      vies=3;
      //perm_3=false;
    }
  }
}
void porte (){
  stroke (0);
  line (200,10,200,10);
  fill (100);
  rect (0,0,500,300);
  line (250,0,250,300);
  fill (0);
  ellipse (300,150,40,40);
  rect (285,150,30,70);
}
void questions (){
  textSize (20);
  text ("THE DOOR IS LOCKED WHAT WOULD YOU DO ?",10,25);
  fill (200);
  rect (340,50,150,40);
  textSize(12);
  //text ("ask hiro to pick the lock",340,60);
  rect (340,100,150,40);
  rect (340,150,150,40);
  fill (0);
  text ("A ask hiro to pick the lock",340,75);
  text ("B blow the door up",340,125);
  text ("C firebend to a widow",340,175);
  if (keyPressed){
    if (key == 'b'){
      game_over ();
    }
    if (key=='a'){
      hiro();
    }
    if (key=='c'){
      perm_1=false;
      perm_2=true;
    }
  }
}
void game_over(){
  gameone=false;
  bagnole=false;
  background (0);
  textSize (50);
  fill (250);
  text("GAME OVER",10,100);
  noFill();
  textSize (20);
  text ("R restat",10,200);
  //perm_1=true;
  //perm_2=false;
  //perm_3=false;
  
      
}

void niv_1 (){
  //restart();
  
  if (perm_1==true){
    if (stop==false){
    background (250);
    porte();
    questions();
  }
    else {
      hiro();
    }
  }
}


void niv_2 () {
  restart ();
  if (perm_2==true){
    //print (dist);
    fenetre();
    
    fire();
  }
}
void fire (){
  
  fill (0,0,250);
  ellipse (firex,firey,10,10);
  if (keyPressed){
    if (key==CODED){
      if (keyCode==UP){
        firey=firey-8;
        dist = dist+1;
      }
      if (keyCode==DOWN){
        firey=firey+8;
        dist = dist+1;
      }
      if (keyCode==RIGHT){
        firex=firex+8;
        dist = dist+1;
      }
      if (keyCode==LEFT){
        firex=firex-8;
        dist = dist+1;
      }
    }
  }
  if (!(((firex>=190)&&(firex<=210)&&(firey<=210)&&(firey>=90))||((firex>=290)&&(firex<=310)&&(firey<=210)&&(firey>=90))||((firey>=90)&&(firey<=110)&&(firex<=310)&&(firex>=190))||((firex<=310)&&(firex>=190)&&(firey<=210)&&(firey>=190)))){
    vies = vies - 1;
    firex = 200;
    firey =200;
    dist=0;
   // print (firex," win ",firey," ");
   
  }
  if (vies == 0){
    game_over();
  }
  if (dist>=50){
    fenetre2();
    //perm_2=false;
    //perm_3=true;
  }
  //textSize (20);
  //text("3 shots before you get caught",400,400);
}
void fenetre (){
  background (125);
  //noFill();
  fill (50);
  rect (190,90,120,120);
  //rect (200,100,100,100);
  fill(0);
  rect (210,110,80,80);
  textSize(20);
  text("melt the thing that holds the window to the wall",5,15);
  text("with your blue flames",75,35);
  
}
void fenetre2 (){
  background (125);
  //noFill();
  fill (50);
  rect (190,90,120,120);
  //rect (200,100,100,100);
  
  fill (250,125);
  rect (210,110,80,80);
  rect(320,120,60,60);
  fill(0);
  rect(220,120,60,60);
  perm_2=false;
  perm_3=true;
  text("congrates you'v made it to her room",5,15);
  

  
  
}
void draw (){
  restart ();
  if (gameone==true){
    
    niv_1();
    niv_2();
  }
}
  
  
  
  //print (gameone);
