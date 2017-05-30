package;

import openfl.display.Stage;

import sys.db.Sqlite;

import openfl.text.TextField;
import openfl.text.TextFieldType;
import openfl.text.TextFieldAutoSize;
import openfl.text.Font;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.Assets;


import openfl.events.MouseEvent;

/**
 * ...
 * @author Olav
 */
class GameManager 
{
	//Gonna have to do some shit in here for the leaderboards and storing of variables, but im a lazy fuck so that will come at a later date.
	
	//variables which will be needed later
	static var currentScore:Int;
	static var currentName:String;
	
	//variable to store the current stage that is being worked with
	private static var myStage:Stage;
	
	//This function gets the current stage from the scene manager and sets it in this class so that all the buttons have the correct stage they are working with
	private static function setMyStage()
	{
		myStage = SceneManager.getMyStage();

	}
	
	//Function to get and set current score
	public static function getCurrentScore()
	{
		return currentScore;
	}
	
	public static function setCurrentScore(score:Int)
	{
		currentScore = score;
	}
	
	//Functions to get and set current name
	public static function getCurrentName()
	{
		return currentName;
	}
	
	public static function setCurrentName(name:String)
	{
		currentName = name;
		Sys.println(currentName);
	}
	
	public static function writeScoreToDB()
	{
		var cnx = Sqlite.open("DB/Data.db");
		cnx.request(' INSERT INTO Highscores (name, Score) VALUES("' + currentName + '", ' + currentScore + ')');
		
		cnx.close();
	}
	
	public static function getLeaderboard()
	{
		setMyStage();
		var place:Int = 1;

		
		
		//Open the database*/
		var cnx = Sqlite.open("DB/Data.db");
		
		//get the story from the database at collom story from table story
		var scoreSet = cnx.request("SELECT * FROM Highscores ORDER BY Score DESC LIMIT 5");
		
		
		//Go through the rows in story and get the story
		for (row in scoreSet)
		{
			var charName:String = row.Name;
			var charScore:Int = row.Score;
			var scoreYStartPos:Int = 0;
			var scoreXPos:Int = 75;

			//add the names to the screen
			var scoreNameTextFieldText:String = '$place $charName ';
			var scoreNameTextField:TextField = new TextField();
			scoreNameTextField.text = scoreNameTextFieldText;
			var fontSize = 40;
			scoreNameTextField.defaultTextFormat = new TextFormat(Assets.getFont("Fonts/TIMES.TTF").fontName, fontSize);
			scoreNameTextField.autoSize = TextFieldAutoSize.LEFT;
			scoreNameTextField.x = scoreXPos;
			scoreNameTextField.y = place * 50+ scoreYStartPos;
			myStage.addChild(scoreNameTextField);
			
			//add the score to the screen
			var scoreTextFieldText:String = '$charScore ';
			var scoreTextField:TextField = new TextField();
			scoreTextField.text = scoreTextFieldText;
			var fontSize = 40;
			scoreTextField.defaultTextFormat = new TextFormat(Assets.getFont("Fonts/TIMES.TTF").fontName, fontSize);
			scoreTextField.autoSize = TextFieldAutoSize.LEFT;
			scoreTextField.x = scoreXPos + 415;
			scoreTextField.y = place * 50 + scoreYStartPos;
			myStage.addChild(scoreTextField);
			
			place += 1;
			
		}
		
		// close the database
		cnx.close();
		
		

		
		

	}
	
}