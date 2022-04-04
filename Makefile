.PHONY: all install-homebrew tap-kegs install-packages start-services install-casks

all: install-homebrew tap-kegs install-packages start-services install-casks

install-homebrew:
	@which brew > /dev/null || /usr/bin/ruby -e "$(shell curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

tap-kegs:
	xargs -n1 brew tap < kegs.txt

install-packages:
	xargs brew install < packages.txt

start-services:
	xargs -n1 brew services start < start-services.txt

install-casks:
	xargs brew install --cask < casks.txt
