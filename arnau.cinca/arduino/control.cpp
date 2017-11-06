#include "control.h"
#include <Arduino.h> //només és per fer el serial print

int control::vel(char doe){
  if (doe == 'D' or doe == 'd') return motD.vel;
  else if (doe == 'E' or doe == 'e') return motE.vel;
  else Serial.println("Motor incorrecte");
}

bool control::dir(char doe){
  if (doe == 'D' or doe == 'd') return motD.flag;
  else if (doe == 'E' or doe == 'e') return motE.flag;
  else Serial.println("Motor incorrecte");
}
void control::avanca(int x, int y){

  if(y>0){
    motD.flag = motE.flag = true;
    if(x>0){
      motD.vel= y-x;
      motE.vel= y;
    }
    else{
      motD.vel= y;
      motE.vel= y+x;
    }
  }
  else{
    y= -y;
    // x = -x; //potser tambe s'ha d'invertir x
    motD.flag = motE.flag = false;
    if(x>0){
      motD.vel= y-x;
      motE.vel= y;
    }
    else{
      motD.vel= y;
      motE.vel= y+x;
    }
  }
  //casos que y es proper a 0 i amb una x mes gran canvien de sentit
  if(motD.vel<0){
    motD.flag = !motD.flag;
    motD.vel = -motD.vel;
  }
  if(motE.vel<0){
    motE.flag = !motE.flag;
    motE.vel = -motE.vel;
  }
}
