package com.levels 
{
	import org.flixel.FlxBackdrop;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Backdrop extends FlxBackdrop 
	{
		private var speedX:Number;
		private var speedY:Number;
		
		public function Backdrop(source:Class, x:Number, y:Number, scrollX:Number = 0, scrollY:Number = 0, speedX:Number = 0, speedY:Number = 0, repeatX:Boolean = false, repeatY:Boolean = false) 
		{
			super(source, scrollX, scrollY, repeatX, repeatY);
			
			this.x = x;
			this.y = y;
			
			this.speedX = speedX;
			this.speedY = speedY;			
		}
		
		override public function update():void 
		{
			super.update();
			
			x += speedX;
			y += speedY;
		}
		
	}

}