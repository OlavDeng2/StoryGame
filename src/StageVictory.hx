package;

//Import some shit
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
class StageVictory 
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
		//This function is used to make sure that the SceneManager has the correct stage to work off of when switching between different stages
		SceneManager.setMyStage(myStage);

		//Really self explanatory, if not see the UIButton class
		UIButton.mainMenuButton(426, 300);
		UIButton.hofButton(426, 500);
		GameManager.writeScoreToDB();
		addEndText();
		addScore();
				
	}
	

	static function addBackground()
	{
		var backgroundImageData = Assets.getBitmapData('img/Backgrounds/MainMenuBackground.jpg');
		var backgroundImage = new Bitmap(backgroundImageData);
		
		myStage.addChild(backgroundImage);
	}
	
	
	static function addEndText()
	{
		
		var endTextField:TextField = new TextField();
		var fontSize = 30;
		endTextField.defaultTextFormat = new TextFormat(Assets.getFont("Fonts/TIMES.TTF").fontName, fontSize);
		endTextField.selectable = false;
		endTextField.text = "Victory has been achieved! Well done we are proud of you!";
		endTextField.x = 50;
		endTextField.y = 50;
		endTextField.width = myStage.width-50;
		//endTextField.height = myStage.height-300;
		endTextField.wordWrap = true;
		myStage.addChild(endTextField);
	}
	
	static function addScore()
	{
		var nameTextField:TextField = new TextField();
		var fontSize = 30;
		nameTextField.defaultTextFormat = new TextFormat(Assets.getFont("Fonts/TIMES.TTF").fontName, fontSize);
		nameTextField.selectable = false;
		nameTextField.text = "Name: " +  GameManager.getCurrentName();
		Sys.println(GameManager.getCurrentScore());
		nameTextField.x = 210;
		nameTextField.y = 150;
		nameTextField.width = 270;
		nameTextField.height = 50;
		myStage.addChild(nameTextField);
		
		var scoreTextField:TextField = new TextField();
		var fontSize = 30;
		scoreTextField.defaultTextFormat = new TextFormat(Assets.getFont("Fonts/TIMES.TTF").fontName, fontSize);
		scoreTextField.selectable = false;
		scoreTextField.text = "Score: " + Std.string(GameManager.getCurrentScore());
		Sys.println(GameManager.getCurrentName());
		scoreTextField.x = 210;
		scoreTextField.y = 200;
		scoreTextField.width = 270;
		scoreTextField.height = 50;
		myStage.addChild(scoreTextField);
	}
}