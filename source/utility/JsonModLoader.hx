package utility;

import flixel.util.FlxColor;
import haxe.Json;
import sys.FileSystem;


class JsonModLoader {
    public static function loadStateJson(folderName:String, stateName:String):Dynamic {
        var path:String = "assets/shared/modfiles/json/" + folderName + "/" + stateName + ".json";
        if (FileSystem.exists(path)) {
            var jsonString:String = sys.io.File.getContent(path);
            return Json.parse(jsonString);
        } else {
            trace("Json not found for " + stateName + ". Are you sure it's named correctly?");
            return null;
        }
    }

    // Function to map color names to FlxColor values
    public static function getColorFromName(colorName:String):FlxColor {
        switch(colorName.toLowerCase()) {
            case "white": return FlxColor.WHITE;
            case "black": return FlxColor.BLACK;
            case "red": return FlxColor.RED;
            case "green": return FlxColor.GREEN;
            case "blue": return FlxColor.BLUE;
            case "yellow": return FlxColor.YELLOW;
            case "cyan": return FlxColor.CYAN;
            case "magenta": return FlxColor.MAGENTA;
            // Add more colors as needed
            default: return FlxColor.WHITE; // Default to white if color name is unrecognized
        }
    }

    public static function getImage(imageName:String):String {
        return imageName;
    }

    public static function getMusic(musicFile:String):String {
       return musicFile;
    }
}
