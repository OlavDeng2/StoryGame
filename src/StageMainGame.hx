package;

import haxe.Timer;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.Stage;

import openfl.text.TextField;
import openfl.text.TextFieldType;
import openfl.text.TextFieldAutoSize;
import openfl.text.Font;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Olav
 */
class StageMainGame 
{
	//Declare some necesarry variables
	private static var myStage:Stage;
	private static var timer:Timer;

	
	
	static var storyTree:String;
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
		storyTree = "q1";
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
		var time:Int = 60;
		
		var timerField:TextField = new TextField();
		var fontSize = 30;
		timerField.defaultTextFormat = new TextFormat(Assets.getFont("Fonts/TIMES.TTF").fontName, fontSize);
		timerField.selectable = false;
		timerField.text = Std.string(time);
		timerField.x = 1100;
		timerField.width = 270;
		timerField.height = 50;
		myStage.addChild(timerField);
		timer.run = function () 
		{
			Sys.println(time);
			if (time >= 60)
			{
				nextStory("5");
				timer.stop();
			}
			
		}
	}

	public static function nextStory(answer:String)
	{
		timer.stop();
		score += 1;
		GameManager.setCurrentScore(score);
		myStage.removeChildren();
		addBackground();
		storyTree += "." + answer;
		Sys.println(storyTree);
		GameManager.displayStory(storyTree);
		
	}
}