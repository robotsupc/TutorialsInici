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

int vel(char doe); //consultar velocitat del motor d o e

bool dir(char doe); //consulatar direcció del motor d o e

void avanca(int x, int y); // calculs de direcció i velocitat

};


#endif
