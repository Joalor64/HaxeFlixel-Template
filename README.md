# HaxeFlixel Template
Just a simple template for making games with HaxeFlixel.

## Setup
Make sure to install [Haxe](https://haxe.org/download/) first!

Install/update the libraries with the following command:
```bash
haxe --interp -cp ./actions/libs-installer -main Main
```

Setup Lime if you haven't with this command:
```bash
haxelib run lime setup
```

To actually build the game, run this command:
```bash
lime test [platform] # Replace [platform] with whatever platform you're building for
```
Add `-debug` to make a debug build.