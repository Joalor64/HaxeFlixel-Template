package;

import openfl.Lib;
import flixel.FlxGame;
import openfl.display.Sprite;

/**
 * The main entry point for the game.
 */
class Main extends Sprite
{
	/**
	 * Configuration values for the game. You should not need to change these at runtime.
	 */
	public final config:Dynamic = {
		gameDimensions: [1280, 720], // Width + Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
		zoom: -1.0, // If -1, zoom is automatically calculated to fit the window dimensions. (Removed since Flixel 5.0.0)
		framerate: 60, // How many frames per second the game should run at.
		initialState: PlayState, // The state in which the game will start.
		skipSplash: false, // Whether to skip the flixel splash screen that appears in release mode.
		startFullscreen: false // Whether to start the game in fullscreen on desktop targets.
	};

	// You can pretty much ignore everything from here on - your code should go in your states.

	/**
	 * The entry point of the application.
	 */
	public static function main():Void
	{
		#if android
		Sys.setCwd(haxe.io.Path.addTrailingSlash(extension.androidtools.os.Build.VERSION.SDK_INT > 30 ? extension.androidtools.content.Context.getObbDir() : extension.androidtools.content.Context.getExternalFilesDir()));
		#elseif ios
		Sys.setCwd(haxe.io.Path.addTrailingSlash(openfl.filesystem.File.documentsDirectory.nativePath));
		#end

		Lib.current.addChild(new Main());
	}

	/**
	 * Initializes the game and sets up the application.
	 */
	public function new():Void
	{
		super();

		addChild(new FlxGame(config.gameDimensions[0], config.gameDimensions[1], config.initialState, #if (flixel < "5.0.0") config.zoom, #end
			config.framerate, config.framerate, config.skipSplash, config.startFullscreen));
	}
}
