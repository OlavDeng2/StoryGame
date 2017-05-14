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

 //The button class is tasked with the rendering of the button as well as making sure an event listener is available, this is the parent class of UIButton.
class Button extends Sprite
{
	public function new(myStage:Stage, buttonName:String)
	{
		super(); 
		//Get the data for the image to render
		var buttonImageData = Assets.getBitmapData('img/UIElements/${buttonName}.png');
		var buttonImage = new Bitmap(buttonImageData);
		
		//set the transformation point of the image at its center
		buttonImage.x = -buttonImage.width / 2;
		buttonImage.y = -buttonImage.height / 2;
		
		//add the image
		addChild(buttonImage);
			
		//event listener so that clicking stuff actually works
		addEventListener(MouseEvent.CLICK, buttonPress);
	}
	
	function buttonPress(event:MouseEvent)
	{

	}
	
}