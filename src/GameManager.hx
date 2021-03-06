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
	}
	
	public static function writeScoreToDB()
	{
		var cnx = Sqlite.open("DB/Data.db");
		cnx.request(' INSERT INTO Highscores (name, Score) VALUES("' + currentName + '", ' + currentScore + ')');
		
		cnx.close();
	}
	
	
	//get and display the leaderboard
	public static function getLeaderboard()
	{
		setMyStage();
		var place:Int = 1;

		
		
		//Open the database
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
			var scoreNameTextField:TextField = new TextField();
			scoreNameTextField.text = '$place $charName ';
			var fontSize = 40;
			scoreNameTextField.defaultTextFormat = new TextFormat(Assets.getFont("Fonts/TIMES.TTF").fontName, fontSize);
			scoreNameTextField.autoSize = TextFieldAutoSize.LEFT;
			scoreNameTextField.x = scoreXPos;
			scoreNameTextField.y = place * 50 + scoreYStartPos;
			scoreNameTextField.selectable = false;

			myStage.addChild(scoreNameTextField);
			
			//add the score to the screen
			var scoreTextField:TextField = new TextField();
			scoreTextField.text = '$charScore ';
			var fontSize = 40;
			scoreTextField.defaultTextFormat = new TextFormat(Assets.getFont("Fonts/TIMES.TTF").fontName, fontSize);
			scoreTextField.autoSize = TextFieldAutoSize.LEFT;
			scoreTextField.x = scoreXPos + 415;
			scoreTextField.y = place * 50 + scoreYStartPos;
			scoreTextField.selectable = false;

			myStage.addChild(scoreTextField);
			
			place += 1;
			
		}
		
		// close the database
		cnx.close();
		

	}
	
	
	//Get and display the credits
	public static function getCredits()
	{
		setMyStage();
		var place:Int = 1;


		//Open the database
		var cnx = Sqlite.open("DB/Data.db");
		
		//get the story from the database at collom story from table story
		var creditSet = cnx.request("SELECT * FROM Credits");
		
		
		//Go through the rows and get the credits
		for (row in creditSet)
		{
			var name:String = row.Name;
			var role:String = row.Role;
			var creditYStartPos:Int = 0;
			var creditXPos:Int = 75;

			//add the names to the screen
			var nameTextFieldText:String = '$name ';
			var nameTextField:TextField = new TextField();
			nameTextField.text = nameTextFieldText;
			var fontSize = 40;
			nameTextField.defaultTextFormat = new TextFormat(Assets.getFont("Fonts/TIMES.TTF").fontName, fontSize);
			nameTextField.autoSize = TextFieldAutoSize.LEFT;
			nameTextField.x = creditXPos;
			nameTextField.y = place * 50 + creditYStartPos;
			nameTextField.selectable = false;

			myStage.addChild(nameTextField);
			
			//add the score to the screen
			var roleTextFieldText:String = '$role ';
			var roleTextField:TextField = new TextField();
			roleTextField.text = roleTextFieldText;
			var fontSize = 40;
			roleTextField.defaultTextFormat = new TextFormat(Assets.getFont("Fonts/TIMES.TTF").fontName, fontSize);
			roleTextField.autoSize = TextFieldAutoSize.LEFT;
			roleTextField.x = creditXPos + 415;
			roleTextField.selectable = false;
			roleTextField.y = place * 50 + creditYStartPos;
			myStage.addChild(roleTextField);
			
			place += 1;
			
		}
		
		// close the database
		cnx.close();
	}
	
	public static function displayStory(storyLocation:String)
	{
		setMyStage();
		
		//Create the story text
		var fontSize = 40;
		var storyTextField:TextField = new TextField();
		storyTextField.defaultTextFormat = new TextFormat(Assets.getFont("Fonts/TIMES.TTF").fontName, fontSize);
		storyTextField.autoSize = TextFieldAutoSize.LEFT;
		storyTextField.wordWrap = true;
		storyTextField.selectable = false;
		storyTextField.x = 40;
		storyTextField.y = 40;
		storyTextField.width = 1200;
		storyTextField.height = 600;
		storyTextField.multiline = true;
		
		//Open the database
		var cnx = Sqlite.open("DB/Data.db");
		
		//get the story from the database at collom story from table story
		
		//make sure the bellow is correct as right now it probably crashes
		var storySet = cnx.request('SELECT * FROM Story WHERE Number == "$storyLocation"');
		
		
		//Go through the rows in story and get the story
		for (row in storySet)
		{

			storyTextField.text = row.Story;

			if (row.Answer1 == "D")
			{

				UIButton.gameOverButton(500, 600);	
			}
			if (row.Answer1 == "V")
			{
				UIButton.victoryButton(500, 600);
			}
			
			if (row.Answer1 != "N/A" && row.Answer1 != "D" && row.Answer1 != "V")
			{
				UIButton.answer1Button(row.Answer1);
			}
			
			if (row.Answer2 != "N/A")
			{
				UIButton.answer2Button(row.Answer2);
			}
			
			if (row.Answer3 != "N/A")
			{
				UIButton.answer3Button(row.Answer3);
			}
			
			if (row.Answer4 != "N/A")
			{
				UIButton.answer4Button(row.Answer4);
			}
			
		}		
		
		myStage.addChild(storyTextField);
		
		cnx.close();
	}

}