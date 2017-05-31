package;

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
class StageCharacterCreation 
{

	public static var characterNameField:TextField = new TextField();
	public static var pleaseEnterCharacterNameTextField:TextField = new TextField();
	public static var characterName:String = "";

	
	
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
		addBackground();
	}
	
	static function addBackground()
	{
		var backgroundImageData = Assets.getBitmapData('img/Backgrounds/MainMenuBackground.jpg');
		var backgroundImage = new Bitmap(backgroundImageData);
		
		myStage.addChild(backgroundImage);
		
		inputCharacterName();

	}
	
	
	//this function handles the creation of the character name
	static function inputCharacterName()
	{
		//This is the text field which is not selectable nor editable which just displays the text asking to enter your character name
		var fontSize = 30;
		pleaseEnterCharacterNameTextField.defaultTextFormat = new TextFormat(Assets.getFont("Fonts/TIMES.TTF").fontName, fontSize);
		pleaseEnterCharacterNameTextField.text = "Please Enter your Character Name";
		pleaseEnterCharacterNameTextField.x = 150;
		pleaseEnterCharacterNameTextField.y = 100;
		pleaseEnterCharacterNameTextField.autoSize = TextFieldAutoSize.LEFT;
		
		//This creates a text field which you can edit, still need to handle the getting of the info from the text field and saving of it.
		var fontSize = 30;
		characterNameField.defaultTextFormat = new TextFormat(Assets.getFont("Fonts/TIMES.TTF").fontName, fontSize);
		characterNameField.selectable = true;
		characterNameField.text = characterName;
		characterNameField.type = TextFieldType.INPUT;
		characterNameField.x = 210;
		characterNameField.width = 270;
		characterNameField.height = 50;
		characterNameField.y = 150;
		characterNameField.restrict = "A-Z 0-0 a-z";
		characterNameField.maxChars = 16; 
		characterName = characterNameField.text;
		//characterNameField.autoSize = TextFieldAutoSize.LEFT;
		characterNameField.background = true;
		characterNameField.backgroundColor = 0xababab;
		characterNameField.border = true;
		
		myStage.addChild(pleaseEnterCharacterNameTextField);
		myStage.addChild( characterNameField );
		
	}
}