package com.characters 
{
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxControl;
	import org.flixel.plugin.photonstorm.FlxControlHandler;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Player extends FlxSprite
	{
		private var start:FlxPoint;
		
		private var healthbar:FlxBar;
		private var healthpanel:FlxSprite;
		public var hud:FlxGroup = new FlxGroup();
		
		public var weapon:FlxWeapon;
		private var weaponRate:Number = 650;
		
		private var shootTimer:Number = 0;
		private var shootTimerMax:Number = 0.3;
		
		public var invulnerableTimer:Number = 0;
		private var invulnerableTimerMax:Number = 1.5;
		
		public function Player(x:Number, y:Number) 
		{
			super(x * Registry.TILE_SIZE, y * Registry.TILE_SIZE);
			
			start = new FlxPoint(x * Registry.TILE_SIZE, y * Registry.TILE_SIZE);
			loadGraphic(Registry.CHAR_KNIGHT, true, true, 16, 16, true);
			
			health = 4;
			
			width = 6;
			height = 13;
			offset.x = 6;
			offset.y = 3;
			
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			
			setHealth();
			setAnimations();
			setWeapon();
			setControls();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (health <= 0)
			{
				kill();
			}
			
			healthbar.currentValue = health;
			
			cooldownInvulnerability();
			cooldownWeapon();
			playAnimations();
		}
		
		private function setHealth():void
		{
			health = 4;
			
			healthpanel = new FlxSprite(4, 4, Registry.HUD_HEALTHPANEL);
			healthpanel.scrollFactor.x = healthpanel.scrollFactor.y = 0;
			
			healthbar = new FlxBar(healthpanel.x + 2, healthpanel.y + 2, FlxBar.FILL_LEFT_TO_RIGHT, 36, 3);
			healthbar.createImageBar(null, Registry.HUD_HEALTHBAR, 0x0);
			healthbar.setRange(0, health);
			healthbar.scrollFactor.x = healthbar.scrollFactor.y = 0;
			
			hud.add(healthpanel);
			hud.add(healthbar);
		}
		
		private function setAnimations():void
		{
			addAnimation("idle", [0], Registry.GAME_FPS * 0, false);
			addAnimation("walk", [0, 1, 0 , 2], Registry.GAME_FPS, true);
			addAnimation("jump", [3], Registry.GAME_FPS * 0, false);
			addAnimation("shot", [0, 4], Registry.GAME_FPS, false);
		}
		
		private function setControls():void
		{
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.ROTATION_STOPPING_DECELERATES, 1, true);
			
			FlxControl.player1.setCursorControl(false, false, true, true);
			FlxControl.player1.setJumpButton("C", FlxControlHandler.KEYMODE_PRESSED, Registry.PHY_JUMP, FlxObject.FLOOR, 250, 200);
			
			FlxControl.player1.setFireButton("X", FlxControlHandler.KEYMODE_PRESSED, weaponRate, fireWeapon);
			FlxControl.player1.setMovementSpeed(200, 0, 60, 200, 400, 0);
			FlxControl.player1.setGravity(0, Registry.PHY_GRAVITY);
		}
		
		private function setWeapon():void
		{
			weapon = new FlxWeapon("sword", this, "x", "y");
			weapon.makeImageBullet(50, Registry.WEP_SWORD, -offset.x, 5);
			weapon.setBulletBounds(new FlxRect(-20, -20, 4000, 4000));
			weapon.setFireRate(weaponRate);
			weapon.setBulletLifeSpan(1000);
			
			weapon.group.setAll("width", 12);
			weapon.group.setAll("height", 3);
			weapon.group.setAll("offset", new FlxPoint(2, 7));
		}
		
		private function fireWeapon():void
		{
			play("shot");
			weapon.setBulletDirection(facing == RIGHT ? FlxWeapon.BULLET_RIGHT : FlxWeapon.BULLET_LEFT, 140);
			weapon.fire();
				
			shootTimer = shootTimerMax;
		}
		
		private function cooldownWeapon():void
		{
			if (shootTimer > 0)
			{
				shootTimer -= FlxG.elapsed;
			}
			else
			{
				shootTimer = 0;
			}
		}
		
		private function cooldownInvulnerability():void
		{
			if (invulnerableTimer > 0)
			{
				invulnerableTimer -= FlxG.elapsed;
			}
			else
			{
				invulnerableTimer = 0;
			}
		}
		
		private function playAnimations():void
		{
			if (shootTimer > 0)
			{
				play("shot");
			}
			else
			{
				if (touching == FlxObject.FLOOR)
				{
					if (velocity.x != 0)
					{
						play("walk");
					}
					else
					{
						play("idle");
					}
				}
				else
				{
					play("jump");
				}
			}
		}
		
		public function restart():void
		{
			reset(start.x, start.y);
			facing = RIGHT;
		}
		
		override public function hurt(Damage:Number):void 
		{
			super.hurt(Damage);
			
			flicker(invulnerableTimerMax);
			invulnerableTimer = invulnerableTimerMax;
		}
		
		override public function kill():void 
		{
			super.kill();
			
			weapon.group.kill();
			healthbar.kill();
		}
	}

}