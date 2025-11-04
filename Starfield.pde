class Particle{
  double myX, myY, myColor, myAngle, mySpeed, mySize;
  int startTime;

  Particle(){
    myX = 500;
    myY = 500;
    myColor = Math.random()*100;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*3+5;
    mySize = Math.random()*20+10;
    startTime = millis();
}

void show(){
  noStroke();
  fill((float)myColor,(float)myColor+50,(float)myColor+100);
  ellipse((float)myX, (float)myY, (int)mySize, (int)mySize);
}

void drift(){
  myX = myX + Math.cos(myAngle) * mySpeed;
  myY = myY + Math.sin(myAngle) * mySpeed;
  if(millis() - startTime >= 2200){
    myX = 500;
    myY = 500;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*3+5;
    startTime = millis();
    }
  }
}

class Oddball extends Particle{
 
  
  Oddball(){
    myColor = -100;
    mySize = 50;
  }
  
  void drift() {
    myX = myX + Math.cos(myAngle) * mySpeed + Math.random() * 10 - 5;
    myY = myY + Math.sin(myAngle) * mySpeed + Math.random() * 10 - 5;
    if(millis() - startTime >= 2200){
      myX = 500;
      myY = 500;
      myAngle = Math.random()*2*Math.PI;
      mySpeed = Math.random()*3+5;
      startTime = millis();
    }
   }
}

Particle [] bob = new Particle[100];
void setup(){
  size(1000,1000);
  for (int i = 0; i < 97; i++){
    bob[i] = new Particle();
}
  for (int i = 97; i < 100; i++){
    bob[i] = new Oddball();
  }
}

void draw(){
  fill(255,255,255,50);
  rect(0,0,1000,1000);
  for (int i = 0; i < bob.length; i++){
  bob[i].show();
  bob[i].drift();
  }
}

