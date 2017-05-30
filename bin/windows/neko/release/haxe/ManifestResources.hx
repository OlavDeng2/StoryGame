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
		
		Assets.libraryPaths["default"] = rootPath + "manifest/default.json";
		
		
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		
		
	}
	
	
}


#if !display
#if flash



#elseif (desktop || cpp)


@:keep #if display private #end class __ASSET__fonts_times_ttf extends lime.text.Font { public function new () { __fontPath = #if (ios || tvos) "assets/" + #end "Fonts/TIMES.TTF"; name = "Times New Roman"; super (); }}
@:keep #if display private #end class __ASSET__fonts_timesbd_ttf extends lime.text.Font { public function new () { __fontPath = #if (ios || tvos) "assets/" + #end "Fonts/TIMESBD.TTF"; name = "Times New Roman Bold"; super (); }}
@:keep #if display private #end class __ASSET__fonts_timesbi_ttf extends lime.text.Font { public function new () { __fontPath = #if (ios || tvos) "assets/" + #end "Fonts/TIMESBI.TTF"; name = "Times New Roman Bold Italic"; super (); }}
@:keep #if display private #end class __ASSET__fonts_timesi_ttf extends lime.text.Font { public function new () { __fontPath = #if (ios || tvos) "assets/" + #end "Fonts/TIMESI.TTF"; name = "Times New Roman Italic"; super (); }}


#else

@:keep #if display private #end class __ASSET__fonts_times_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "Fonts/TIMES.TTF"; #end name = "Times New Roman"; super (); }}
@:keep #if display private #end class __ASSET__fonts_timesbd_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "Fonts/TIMESBD.TTF"; #end name = "Times New Roman Bold"; super (); }}
@:keep #if display private #end class __ASSET__fonts_timesbi_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "Fonts/TIMESBI.TTF"; #end name = "Times New Roman Bold Italic"; super (); }}
@:keep #if display private #end class __ASSET__fonts_timesi_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "Fonts/TIMESI.TTF"; #end name = "Times New Roman Italic"; super (); }}


#end

#if (openfl && !flash)

@:keep #if display private #end class __ASSET__OPENFL__fonts_times_ttf extends openfl.text.Font { public function new () { #if !html5 __fontPath = #if (ios || tvos) "assets/" + #end "Fonts/TIMES.TTF"; #end name = "Times New Roman"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_timesbd_ttf extends openfl.text.Font { public function new () { #if !html5 __fontPath = #if (ios || tvos) "assets/" + #end "Fonts/TIMESBD.TTF"; #end name = "Times New Roman Bold"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_timesbi_ttf extends openfl.text.Font { public function new () { #if !html5 __fontPath = #if (ios || tvos) "assets/" + #end "Fonts/TIMESBI.TTF"; #end name = "Times New Roman Bold Italic"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_timesi_ttf extends openfl.text.Font { public function new () { #if !html5 __fontPath = #if (ios || tvos) "assets/" + #end "Fonts/TIMESI.TTF"; #end name = "Times New Roman Italic"; super (); }}


#end
#end