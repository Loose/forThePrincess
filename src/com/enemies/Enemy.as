package com.enemies 
{
	import com.characters.Player;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Enemy extends FlxSprite 
	{
		private var player:Player;
		
		public var isDying:Boolean = false;
		public var isChaser:Boolean = false;
		
		protected var source:Class;
		private var spriteSize:Number = 16;
		
		protected var speed:Number;
		public var damage:Number;
		
		public var healthbar:FlxBar;
		private var healthbarTimer:Number = 0;
		private var healthbarTimerMax:Number = 8;
		
		public function Enemy(x:Number, y:Number)
		{
			super(x * Registry.TILE_SIZE, y * Registry.TILE_SIZE);
			
			if (source)
			{
				loadGraphic(source, true, true, spriteSize, spriteSize);
			}
			
			setAnimations();
			playAnimations();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (health <= 0)
			{
				kill();
			}
			
			movement();
			
			cooldownHealthbar();
			healthbar.trackParent(2 - offset.x, -offset.y - 2);
		}
		
		protected function movement():void
		{
			var tx:int;
			var ty:int = int(y / Registry.TILE_SIZE);
			
			if (facing == FlxObject.LEFT)
			{
				/* x + offset.x + width - 2 */
				tx = int((x + 9) / Registry.TILE_SIZE);
				
				if (Registry.map.getTile(tx - 1, ty + 2) < Registry.TILE_COLLIDE || Registry.map.getTile(tx - 1, ty + 1) >= Registry.TILE_COLLIDE)
				{
					turn();
					return;
				}
			}
			else
			{
				tx = int((x + width) / Registry.TILE_SIZE);
				
				if (Registry.map.getTile(tx, ty + 2) < Registry.TILE_COLLIDE || Registry.map.getTile(tx , ty + 1) >= Registry.TILE_COLLIDE)
				{
					turn();
					return;
				}
			}
			
			if (!isTouching(FlxObject.FLOOR) && !isDying)
			{
				turn();
			}
		}
		
		private function turn():void
		{			
			if (facing == FlxObject.RIGHT)
			{
				facing = FlxObject.LEFT;
				velocity.x = -speed;
			}
			else
			{
				facing = FlxObject.RIGHT;
				velocity.x = speed;
			}
		}
		
		protected function setHealth(value:Number):void
		{
			health = value;
			healthbar = new FlxBar(0, 0, FlxBar.FILL_LEFT_TO_RIGHT, spriteSize - 4, 3, this, "health");
			healthbar.createFilledBar(0xff000000, 0xff00aa00, true, 0xff003300);
			healthbar.setRange(0, health);
			
			healthbar.visible = false;
			healthbar.killOnEmpty = true;
			healthbar.solid = false;
		}
		
		protected function setProperties(speed:Number = 10, isChaser:Boolean = false, damage:Number = 1):void
		{
			this.speed = speed;
			this.damage = damage;
			this.isChaser = isChaser;
			
			acceleration.y = 50;
			velocity.x = -speed;
			
			player = Registry.player;
			facing = FlxObject.LEFT;
		}
		
		private function setAnimations():void
		{
			addAnimation("walk", [0, 1], Registry.GAME_FPS, true);
		}
		
		private function playAnimations():void
		{
			play("walk");
		}
		
		override public function kill():void 
		{
			//FlxG.play(sound);
			
			isDying = true;
			play("dead");
			
			velocity.x = 0;
			velocity.y = 0;
			
			if (finished)
			{
				removeSprite();
			}
		}
		
		private function removeSprite():void
		{
			exists = false;
		}
		
		private function cooldownHealthbar():void
		{
			if (healthbarTimer > 0)
			{
				healthbarTimer -= FlxG.elapsed;
				healthbar.visible = true;
			}
			else
			{
				healthbarTimer = 0;
				healthbar.visible = false;
			}
		}
		
		override public function hurt(Damage:Number):void 
		{
			super.hurt(Damage);
			
			flicker(0.3);
			healthbarTimer = healthbarTimerMax;
		}
		
	}

}