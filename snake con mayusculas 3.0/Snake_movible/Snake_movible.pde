import processing.serial.*; //importa la libreria serial

Serial puerto; //puerto serial

int x = 15;
int y = 15;
int[] auxX;
int[] auxY;

int total=5;
int manzanax = (int)random(1,28);
int manzanay = (int)random(1,28);
int tecla = -1;
int muerto = 0;

int w=30,h=30,bs=20;
sneke snake = new sneke();

//-------------------------------------------------------------------------------------------------------
void setup(){
  
  println(Serial.list()); //imprime en pantalla los dispositivos 
  
  puerto= new Serial(this, Serial.list()[0], 9800); //se crea un puerto serial
  
  puerto.bufferUntil('\n'); //genera un evento serial hasta que se identifica
  
  
  size(600, 600);
  // size(w*bs, h*bs);
  frameRate(10);
  //auxX[0] = 15;
  //auxY[0] = 15;
}


//-------------------------------------------------------------------------------------------------------

void serialEvent(Serial puerto) {

  String dato= puerto.readStringUntil('\n');
  
  if(dato !=null) {
    background(0);
    textSize(100);  
    text(dato,100,200);  
  }  
} 

void draw(){
  
  background(0);
  
  if(muerto==0){
    
    //crea la matriz
    for (int i=0;i<w;i++) line(i*bs,0,i*bs,height);
    for (int i=0;i<h;i++) line(0,i*bs,width,i*bs);
   
    
    auxY = snake.getY(); //Lee los datos en el vectorY y los almacena en una variable auxiliar
    auxX = snake.getX(); //Lee los datos en el vectorX y los almacena en una variable auxiliar
    
    
    println("auxX: "+auxX[0] + "   auxY: "+auxY[0]);
    
  
    //modificacion de los datos del vector Y
    for(int i = 0 ; i < total-1 ; i++)
    {
      
      if(i!=0){
        auxY[i] = auxY[i-1];
        auxX[i] = auxX[i-1];
      }
      
      //dibuja el snake
      rect(auxX[i]*bs, auxY[i]*bs, bs, bs);
      
    }
    fill(255,0,0);
    

    
    
    //cuando el snake come una manzana se genera una nueva posicion para la manzana
    if(auxX[0] == manzanax && auxY[0] == manzanay){
      manzanax = (int)random(1,28);
      manzanay = (int)random(1,28);
      total++;
    } 
    
    //llama a la funcion para dibujar la manzana
    manzana();
    
    //lee la tecla presionada y el snake se mueve dependiendo de que tecla fue presionada
    switch(tecla){
      
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
  
  //limites de pantalla (si el snake llega al limite pierde)
  if (auxX[0]>=30) gameover();
    
  if (auxX[0]<=-1) gameover();
    
  if (auxY[0]>=30) gameover();
    
  if (auxY[0]<=-1) gameover();
  
  total -= 2;
  
  //print("Tecla1:"+tecla+ "  total:  " + total + "    manzana x y: "+manzanax+"   "+manzanay);
  println();
  
  total += 2;
  
    //fin de la lectura y modificacion del vector Y
    snake.setY(auxY);
    snake.setX(auxX);  
  
}

//-------------------------------------------------------------------------------------------------------

//lee el codigo de la tecla presionada y lo almacena en una variable
void keyPressed(){
  tecla = keyCode;
}

//-------------------------------------------------------------------------------------------------------

//cuando el snake muere se setean todas las variables otra vez
void gameover(){
  muerto=1;
  textSize(50);
  text("GAME OVER",150,250);
  textSize(30);
  text("PRESS SPACE TO RESTART",110,350);
  if(tecla == 32){
    auxX[0]=15;
    auxY[0]=15;
    muerto=0;
    total=2;
    manzanax = (int)random(1,28);
    manzanay = (int)random(1,28);
  }
}

//-------------------------------------------------------------------------------------------------------

//dibuja la manzana
void manzana(){
  rect(manzanax*bs,manzanay*bs,bs,bs);
  fill(255);
}
