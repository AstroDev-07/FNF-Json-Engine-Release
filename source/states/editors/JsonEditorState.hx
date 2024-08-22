package states.editors;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import utility.JsonModLoader;
import flixel.util.FlxColor;

class JsonEditorState extends MusicBeatState {
    var sorryText:FlxText;
    var bg:FlxSprite;

    override public function create():Void {

        var jsonDebugConfig = JsonModLoader.loadStateJson("JsonDebug", "JsonDebugState");
        var daBG = jsonDebugConfig.BackGround;

        var introMusic = jsonDebugConfig.BGMusic;

        if(FlxG.sound.music == null) {
            FlxG.sound.playMusic(Paths.music(introMusic), 0);
        }

        bg = new FlxSprite(0, 0, Paths.image(daBG));
        bg.color = 0xFF353535;
        add(bg);

        sorryText = new FlxText(0, 0, FlxG.width, "Sorry! This is still under construction.\nPress 'ESC' to go back", 32);
        sorryText.setFormat('VCR OSD Mono', 32, FlxColor.WHITE,"center");
        sorryText.screenCenter();
        add(sorryText);

    }

    override public function update(elapsed:Float):Void {
        if(FlxG.keys.justPressed.ESCAPE)
        {
            FlxG.switchState(new MasterEditorMenu());
        }
    }
}