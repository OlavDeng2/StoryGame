package;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.display.Stage;
import openfl.system.System;


/**
 * ...
 * @author Olav
 */

 //In UIButton you will find all the UI Buttons which you might need available, everything from moving to another stage to the exit button.
class UIButton extends Button
{

	//variable to store the current stage that is being worked with
	private static var myStage:Stage;
	
	//This function gets the current stage from the scene manager and sets it in this class so that all the buttons have the correct stage they are working with
	private static function setMyStage()
	{
		myStage = SceneManager.getMyStage();

	}

	//Exit Button Function
	public static function exitButton(xPos:Int, yPos:Int)
	{
		setMyStage();
		var pressableExitButton:Button = new Button("ExitButton");
		//set position
		pressableExitButton.y = yPos;
		pressableExitButton.x = xPos;
		
		//add button to sprite
		myStage.addChild(pressableExitButton);
		
		//add event listener
		pressableExitButton.addEventListener(MouseEvent.CLICK, exitButtonPress);
	}
	
	private static function exitButtonPress(event : MouseEvent)
	{
		var pressableExitButton:Button = cast (event.target);
		//Exit the game
		System.exit(0);
	}
	
	public static function hofButton(xPos:Int, yPos:Int)
	{
		setMyStage();
		var pressableHOFButton:Button = new Button("HoFButton");
		//set position
		pressableHOFButton.y = yPos;
		pressableHOFButton.x = xPos;
		
		//add button to sprite
		myStage.addChild(pressableHOFButton);
		
		//add event listener
		pressableHOFButton.addEventListener(MouseEvent.CLICK, hofButtonPress);
	}
	
	private static function hofButtonPress(event : MouseEvent)
	{
		var pressableHOFButton:Button = cast (event.target);
		SceneManager.switchToStageHOF();
	}
	
	
	
	//The button for starting the game
	public static function playButton(xPos:Int, yPos:Int)
	{	
		setMyStage();
		var pressablePlayButton:Button = new Button("PlayButton");
		//set position
		pressablePlayButton.y = yPos;
		pressablePlayButton.x = xPos;
		
		//add button to sprite
		myStage.addChild(pressablePlayButton);
		
		//add event listener
		pressablePlayButton.addEventListener(MouseEvent.CLICK, playButtonPress);
	}
	
	private static function playButtonPress(event : MouseEvent)
	{
		var pressablePlayButton:Button = cast (event.target);
		Sys.println("start Game");
		SceneManager.switchToStageCharacterCreation();
	}
	
	
	//Credits button
	public static function creditsButton(xPos:Int, yPos:Int)
	{
		setMyStage();
		var pressableCreditsButton:Button = new Button("CreditsButton");
		//set position
		pressableCreditsButton.y = yPos;
		pressableCreditsButton.x = xPos;
		
		//add button to sprite
		myStage.addChild(pressableCreditsButton);
		
		//add event listener
		pressableCreditsButton.addEventListener(MouseEvent.CLICK, creditsButtonPress);
	}
	
	private static function creditsButtonPress(event : MouseEvent)
	{
		var pressableCreditsButton:Button = cast (event.target);
		SceneManager.switchToStageCredits();
	}
	
	
	//main menu button
	public static function mainMenuButton(xPos:Int, yPos:Int)
	{
		setMyStage();
		var pressableMainMenuButton:Button = new Button("MainMenuButton");
		//set position
		pressableMainMenuButton.y = yPos;
		pressableMainMenuButton.x = xPos;
		
		//add button to sprite
		myStage.addChild(pressableMainMenuButton);
		
		//add event listener
		pressableMainMenuButton.addEventListener(MouseEvent.CLICK, mainMenuButtonPress);
	}
	
	private static function mainMenuButtonPress(event : MouseEvent)
	{
		var pressableMainMenuButton:Button = cast (event.target);
		SceneManager.switchToStageMainMenu();
	}
}