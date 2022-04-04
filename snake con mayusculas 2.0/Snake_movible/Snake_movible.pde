sneke snake = new sneke(); //objeto snake

final int sum = 1; //la cantidad de cuadrados que se suman al comer una manzana
int total=1; //almacena el puntaje total del jugador

int[] auxX; //auxiliar del vectorX en el objeto snake
int[] auxY; //auxiliar del vectorY en el objeto snake

int manzanax = (int)random(0,29); //posicion de la manzana en x
int manzanay = (int)random(0,29); //posicion de la manzana en y

int tecla = -1; //lee la tecla presionada
int tecla2 = -1; //auxiliar de tecla

boolean muerto = false; //controla si el jugador esta vivo o muerto
boolean youWin = false; //controla si el jugador llego al puntaje maximo

int w=30,h=30; //width(ancho) y height(altura) de la pantalla
int bs=20; //block size(tamaño en pixeles de cada unidad en el juego)

//--------------------------------------------------------------------------------------------------------------------------------------------

void setup(){
  size(600, 600);
  frameRate(10);
}

//--------------------------------------------------------------------------------------------------------------------------------------------

void draw(){
  
  if(total>=899){
    youWin = true;
    muerto = true;
  }
  
  if(muerto==true) gameover();
  
  auxY = snake.getY(); //Lee los datos del objeto snake en el vectorY y los almacena en una variable auxiliar
  auxX = snake.getX(); //Lee los datos del objeto snake en el vectorX y los almacena en una variable auxiliar
  
  snakeCollision(); //controla que el snake no se choque con el mismo
  
  screenLimits(); //limites de pantalla (si el snake llega al limite pierde)
  
  if(muerto==false){
    
    background(0);
    
    showScore(); //muestra el puntaje del jugador en tiempo real
    
    //modificacion de los datos
    //posiciona todas las partes del snake
    for(int i = total-1 ; i > 0 ; i--){
      auxY[i] = auxY[i-1];
      auxX[i] = auxX[i-1];
    }
    
    snakeDir(); //lee la tecla presionada y selecciona la direccion en la cual se movera el snake
    
    //dibuja el snake
    for(int i = 0 ; i < total ; i++){     
      rect(auxX[i]*bs, auxY[i]*bs, bs, bs);
    }

    //cuando el snake come una manzana se genera una nueva posicion para la manzana
    if(auxX[0] == manzanax && auxY[0] == manzanay){
      pickNewLocation(); //elige una nueva posicion para la manzana
      total += sum; //a total se le suma el valor de la variable sum(descripcion arriba)
    } 
    
    manzana(); //dibuja la manzana
    
  }
  
  snake.setY(auxY); //agrega los datos modificados en el vectorY al objeto snake
  snake.setX(auxX); //agrega los datos modificados en el vectorX al objeto snake
  
}

//--------------------------------------------------------------------------------------------------------------------------------------------

//lee el codigo de la tecla presionada y lo almacena en una variable
void keyPressed(){
  tecla = keyCode;
  if(tecla==38 && auxY[0]-1!=auxY[1] || tecla==40 && auxY[0]+1!=auxY[1] || tecla==39 && auxX[0]+1!=auxX[1] || tecla==37 && auxX[0]-1!=auxX[1]){
    tecla2=tecla; //controla que la tecla presionada sea una de las flechas y que el snake no se mueva en reversa
  }
}

//--------------------------------------------------------------------------------------------------------------------------------------------

void snakeDir(){
  
  if(muerto==false){
    switch(tecla2){
      case 38:
          auxY[0]--;
        break;
      case 40:
          auxY[0]++;
        break;
      case 39: 
          auxX[0]++;
        break;
      case 37: 
          auxX[0]--;
        break;
        
      default:
        break;
    } 
  }
  
}

//--------------------------------------------------------------------------------------------------------------------------------------------

void pickNewLocation(){
  boolean falla=true;
  while(falla==true){
    manzanax = (int)random(0,29);
    manzanay = (int)random(0,29);
    falla = false;
    for(int i = 0; i < total; i++){
      if(manzanax==auxX[i] && manzanay==auxY[i]){
        falla=true;
      }
    }
  }
}

//--------------------------------------------------------------------------------------------------------------------------------------------

void manzana(){
  fill(255,0,0);
  rect(manzanax*bs,manzanay*bs,bs,bs);
}

//--------------------------------------------------------------------------------------------------------------------------------------------

void screenLimits(){
  if (auxX[0]>=w || auxX[0]<=-1 || auxY[0]>=h || auxY[0]<=-1){ 
    muerto = true;
    gameover();
  }
}

//--------------------------------------------------------------------------------------------------------------------------------------------

void snakeCollision(){
  for(int i = 1; i < total; i++){
    if(auxX[0] == auxX[i] && auxY[0] == auxY[i]){
      muerto = true;
    }
  }
}

//--------------------------------------------------------------------------------------------------------------------------------------------

void showScore(){
  fill(255);
  textSize(15);
  text("SCORE: "+ total,10,20);
}

//--------------------------------------------------------------------------------------------------------------------------------------------

//cuando el snake muere/gana se muestra una pantalla de game over/you win y se setean todas las variables como al inicio
void gameover(){
  background(0);
  fill(255);
  textSize(50);
  if(youWin==false){
    text("GAME OVER",155,200);
  }else{
    text("YOU WIN",190,200);
  }
  textSize(30);
  text("SCORE: "+total,218,300);
  textSize(20);
  text("PRESS SPACE TO RESTART",170,400);
  
  for(int i = 1 ; i < total ; i++){
    auxX[i] = -1;
    auxY[i] = -1;
  }
  
  if(tecla == 32){
    auxX[0] = 15;
    auxY[0] = 15;
    muerto = false;
    youWin = false;
    total = 1;
    tecla = -1;
    tecla2 = -1;
    manzanax = (int)random(0,29);
    manzanay = (int)random(1,29);
  }
}
