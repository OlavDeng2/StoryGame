package;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.Stage;

import openfl.events.MouseEvent;

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
	//Declare some necesarry variables
	private static var myStage:Stage;
	
	//create text fields
	public static var characterNameField:TextField = new TextField();
	public static var pleaseEnterCharacterNameTextField:TextField = new TextField();

	//create some other variables that are needed
	public static var storyLocation:Int;
	public static var storyLength: Int = 3;
	public static var characterName:String = "";
	
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
		
		inputCharacterName();
		acceptCharacterName(500, 600);
	}
	
	static function addBackground()
	{
		var backgroundImageData = Assets.getBitmapData('img/Backgrounds/MainMenuBackground.jpg');
		var backgroundImage = new Bitmap(backgroundImageData);
		
		myStage.addChild(backgroundImage);
		

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
	
	
	//store char name and start displaying story
	static function acceptCharacterName(xPos:Int, yPos:Int)
	{

		var acceptCharacterNameButton:Button = new Button("MenuButton", "Continue");
		
		acceptCharacterNameButton.y = yPos;
		acceptCharacterNameButton.x = xPos;
		
		myStage.addChild(acceptCharacterNameButton);
		
		acceptCharacterNameButton.addEventListener(MouseEvent.CLICK, acceptCharacterNameButtonPress);
	}
	
	//actual functionality of when the acceptCharacterName button is pressed
	static function acceptCharacterNameButtonPress(event:MouseEvent)
	{
		var acceptCharacterNameButton:Button = cast(event.target);
		Sys.println("Char name is now saved");
		GameManager.setCurrentName(characterNameField.text);
		
		//This is the numbering of the story in the database, 1 being the 1st row, 2 being 2nd etc. Always begins at row 1 for obvious reasons
		storyLocation = 1;
		
		GameManager.displayStory(storyLocation);
		nextStory(500, 600);
		
		//remove things which are now unecesarry
		myStage.removeChild(acceptCharacterNameButton);
		myStage.removeChild(characterNameField);
		myStage.removeChild(pleaseEnterCharacterNameTextField);
	}
	
	
	//next story button
	static function nextStory(xPos:Int, yPos:Int)
	{
		var nextStoryButton:Button = new Button("MenuButton", "Continue");
		
		nextStoryButton.y = yPos;
		nextStoryButton.x = xPos;
		
		myStage.addChild(nextStoryButton);
		
		nextStoryButton.addEventListener(MouseEvent.CLICK, nextStoryPress);
	}
	
	//functionality of the above button	
	static function nextStoryPress(event:MouseEvent)
	{
		
		var nextStoryButton:Button = cast(event.target);
		myStage.removeChildren();
		
		
		storyLocation += 1;
		addBackground();
		GameManager.displayStory(storyLocation);
		if (storyLocation == storyLength)
		{
			UIButton.playMainGameButton(500, 600);
		}
		
		else
		{
			nextStory(500, 600);
		}
	}
}