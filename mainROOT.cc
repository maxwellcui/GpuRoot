// This is a root program
#include <iostream>
#include "cuRoot.hh"

#include "TCanvas.h"
#include "TROOT.h"
#include "TF1.h"
#include "TFile.h"
#include "TTree.h"


int main()
{
  std::cout<<"\tPrinting from the host...\n";

  TFile *dataFile=new TFile("/media/maxwellcui/massiveStorage/MCDATA/signal/user.sberlend.14266920._000001.output.root");

  TTree *inputTree=new TTree;
  dataFile->GetObject("nominal_Loose",inputTree);
  inputTree->Print();

  GpuInterface *gpuObj=new GpuInterface;
  gpuObj->printInfo();
  delete gpuObj;

  return 0;
}
