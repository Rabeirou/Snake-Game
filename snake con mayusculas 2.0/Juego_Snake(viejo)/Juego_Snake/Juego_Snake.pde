int posx=320,posy=240; //coordenadas xy del punto 

void setup(){
  size(640,480);
  background(0,123,203);
}

void draw(){
  background(0,123,203);
  
  if(!keyPressed){
    ellipse(320, 240, 25, 25); //dibuja el punto en el centro
  }else{
    ellipse(posx, posy, 25, 25); //dibuja el punto dependiendo de la tecla presionada
  }

}

void keyPressed(){
    
    println(key); //test para ver si lee la tecla
  
    switch(key){ //segun la letra cambia la posicion de el punto
      
      case 'w':
        posx=320;
        posy=120;
        break;
      
      case 'a':
        posx=160;
        posy=240;
        break;
        
      case 's':
        posx=320;
        posy=360;
        break;
        
      case 'd':
        posx=480;
        posy=240;
        break;
        
      default:
        posx=320;
        posy=240;
      
    }  
  
}
