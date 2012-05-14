package com.levels 
{
	import com.enemies.*;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Loose
	 */
	public class Level01 extends FlxGroup
	{
		public var map:FlxTilemap;
		public var back:FlxTilemap;
		
		public var enemies:Enemies;
		
		public var width:int;
		public var height:int;
		
		public function Level01() 
		{
			super();
			
			map = new FlxTilemap;
			map.loadMap(new Registry.LVL_CEMETERY, Registry.TILE_CEMETERY, Registry.TILE_SIZE, Registry.TILE_SIZE, 0, 0, 1, Registry.TILE_COLLIDE);
			
			back = new FlxTilemap;
			back.loadMap(new Registry.BACK_CEMETERY, Registry.TILE_CEMETERY, Registry.TILE_SIZE, Registry.TILE_SIZE, 0, 0, 1, Registry.TILE_COLLIDE);
			
			/* Set go through tiles */
			//map.setTileProperties(tile, FlxObject.UP, null, null, Range);
			
			Registry.map = map;
			//Registry.exit = new FlxPoint(exit);
			
			width = map.width;
			height = map.height;
			
			//add(back);
			add(map);
			
			addEnemies();
		}
		
		private function addEnemies():void
		{
			enemies = new Enemies;
			
			/* Parse code */
			var enemyType:Class = Ghost;
			
			enemies.addEnemy(enemyType, 15, 12);
			enemies.addEnemy(enemyType, 15, 3);
			enemies.addEnemy(enemyType, 34, 4);
			enemies.addEnemy(enemyType, 31, 17);
			enemies.addEnemy(enemyType, 56, 8);
			
			enemyType = Wraith;
			enemies.addEnemy(enemyType, 41, 4);
			enemies.addEnemy(enemyType, 50, 2);
			
			enemyType = Reaper;
			enemies.addEnemy(enemyType, 56, 8);
		}
		
	}

}