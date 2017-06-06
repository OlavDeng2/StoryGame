package;

import haxe.Timer;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.Stage;

/**
 * ...
 * @author Olav
 */
class StageMainGame 
{
	//Declare some necesarry variables
	private static var myStage:Stage;
	private static var timer:Timer;

	
	
	static var storyTree:String = "3";
	static var score:Int = 0;

	
	//do the necesarry setups
	public static function setup(stageref:Stage)
	{
		myStage = stageref;
		timer = new Timer(1000);
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
		var time:Int = 0;
		timer.run = function () 
			{
				time += 1;
				Sys.println(time);
				if (time >= 5)
				{
					stopTimer();
				}
			}
	}

	public static function stopTimer()
	{
		Sys.println("timer attempt stop");
		timer.stop();
	}
	
	public static function nextStory(answer:Int)
	{
		timer.stop();
		score += 1;
		GameManager.setCurrentScore(score);
		myStage.removeChildren();
		addBackground();
		storyTree += '.$answer';
		Sys.println(storyTree);
		GameManager.displayStory(storyTree);
		
	}
}