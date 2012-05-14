package com.enemies 
{
	import org.flixel.FlxGroup;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Enemies extends FlxGroup 
	{
		public function Enemies() 
		{
			super();
		}
		
		public function addEnemy(enemyType:Class, x:int, y:int):void
		{
			var enemy:Enemy;
			add(enemy = new enemyType(x, y));
			add(enemy.healthbar);
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}