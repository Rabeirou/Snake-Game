int x = 15;
int y = 15;
int total=0;
int manzanax = (int)random(1,28);
int manzanay = (int)random(1,28);
int tecla = -1;
int muerto = 0;

int w=30,h=30,bs=20;
sneke snake = new sneke();

//-------------------------------------------------------------------------------------------------------
void setup(){
  size(600, 600);
  // size(w*bs, h*bs);
  frameRate(10); 
}

//-------------------------------------------------------------------------------------------------------

void draw(){
  
  background(0);
  
  if(muerto==0){
    
    //crea la matriz
    for (int i=0;i<w;i++) line(i*bs,0,i*bs,height);
    for (int i=0;i<h;i++) line(0,i*bs,width,i*bs);
   
    
    int[] auxY = snake.getY(); //Lee los datos en el vectorY y los almacena en una variable auxiliar
    int[] auxX = snake.getX(); //Lee los datos en el vectorX y los almacena en una variable auxiliar
    
  
    //modificacion de los datos del vector Y
    for(int i = 0 ; i < total ; i++)
    {
      //  auxY[i];
      //  auxX[i];
    }
    
    
    //fin de la lectura y modificacion del vector Y
    snake.setY( auxY );
    snake.setX( auxX );
    
    
    //dibuja el snake
    rect(x*bs, y*bs, bs, bs);
    fill(255, 0, 0);
    
    //cuando el snake come una manzana se genera una nueva posicion para la manzana
    if(x == manzanax && y == manzanay){
      manzanax = (int)random(1,28);
      manzanay = (int)random(1,28);
      total++;
    } 
    
    //llama a la funcion para dibujar la manzana
    manzana();
    
    //lee la tecla presionada y el snake se mueve dependiendo de que tecla fue presionada
    switch(tecla){
      
      case 38: 
        y--;
        break;
      case 40: 
        y++;
        break;
      case 39: 
        x++;
        break;
      case 37: 
        x--;
        break;
      
      default:
        break;
      
    }
    
  }
  
  //limites de pantalla (si el snake llega al limite pierde)
  if (x>=30) gameover();
    
  if (x<=-1) gameover();
    
  if (y>=30) gameover();
    
  if (y<=-1) gameover();
  
  print("Tecla1:"+tecla+ "  total:  " + total);
  println();
  
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
    x=15;
    y=15;
    muerto=0;
    total=0;
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
