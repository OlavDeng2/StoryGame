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


	//Exit Button Function
	public static function exitButton(myStage:Stage, xPos:Int, yPos:Int)
	{
		var pressableExitButton:Button = new Button(myStage, "ExitButton");
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
	
	public static function hofButton(myStage:Stage, xPos:Int, yPos:Int)
	{
		var pressableHOFButton:Button = new Button(myStage, "CreditsButton");
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
	public static function startButton(myStage:Stage, xPos:Int, yPos:Int)
	{	
		var pressableStartButton:Button = new Button(myStage, "StartButton");
		//set position
		pressableStartButton.y = yPos;
		pressableStartButton.x = xPos;
		
		//add button to sprite
		myStage.addChild(pressableStartButton);
		
		//add event listener
		pressableStartButton.addEventListener(MouseEvent.CLICK, startButtonPress);
	}
	
	private static function startButtonPress(event : MouseEvent)
	{
		var pressableStartButton:Button = cast (event.target);
		Sys.println("start Game");
	}
}