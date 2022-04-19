CC=clang

all: gen-pacman-nopass pacman-nopass

gen-pacman-nopass: gen.py
	./gen.py

pacman-nopass: pacman-nopass.c
	$(CC) -o pacman-nopass pacman-nopass.c
	sudo chown root pacman-nopass
	sudo chmod +s pacman-nopass

install: pacman-nopass
	sudo cp pacman-nopass /usr/bin/pacman-nopass
	sudo chown root /usr/bin/pacman-nopass
	sudo chmod +s /usr/bin/pacman-nopass

clean:
	rm -f pacman-nopass.c pacman-nopass