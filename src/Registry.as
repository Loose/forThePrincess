package  
{
	import com.characters.Player;
	import org.flixel.FlxPoint;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Loose
	 */
	public class Registry 
	{
		/*
		 * To do list:
			 * Different enemy movement.
		 * 
		 * Bugs to fix:
			 * Character dying.
			 * ??Enemy healthbar??
		 * 
		 * /
		
		
		/* Game (GAME) */
		public static const GAME_TITLE:String = "For the Princess";
		public static const GAME_FPS:Number = 8;
		
		public static var player:Player;
		public static var map:FlxTilemap;
		public static var exit:FlxPoint;
		
		/* Menu (MN) */
		[Embed(source = "ass/menus/mn_title160x120.png")] public static const MN_TITLE:Class;
		
		/* Physics (PHY) */
		public static const PHY_JUMP:Number = 180;
		public static const PHY_GRAVITY:Number = 400;
		
		/* Display */
		[Embed(source = "ass/hud/hud_healthpanel39x7.png")] public static const HUD_HEALTHPANEL:Class;
		[Embed(source = "ass/hud/hud_healthbar9x3.png")] public static const HUD_HEALTHBAR:Class;
		
		/* Characters (CHAR) */
		[Embed(source = "ass/characters/char_knight16x16.png")] public static const CHAR_KNIGHT:Class;
		
		/* Enemies (EN) */
		[Embed(source = "ass/enemies/en_ghost16x16.png")] public static const EN_GHOST:Class;
		[Embed(source = "ass/enemies/en_wraith16x16.png")] public static const EN_WRAITH:Class;
		[Embed(source = "ass/enemies/en_reaper16x16.png")] public static const EN_REAPER:Class;
		
		/* Levels (LVL / BACK) */
		[Embed(source = "ass/levels/mapCSV_Group1_Map.csv", mimeType = "application/octet-stream")] public static const LVL_TEST:Class;
		
		[Embed(source = "ass/levels/mapCSV_Group1_Collide.csv", mimeType = "application/octet-stream")] public static const LVL_CEMETERY:Class;
		[Embed(source = "ass/levels/mapCSV_Group1_Back.csv", mimeType = "application/octet-stream")] public static const BACK_CEMETERY:Class;
		
		/* Tiles (TILE) */
		public static const TILE_SIZE:Number = 10;
		public static const TILE_COLLIDE:Number = 100;
		
		[Embed(source = "ass/tiles/tiles_castle10x10.png")] public static const TILE_CASTLE:Class;
		
		[Embed(source = "ass/tiles/tiles_cemetery10x10.png")] public static const TILE_CEMETERY:Class;
		
		/* Backdrop (BD) */
		[Embed(source = "ass/backdrops/bd_darkHill180x100.png")] public static const BD_DARKHILL:Class;
		[Embed(source = "ass/backdrops/bd_midHill180x100.png")] public static const BD_MIDHILL:Class;
		[Embed(source = "ass/backdrops/bd_liteHill180x100.png")] public static const BD_LIGHTHILL:Class;
		
		[Embed(source = "ass/backdrops/bd_darkCloud60x120.png")] public static const BD_DARKCLOUD:Class;
		[Embed(source = "ass/backdrops/bd_midCloud60x120.png")] public static const BD_MIDCLOUD:Class;
		[Embed(source="ass/backdrops/bd_liteCloud18x120.png")] public static const BD_LIGHTCLOUD:Class;
		
		/* Weapons (WEP) */
		[Embed(source = "ass/weapons/wep_sword_16x16.png")] public static const WEP_SWORD:Class;
		
		public function Registry() 
		{
			
		}
		
	}

}