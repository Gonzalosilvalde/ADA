# Nombre del ejecutable final
TARGET = main

# Archivos fuente
WRAPPER_SRC = opencv_wrapper.cpp
ADA_SRC = main.adb

# Biblioteca compartida generada por el wrapper
WRAPPER_LIB = libopencv_wrapper.so

# Opciones de compilación
CXX = g++
CXXFLAGS = -fPIC -shared $(shell pkg-config --cflags opencv4)
LDFLAGS = -L. -lopencv_wrapper $(shell pkg-config --libs opencv4) -Wl,-rpath=.
GNATMAKE = gnatmake

# Regla para compilar todo el proyecto
all: $(TARGET)

# Compilar el wrapper de C++ a una biblioteca compartida
$(WRAPPER_LIB): $(WRAPPER_SRC)
	$(CXX) $(CXXFLAGS) -o $@ $<

# Compilar el programa Ada, enlazando con la biblioteca del wrapper y OpenCV
$(TARGET): $(ADA_SRC) $(WRAPPER_LIB)
	$(GNATMAKE) $(ADA_SRC) -largs $(LDFLAGS)

# Limpiar archivos generados
clean:
	rm -f $(TARGET) $(TARGET).ali $(TARGET).o $(WRAPPER_LIB)
	rm -f *.o *.ali

# Phony targets
.PHONY: all clean

