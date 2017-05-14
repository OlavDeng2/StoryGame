package;

//Import some shit
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.Stage;

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
		UIButton.startButton(myStage, 360, 100);
		UIButton.hofButton(myStage, 360, 300);
		UIButton.exitButton(myStage, 360, 500);
	}
	
	static function addBackground()
	{
		
	}
	static function showTitle()
	{
		
	}
	
}