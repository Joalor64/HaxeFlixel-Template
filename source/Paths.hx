package;

#if sys
import sys.FileSystem;
#end
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.utils.Assets;

/**
 * Provides utility functions for handling asset paths and loading assets in a game.
 */
@:keep
class Paths
{
	/**
	 * The sound extension to use.
	 */
	inline public static final SOUND_EXT:String = #if !html5 "ogg" #else "mp3" #end;

	/**
	 * The default folder to use when looking for assets.
	 */
	inline public static final DEFAULT_FOLDER:String = 'assets';

	/**
	 * Helper function to get the path to a file, with an optional folder.
	 * If the file isn't in that folder, or no folder is given, the path in `DEFAULT_FOLDER` is returned instead.
	 * @param file The file to look for.
	 * @param folder The folder to look in first.
	 * @return The path to the file.
	 */
	static public function getPath(file:String, ?folder:String):String
	{
		if (folder != null && folder != DEFAULT_FOLDER)
		{
			final path:String = '$folder/$file';

			if (Assets.exists(path) #if sys || FileSystem.exists(path) #end)
				return path;
		}

		return '$DEFAULT_FOLDER/$file';
	}

	/**
	 * Gets a text file.
	 * @param key The key for the text file.
	 * @param folder The folder to look in, if it exists.
	 * @return The path to the text file.
	 */
	inline static public function txt(key:String, ?folder:String):String
		return getPath('data/$key.txt', folder);

	/**
	 * Gets an XML file.
	 * @param key The key for the XML file.
	 * @param folder The folder to look in, if it exists.
	 * @return The path to the XML file.
	 */
	inline static public function xml(key:String, ?folder:String):String
		return getPath('data/$key.xml', folder);

	/**
	 * Gets a JSON file.
	 * @param key The key for the JSON file.
	 * @param folder The folder to look in, if it exists.
	 * @return The path to the JSON file.
	 */
	inline static public function json(key:String, ?folder:String):String
		return getPath('data/$key.json', folder);

	/**
	 * Gets a YAML file.
	 * @param key The key for the YAML file.
	 * @param folder The folder to look in, if it exists.
	 * @return The path to the YAML file.
	 */
	#if yaml
	inline static public function yaml(key:String, ?folder:String):String
		return getPath('data/$key.yaml', folder);
	#end

	/**
	 * Gets a video file.
	 * @param key The key for the video file.
	 * @param folder The folder to look in, if it exists.
	 * @return The path to the video file.
	 */
	inline static public function video(key:String, ?folder:String):String
		return getPath('videos/$key.mp4', folder);

	/**
	 * Gets a sound effect.
	 * @param key The key for the sound file.
	 * @param folder The folder to look in, if it exists.
	 * @return The path to the sound file.
	 */
	inline static public function sound(key:String, ?folder:String):String
		return getPath('sounds/$key.$SOUND_EXT', folder);

	/**
	 * Gets a random sound effect.
	 * @param key The key for the sound file.
	 * @param min The minimum value for the random number.
	 * @param max The maximum value for the random number.
	 * @param folder The folder to look in, if it exists.
	 * @return The path to the sound file.
	 */
	inline static public function soundRandom(key:String, min:Int, max:Int, ?folder:String):String
		return getPath('sounds/$key${FlxG.random.int(min, max)}.$SOUND_EXT', folder);

	/**
	 * Gets a music track.
	 * @param key The key for the music file.
	 * @param folder The folder to look in, if it exists.
	 * @return The path to the music file.
	 */
	inline static public function music(key:String, ?folder:String):String
		return getPath('music/$key.$SOUND_EXT', folder);

	/**
	 * Gets an image file.
	 * @param key The key for the image file.
	 * @param folder The folder to look in, if it exists.
	 * @return The path to the image file.
	 */
	inline static public function image(key:String, ?folder:String):String
		return getPath('images/$key.png', folder);

	/**
	 * Gets a font file.
	 * @param key The key for the font file.
	 * @param folder The folder to look in, if it exists.
	 * @return The path to the font file.
	 */
	inline static public function font(key:String, ?folder:String):String
		return getPath('fonts/$key', folder);

	/**
	 * Gets a sparrow atlas.
	 * @param key The key for the atlas.
	 * @param folder The folder to look in, if it exists.
	 * @return The atlas frames.
	 */
	inline static public function getSparrowAtlas(key:String, ?folder:String):FlxAtlasFrames
		return FlxAtlasFrames.fromSparrow(image(key, folder), getPath('images/$key.xml', folder));

	/**
	 * Gets a packer atlas.
	 * @param key The key for the atlas.
	 * @param folder The folder to look in, if it exists.
	 * @return The atlas frames.
	 */
	inline static public function getPackerAtlas(key:String, ?folder:String):FlxAtlasFrames
		return FlxAtlasFrames.fromSpriteSheetPacker(image(key, folder), getPath('images/$key.txt', folder));
}
