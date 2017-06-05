package;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.Stage;


import motion.Actuate;
import motion.easing.Linear;
/**
 * ...
 * @author Olav
 */
class StageMainGame 
{
	//Declare some necesarry variables
	private static var myStage:Stage;
	
	static var storyTree:String = "3";
	static var score:Int = 0;

	
	//do the necesarry setups
	public static function setup(stageref:Stage)
	{
		myStage = stageref;
	}
	
	//Create and draw the main menu
	public static function start() 
	{
		addBackground();
		//This function is used to make sure that the SceneManager has the correct stage to work off of when switching between different stages
		SceneManager.setMyStage(myStage);
		Sys.println("you now playing the game");
		storyTree = "3";
		score = 0;
		addTimer();
		GameManager.displayStory(storyTree);
	}
	

	static function addBackground()
	{
		var backgroundImageData = Assets.getBitmapData('img/Backgrounds/MainMenuBackground.jpg');
		var backgroundImage = new Bitmap(backgroundImageData);
		
		myStage.addChild(backgroundImage);
	}
	
	
		
		
	static function addTimer()
	{
		Sys.println("this called");
		var rect = new BitmapData(myStage.stageWidth, 10, false, 0x000000);
		var countdownSprite = new Sprite();
		countdownSprite.addChild(new Bitmap(rect));
		myStage.addChild(countdownSprite);
		//Actuate.update(function(x) { countdownSprite.scaleX = x; }, 4, [1], [0]).ease(Linear.easeNone).onComplete(function() {trace("Done!"); });
	}

	
	public static function nextStory(answer:Int)
	{
		score += 1;
		GameManager.setCurrentScore(score);
		myStage.removeChildren();
		addBackground();
		storyTree += '.$answer';
		Sys.println(storyTree);
		
		GameManager.displayStory(storyTree);
		
	}
}