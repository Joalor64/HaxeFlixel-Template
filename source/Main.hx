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
	 * Width of the game in pixels.
	 */
	public static inline final GAME_WIDTH:Int = 1280;

	/**
	 * Height of the game in pixels.
	 */
	public static inline final GAME_HEIGHT:Int = 720;

	/**
	 * How many frames per second the game should run at.
	 */
	public static inline final FRAMERATE:Int = 60;

	/**
	 * Whether to skip the flixel splash screen that appears in release mode.
	 */
	public static inline final SKIP_SPLASH:Bool = false;

	/**
	 * Whether to start the game in fullscreen on desktop targets.
	 */
	public static inline final START_FULLSCREEN:Bool = false;

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

		addChild(new FlxGame(GAME_WIDTH, GAME_HEIGHT, PlayState, FRAMERATE, FRAMERATE, SKIP_SPLASH, START_FULLSCREEN));
	}
}
