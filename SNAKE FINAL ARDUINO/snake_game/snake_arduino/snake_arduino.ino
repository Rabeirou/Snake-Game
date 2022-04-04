int x=0;

void setup(){

  Serial.begin(9800);
  
  pinMode(12, INPUT); //boton1
  pinMode(11, INPUT); //boton2
  pinMode(9, INPUT); //boton4
  pinMode(10, INPUT); //boton3

}

void loop(){
  
  if(digitalRead(12) == LOW){
    x = 1;
    delay(10);
  }
  else if(digitalRead(11) == LOW){
    x = 2;
    delay(10);
  }
  else if(digitalRead(10) == LOW){
    x = 3;
    delay(10);
  }
  else if(digitalRead(9) == LOW){
    x = 4;
    delay(10);
  }
  else {
    x = 0;
    delay(10);
  }
  
  Serial.print(x); Serial.print('.');

}
