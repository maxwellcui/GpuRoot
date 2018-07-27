CXX=g++
NVCC=nvcc

CUDA_INSTALL_PATH=/usr/local/cuda-7.5
COMMONFLAGS=-l.

NVCCFLAGS+=$(COMMONFLAGS) -l$(CUDA_INSTALL_PATH)/include

CXXFLAGS+=$(COMMONFLAGS) -std=c++11
LIB_CUDA=-L$(CUDA_INSTALL_PATH)/lib64 -lcudart
LIB_ROOT=$(shell root-config --cflags --libs)


OBJS=cuRoot.cu.o mainROOT.cc.o
TARGET=exec

.SUFFIXES: .cc .cu .o

%.cc.o:%.cc
	@echo "\tBuilding $@..."
	$(CXX) $(LIB_ROOT) -c $< -o $@
	@echo "\tDone\n"

%.cu.o:%.cu
	@echo "\tBuilding $@..."
	$(NVCC) $(NVCCFLAGS) -c $< -o $@
	@echo "\tDone\n"

$(TARGET):$(OBJS)
	@echo "\tLinking objets.."
	$(CXX) -o $@ $^ $(LIB_CUDA) $(LIB_ROOT)
	@echo "\tDone\n"


clean:
	rm -f *.o $(TARGET)
