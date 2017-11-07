#ifndef CONTROL
#define CONTROL
class control {

private:

struct motor{
  bool flag;
  int vel;
};
motor motD;
motor motE;

public:

int velD(); //consultar velocitat del motor dret
int velE(); //consultar velocitat del motor esquerra

bool dirD(); //consulatar direcció del motor dret
bool dirE(); //consulatar direcció del motor esquerra

void avanca(int x, int y); // calculs de direcció i velocitat

};


#endif
