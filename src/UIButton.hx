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
		var pressableExitButton:Button = new Button("MenuButton", "Quit");
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
		var pressableHOFButton:Button = new Button("MenuButton", "HoF");
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
		var pressablePlayButton:Button = new Button("MenuButton", "Play");
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
		var pressableCreditsButton:Button = new Button("MenuButton", "Credits");
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
		var pressableMainMenuButton:Button = new Button("MenuButton", "Main Menu");
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
	
	//main menu button
	public static function playMainGameButton(xPos:Int, yPos:Int)
	{
		setMyStage();
		var pressablePlayMainGameButton:Button = new Button("MenuButton", "Continue");
		//set position
		pressablePlayMainGameButton.y = yPos;
		pressablePlayMainGameButton.x = xPos;
		
		//add button to sprite
		myStage.addChild(pressablePlayMainGameButton);
		
		//add event listener
		pressablePlayMainGameButton.addEventListener(MouseEvent.CLICK, playMainGameButtonPress);
	}
	
	private static function playMainGameButtonPress(event : MouseEvent)
	{
		var pressablePlayMainGameButton:Button = cast (event.target);
		SceneManager.switchToStageMainGame();
	}
	
	
	
	//Answer buttons for the game
	//Answer 1
	public static function answer1Button(storyText:String)
	{
		setMyStage();
		var pressableAnswer1Button:Button = new Button("QuestionButton", storyText);
		//set position
		pressableAnswer1Button.y = 534;
		pressableAnswer1Button.x = 320;
		
		//add button to sprite
		myStage.addChild(pressableAnswer1Button);
		
		//add event listener
		pressableAnswer1Button.addEventListener(MouseEvent.CLICK, answer1ButtonPress);
	}
	
	private static function answer1ButtonPress(event : MouseEvent)
	{
		var pressableAnswer1Button:Button = cast (event.target);
		Sys.println("1");

		StageMainGame.nextStory("1");
	}
	
	
	//Answer 2
	public static function answer2Button(storyText:String)
	{
		setMyStage();
		var pressableAnswer2Button:Button = new Button("QuestionButton", storyText);
		//set position
		pressableAnswer2Button.y = 534;
		pressableAnswer2Button.x = 960;
		
		//add button to sprite
		myStage.addChild(pressableAnswer2Button);
		
		//add event listener
		pressableAnswer2Button.addEventListener(MouseEvent.CLICK, answer2ButtonPress);
	}
	
	private static function answer2ButtonPress(event : MouseEvent)
	{
		var pressableAnswer2Button:Button = cast (event.target);
		Sys.println("2");
		
		StageMainGame.nextStory("2");
	}
	
	//Answer 3
	public static function answer3Button(storyText:String)
	{
		setMyStage();
		var pressableAnswer3Button:Button = new Button("QuestionButton", storyText);
		//set position
		pressableAnswer3Button.y = 658;
		pressableAnswer3Button.x = 320;
		
		//add button to sprite
		myStage.addChild(pressableAnswer3Button);
		
		//add event listener
		pressableAnswer3Button.addEventListener(MouseEvent.CLICK, answer3ButtonPress);
	}
	
	private static function answer3ButtonPress(event : MouseEvent)
	{
		var pressableAnswer3Button:Button = cast (event.target);
		Sys.println("3");
		StageMainGame.nextStory("3");
	}
	
	//Answer 4
	public static function answer4Button(storyText:String)
	{
		setMyStage();
		var pressableAnswer4Button:Button = new Button("QuestionButton", storyText);
		//set position
		pressableAnswer4Button.y = 658;
		pressableAnswer4Button.x = 960;
		
		//add button to sprite
		myStage.addChild(pressableAnswer4Button);
		
		//add event listener
		pressableAnswer4Button.addEventListener(MouseEvent.CLICK, answer4ButtonPress);
	}
	
	private static function answer4ButtonPress(event : MouseEvent)
	{
		var pressableAnswer4Button:Button = cast (event.target);
		Sys.println("4");
		StageMainGame.nextStory("4");
	}
	
	
	//Victory Button
	public static function victoryButton(xPos:Int, yPos:Int)
	{
		setMyStage();
		var pressableVictoryButton:Button = new Button("MenuButton", "Victory!");
		//set position
		pressableVictoryButton.y = yPos;
		pressableVictoryButton.x = xPos;
		
		//add button to sprite
		myStage.addChild(pressableVictoryButton);
		
		//add event listener
		pressableVictoryButton.addEventListener(MouseEvent.CLICK, victoryButtonPress);
	}
	
	private static function victoryButtonPress(event : MouseEvent)
	{
		var pressableVictoryButton:Button = cast (event.target);
		Sys.println("Victory");
		SceneManager.switchToStageVictory();
	}
	
	
		
	//Game Over Button
	public static function gameOverButton(xPos:Int, yPos:Int)
	{
		setMyStage();
		var pressableGameOverButton:Button = new Button("MenuButton", "Game Over");
		//set position
		pressableGameOverButton.y = yPos;
		pressableGameOverButton.x = xPos;
		
		//add button to sprite
		myStage.addChild(pressableGameOverButton);
		
		//add event listener
		pressableGameOverButton.addEventListener(MouseEvent.CLICK, gameOverButtonPress);
	}
	
	private static function gameOverButtonPress(event : MouseEvent)
	{
		var pressableGameOverButton:Button = cast (event.target);
		Sys.println("defeat");
		SceneManager.switchToStageGameOver();
	}
	
}