package;


import lime.app.Config;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {
	
	
	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	
	
	public static function init (config:Config):Void {
		
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
		var rootPath = null;
		
		if (config != null && Reflect.hasField (config, "assetsPrefix")) {
			
			rootPath = Reflect.field (config, "assetsPrefix");
			
		}
		
		if (rootPath == null) {
			
			#if (ios || tvos)
			rootPath = "assets/";
			#elseif (windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end
			
		}
		
		Assets.defaultRootPath = rootPath;
		
		#if (openfl && !flash)
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_times_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_timesbd_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_timesbi_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_timesi_ttf);
		
		#end
		
		var data, manifest, library;
		
		data = '{"name":null,"assets":"aoy4:pathy36:img%2FUIElements%2FCreditsButton.pngy4:sizei817y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y33:img%2FUIElements%2FExitButton.pngR2i556R3R4R5R7R6tgoR0y39:img%2FUIElements%2FFullScreenToggle.pngR2i748R3R4R5R8R6tgoR0y37:img%2FUIElements%2FMainMenuButton.pngR2i672R3R4R5R9R6tgoR0y34:img%2FUIElements%2FStartButton.pngR2i722R3R4R5R10R6tgoR0y12:DB%2FData.dbR2i4096R3y6:BINARYR5R11R6tgoR2i836020R3y4:FONTy9:classNamey24:__ASSET__fonts_times_ttfR5y17:Fonts%2FTIMES.TTFR6tgoR2i842216R3R13R14y26:__ASSET__fonts_timesbd_ttfR5y19:Fonts%2FTIMESBD.TTFR6tgoR2i621296R3R13R14y26:__ASSET__fonts_timesbi_ttfR5y19:Fonts%2FTIMESBI.TTFR6tgoR2i662844R3R13R14y25:__ASSET__fonts_timesi_ttfR5y18:Fonts%2FTIMESI.TTFR6tgh","version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		
		
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__img_uielements_creditsbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__img_uielements_exitbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__img_uielements_fullscreentoggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__img_uielements_mainmenubutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__img_uielements_startbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__db_data_db extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_times_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_timesbd_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_timesbi_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_timesi_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:image("assets/img/UIElements/CreditsButton.png") #if display private #end class __ASSET__img_uielements_creditsbutton_png extends lime.graphics.Image {}
@:image("assets/img/UIElements/ExitButton.png") #if display private #end class __ASSET__img_uielements_exitbutton_png extends lime.graphics.Image {}
@:image("assets/img/UIElements/FullScreenToggle.png") #if display private #end class __ASSET__img_uielements_fullscreentoggle_png extends lime.graphics.Image {}
@:image("assets/img/UIElements/MainMenuButton.png") #if display private #end class __ASSET__img_uielements_mainmenubutton_png extends lime.graphics.Image {}
@:image("assets/img/UIElements/StartButton.png") #if display private #end class __ASSET__img_uielements_startbutton_png extends lime.graphics.Image {}
@:file("assets/Databases/Data.db") #if display private #end class __ASSET__db_data_db extends haxe.io.Bytes {}
@:font("assets/Fonts/TIMES.TTF") #if display private #end class __ASSET__fonts_times_ttf extends lime.text.Font {}
@:font("assets/Fonts/TIMESBD.TTF") #if display private #end class __ASSET__fonts_timesbd_ttf extends lime.text.Font {}
@:font("assets/Fonts/TIMESBI.TTF") #if display private #end class __ASSET__fonts_timesbi_ttf extends lime.text.Font {}
@:font("assets/Fonts/TIMESI.TTF") #if display private #end class __ASSET__fonts_timesi_ttf extends lime.text.Font {}
@:file("") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep #if display private #end class __ASSET__fonts_times_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "Fonts/TIMES"; #end name = "Times New Roman"; super (); }}
@:keep #if display private #end class __ASSET__fonts_timesbd_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "Fonts/TIMESBD"; #end name = "Times New Roman Bold"; super (); }}
@:keep #if display private #end class __ASSET__fonts_timesbi_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "Fonts/TIMESBI"; #end name = "Times New Roman Bold Italic"; super (); }}
@:keep #if display private #end class __ASSET__fonts_timesi_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "Fonts/TIMESI"; #end name = "Times New Roman Italic"; super (); }}


#end

#if (openfl && !flash)

@:keep #if display private #end class __ASSET__OPENFL__fonts_times_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_times_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_timesbd_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_timesbd_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_timesbi_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_timesbi_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_timesi_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_timesi_ttf (); src = font.src; name = font.name; super (); }}


#end
#end