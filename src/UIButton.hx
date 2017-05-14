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
		
	}
	
	public static function startButton(myStage:Stage, xPos:Int, yPos:Int)
	{
		
	}
	
}