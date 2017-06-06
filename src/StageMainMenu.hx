package;

//Import some shit
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.Stage;



import motion.Actuate;
import motion.easing.Linear;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

/**
 * ...
 * @author Olav
 */

 //This is the Main Menu Stage. This is where you can go to either the game, the leaderboard and exit the game.
class StageMainMenu extends Sprite
{
	
	
	//Declare some necesarry variables
	private static var myStage:Stage;
	
	//do the necesarry setups
	public static function setup(stageref:Stage)
	{
		myStage = stageref;
	}
	
	//Create and draw the main menu
	public static function start() 
	{
		addBackground();
		showTitle();
		
		//This function is used to make sure that the SceneManager has the correct stage to work off of when switching between different stages
		SceneManager.setMyStage(myStage);
		
		//Really self explanatory, if not see the UIButton class
		UIButton.playButton(426, 300);
		UIButton.hofButton(426, 500);
		UIButton.creditsButton(853, 300);
		UIButton.exitButton(853, 500);
		
	}
	
	static function addBackground()
	{
		var backgroundImageData = Assets.getBitmapData('img/Backgrounds/MainMenuBackground.jpg');
		var backgroundImage = new Bitmap(backgroundImageData);
		
		myStage.addChild(backgroundImage);
	}
	static function showTitle()
	{
		
	}
	
		
	public static function addTimer()
	{
		Sys.println("this called");
		var rect = new BitmapData(myStage.stageWidth, 10, false, 0x000000);
		var countdownSprite = new Sprite();
		countdownSprite.addChild(new Bitmap(rect));
		myStage.addChild(countdownSprite);
		Actuate.update(function(x) { countdownSprite.scaleX = x; }, 4, [1], [0]).ease(Linear.easeNone).onComplete(function() {trace("Done!"); });
	}
}