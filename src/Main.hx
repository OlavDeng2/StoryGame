package;


import openfl.display.Sprite;
import openfl.Lib;




/**
 * ...
 * @author Olav
 */
class Main extends Sprite 
{

	public function new() 
	{
		//Simply start the game, its really that simple.
		
		super();
		
		//SoundManager.start();
		StageMainMenu.setup(stage);
		StageMainMenu.start();


	}
	


}