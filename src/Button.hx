package;


import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.display.Stage;
import openfl.system.System;

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

 //The button class is tasked with the rendering of the button as well as making sure an event listener is available, this is the parent class of UIButton.
class Button extends Sprite
{
	public function new(buttonBaseImage:String, buttonText:String)
	{
		super(); 
		
		//create the sprite for the button text
		var buttonSprite : Sprite = new Sprite ();
		
		
		//Get the data for the image to render
		var buttonImageData = Assets.getBitmapData('img/UIElements/${buttonBaseImage}.png');
		var buttonImage = new Bitmap(buttonImageData);
		
		//set the transformation point of the image at its center
		buttonImage.scaleX = 1;
		buttonImage.scaleY = 1;
		
		buttonImage.x = -buttonImage.width / 2;
		buttonImage.y = -buttonImage.height / 2;

		
		//add the image
		buttonSprite.addChild(buttonImage);
		
			
		//event listener so that clicking stuff actually works
		addEventListener(MouseEvent.CLICK, buttonPress);
		
		
		//	text stuff
		var buttonTextField:TextField = new TextField();
		buttonTextField.text = "Potato";//buttonText;
		var fontSize = 40;
		buttonTextField.defaultTextFormat = new TextFormat(Assets.getFont("Fonts/TIMES.TTF").fontName, fontSize);
		buttonTextField.autoSize = TextFieldAutoSize.LEFT;
		buttonTextField.selectable = false;
		buttonSprite.addChild(buttonTextField);
		
		addChild(buttonSprite);

	
	}
	
	
	function buttonPress(event:MouseEvent)
	{

	}
	
}