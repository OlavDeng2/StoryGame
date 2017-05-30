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
class StageCredits 
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
		//This function is used to make sure that the SceneManager has the correct stage to work off of when switching between different stages
		SceneManager.setMyStage(myStage);
		
		//Really self explanatory, if not see the UIButton class
		UIButton.exitButton(50, 500);
	}
	
}