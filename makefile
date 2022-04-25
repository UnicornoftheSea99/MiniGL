CC = g++
CXXFLAGS = -std=c++20 -O2
LDFLAGS = -lGL -lGLEW -lglfw3 -L/usr/local/lib

default: all

all: minigl_cube standard_cube texture_demo render_to_texture game_of_life fluids

fluids: fluids.o minigl.o 
	$(CC) -o fluids.exe fluids.o minigl.o $(LDFLAGS)

game_of_life: game_of_life.o minigl.o
	$(CC) -o game_of_life.exe game_of_life.o minigl.o $(LDFLAGS)

render_to_texture: render_to_texture.o minigl.o 
	$(CC) -o render_to_texture.exe render_to_texture.o minigl.o $(LDFLAGS)

texture_demo: texture_demo.o minigl.o 
	$(CC) -o texture_demo.exe texture_demo.o minigl.o $(LDFLAGS)

standard_cube: standard_cube.o shader_loader.o 
	$(CC) -o standard_cube.exe standard_cube.o shader_loader.o $(LDFLAGS)

minigl_cube: minigl_cube.o minigl.o
	$(CC) -o minigl_cube.exe minigl_cube.o minigl.o $(LDFLAGS)

sandbox: sandbox.o minigl.o 
	$(CC) -o sandbox.exe sandbox.o minigl.o $(LDFLAGS)

texture_demo.o: minigl.hpp
sandbox.o: minigl.hpp
standard_cube.o: shader_loader.hpp
shader_loader.o: shader_loader.hpp
minigl.o: minigl.hpp
render_to_texture.o: minigl.hpp
game_of_life.o: minigl.hpp
fluids.o: minigl.hpp

clean:
	rm -f *.exe *.exe.* *.o

.PHONY: clean