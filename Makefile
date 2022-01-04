#!make
MAKEFLAGS += --silent
.PHONY: clean build start
DEFAULT: start-debug
# In future if needed:
# include .env
# export $(shell sed 's/=.*//' .env)

build-assets:
	node scripts/build-assets.js

build-pug:
	node scripts/build-pug.js

build-scripts:
	node scripts/build-scripts.js

build-scss:
	node scripts/build-scss.js

build: clean build-pug build-scss build-scripts build-assets

clean:
	node scripts/clean.js

clean-all: clean
	rm -rf node_modules/ dist/

start: build
	node scripts/start.js

start-debug: npm-install build
	node scripts/start-debug.js

npm-install:
	npm install

npm-update:
	npm update
