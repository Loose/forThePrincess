package com.states 
{
	import com.characters.Player;
	import com.enemies.Enemy;
	import com.levels.Backdrop;
	import com.levels.Background;
	import com.levels.Level01;
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;
	import org.flixel.FlxState;
	import org.flixel.FlxTileblock;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class PlayState extends FlxState 
	{
		private var level:Level01;
		private var background:Background;
		
		public function PlayState() 
		{
			
		}
		
		override public function create():void 
		{
			FlxG.flash(0x00000000, 0.5);
			
			setObjects();
			setCamera();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Registry.player.health <= 0)
			{
				remove(Registry.player);
				FlxG.fade(0xff000000, 1, changeState);
			}
			
			collisionDetect();
		}
		
		private function setObjects():void
		{
			level = new Level01;
			background = new Background;			
			Registry.player = new Player(1, 4);
			
			background.setSky();
			background.setGround();
			
			add(background.skyGroup);
			add(background.groundGroup);
			
			add(level.back);
			
			add(Registry.player.weapon.group);
			add(Registry.player);
			
			add(level.enemies);
			add(level);
			add(Registry.player.hud);
		}
		
		private function setCamera():void
		{
			FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
			FlxG.camera.setBounds(0, 0, level.width, level.height);
			FlxG.camera.follow(Registry.player, FlxCamera.STYLE_PLATFORMER);
		}
		
		private function collisionDetect():void
		{
			FlxG.collide(Registry.player, level);
			FlxG.collide(level.enemies, level);
			FlxG.collide(Registry.player.weapon.group, level);
			
			FlxG.overlap(Registry.player.weapon.group, level.enemies, hitEnemy);
			FlxG.overlap(Registry.player, level.enemies, hitPlayer);
			
			if (Registry.player.y > Registry.map.height + 20)
			{
				Registry.player.hurt(1);
				Registry.player.restart();
			}
		}
		
		private function changeState():void
		{
			FlxG.switchState(new MainMenu);
		}
		
		private function hitPlayer(player:FlxObject, enemy:FlxObject):void
		{
			if (Player(player).invulnerableTimer == 0)
			{
				Player(player).hurt(Enemy(enemy).damage);
			}
		}
		
		private function hitEnemy(bullet:FlxObject, enemy:FlxObject):void
		{
			/*if (Enemy(enemy).isDying)
			{
				return;
			}*/
			bullet.kill();
			enemy.hurt(1);			
		}
	}

}