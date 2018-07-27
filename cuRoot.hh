// This is the header file of the cuRoot lib

#ifndef CUROOT_HH
#define CUROOT_HH

class GpuInterface
{
public:
  GpuInterface();
  ~GpuInterface();
  void printInfo();
  void calculation();

  int N;

};



#endif
