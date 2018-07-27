// This is the Kernal wrapper

#include "cuRoot.hh"
#include <stdio.h>
#include <iostream>
#include <cuda.h>

__global__ void printFromGPU(int N)
{
  int tid=threadIdx.x+blockDim.x*blockIdx.x;
  if(tid<N)
  {
    printf("\t\tThis is from Device block %d, thread %d, from cuRoot.\n",blockIdx.x,threadIdx.x);
  }
}

GpuInterface::GpuInterface()
:N(4)
{
  std::cout<<"\tGPU Interface constructed.\n";
}

GpuInterface::~GpuInterface()
{
  std::cout<<"\tGPU Interface deconstructed.\n";
}

void GpuInterface::printInfo()
{
  printFromGPU<<<2,2>>>(N);
  cudaDeviceReset();
}
void GpuInterface::calculation()
{

}
