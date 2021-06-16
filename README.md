# Setup OSX 

Shell scripts to setup and prepare development environment on OSX

## How to use 🍺

Basically one just have to run the script and it needs only one parameter, which is the raw url for the file and/or gist with your *ZSHRC* config files.
This *ZSHRC* must have inside it a string `%USERNAME%` inside the `ZSH` environment variable that will be replaced by `whoami` value, which is basically the username current logged in, as one can see bellow:

```sh
export ZSH="/Users/%USERNAME%/.oh-my-zsh"
```

On [.zshrc.example](./.zshrc.example) file one can see a few settings used as example that can be very useful, especially if one is using an **M1** processor machine, like this code from line 7 to 11:

```sh
if [ "$(arch)" = "arm64" ]; then
  eval $(/opt/homebrew/bin/brew shellenv);
else
  eval $(/usr/local/bin/brew shellenv);
fi
```

This code is used to aim the correct *brew* setup considering if one is using a *brew* rosetta setup or a native m1 setup.

As it's been said before, one needs to pass a gist/url parameter to run the setup script, following the example bellow:

```sh
sh ./setup.sh [URL_GIST]
```

```sh
sh ./setup.sh https://gist.githubusercontent.com/venturalp/f42f5572045f8ef594f9ff2d257096f5/raw/86c92dac2b5fc32042110ec978c3ceef7fcef3ab/.zshrc
```

This file from the parameter url will be placed at `~/.zshrc` to set the zsh alias and configs.
