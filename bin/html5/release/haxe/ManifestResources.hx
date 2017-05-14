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
		
		#end
		
		var data, manifest, library;
		
		data = '{"name":null,"assets":"aoy4:pathy36:img%2FUIElements%2FCreditsButton.pngy4:sizei817y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y33:img%2FUIElements%2FExitButton.pngR2i556R3R4R5R7R6tgoR0y39:img%2FUIElements%2FFullScreenToggle.pngR2i748R3R4R5R8R6tgoR0y37:img%2FUIElements%2FMainMenuButton.pngR2i672R3R4R5R9R6tgoR0y34:img%2FUIElements%2FStartButton.pngR2i722R3R4R5R10R6tgh","version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind #if display private #end class __ASSET__img_uielements_creditsbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__img_uielements_exitbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__img_uielements_fullscreentoggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__img_uielements_mainmenubutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__img_uielements_startbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:image("assets/img/UIElements/CreditsButton.png") #if display private #end class __ASSET__img_uielements_creditsbutton_png extends lime.graphics.Image {}
@:image("assets/img/UIElements/ExitButton.png") #if display private #end class __ASSET__img_uielements_exitbutton_png extends lime.graphics.Image {}
@:image("assets/img/UIElements/FullScreenToggle.png") #if display private #end class __ASSET__img_uielements_fullscreentoggle_png extends lime.graphics.Image {}
@:image("assets/img/UIElements/MainMenuButton.png") #if display private #end class __ASSET__img_uielements_mainmenubutton_png extends lime.graphics.Image {}
@:image("assets/img/UIElements/StartButton.png") #if display private #end class __ASSET__img_uielements_startbutton_png extends lime.graphics.Image {}
@:file("") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else



#end

#if (openfl && !flash)



#end
#end