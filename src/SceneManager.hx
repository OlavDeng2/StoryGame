package;

import openfl.display.Stage;


/**
 * ...
 * @author Olav
 */
class SceneManager 
{
	//Declare some necesarry variables to ensure the correct functioning of the SceneManager
	private static var myStage:Stage;
	
	//set myStage which, alongside the variable above, is required to ensure the smooth operation of the scene manager.
	public static function setMyStage(stageref:Stage)
	{
		myStage = stageref;

	}
	
	public static function getMyStage()
	{
		return(myStage);
	}
	
	
	//As you might imagine from the name, this function switches you to the Leaderboard Stage
	public static function switchToStageHOF() 
	{
		myStage.removeChildren();

		StageHallOfFame.setup(myStage);
		StageHallOfFame.start();
	}
	
	public static function switchToStageCredits()
	{
		myStage.removeChildren();
		StageCredits.setup(myStage);
		StageCredits.start();
	}
	
	public static function switchToStageCharacterCreation()
	{
		myStage.removeChildren();
		StageCharacterCreation.setup(myStage);
		StageCharacterCreation.start();
	}
	
	public static function switchToStageMainMenu()
	{
		myStage.removeChildren();
		StageMainMenu.setup(myStage);
		StageMainMenu.start();
	}
	
	public static function switchToStageMainGame()
	{
		myStage.removeChildren();
		StageMainGame.setup(myStage);
		StageMainGame.start();
	}
	
		public static function switchToStageGameOver()
	{
		myStage.removeChildren();
		StageGameOver.setup(myStage);
		StageGameOver.start();
	}
	
		public static function switchToStageVictory()
	{
		myStage.removeChildren();
		StageVictory.setup(myStage);
		StageVictory.start();
	}
	
}