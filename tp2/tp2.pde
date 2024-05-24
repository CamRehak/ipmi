int posX = 200;
int pantalla = 1;

PImage img ;
PImage img2 ;
PImage img3 ;

int x = 0;
int y = 240;
float tamFont = 0;
PFont font;

int alpha = 0;

int botonPosX = 270;
int botonPosY = 350;
int botonWidth = 100;
int botonHeight = 40;

void setup () {
   size(640,480);
  background(967);
  textAlign(CENTER);
  font= loadFont("MongolianBaiti-30.vlw");
  img=loadImage ("IMAGEN1.jpeg");
  img2=loadImage ("IMAGEN2.jpeg");
  img3=loadImage ("IMAGEN3.jpeg");
  
  posX = -width/2;
  posX = -height/2;
 

}
void draw(){
  if(pantalla == 1){
    image(img,0,0);
    stroke(0);
    fill(255);
    textSize(30);
    text("¡Mi nombre es Monkey D. Luffy y sere el Rey de los Piratas!", x, 200, 420, 400);
    x += 1;
    
    
  }else if(pantalla == 2){
     image(img2,0,0);
     textSize(tamFont);
    fill(0);
    text("¡Aunque a veces es doloroso, si sigues viviendo, pueden suceder cosas buenas!", 320, 240);
    tamFont += 0.2; 
  
  
  }else if(pantalla == 3){
    image(img3,0,0);
    fill(255, alpha);
    textSize(20);
  text( "Todos mis obstáculos fueron removidos. Ahora soy el dios del nuevo mundo.", width/2, height/2);
  alpha++;
  
  fill(255, 32, 32);
    rect (botonPosX, botonPosY, botonWidth, botonHeight);
    fill(255);
    textSize(16);
    text ("Volver", botonPosX + botonWidth / 2, botonPosY + botonHeight / 2 + 6);
    }
  
  if(frameCount%(60*5) == 0){
    pantalla = pantalla + 1;
  }
}

void mouseClicked() {
  if (pantalla == 3) {
    if (mouseX > botonPosX && mouseX < botonPosX + botonWidth && mouseY > botonPosY && mouseY < botonPosY + botonHeight) {
      pantalla = 1;
      x = 0; 
      tamFont = 0;  
      alpha = 0; 
    }
  }
}
