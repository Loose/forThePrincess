package com.levels 
{
	import org.flixel.FlxGroup;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Background extends FlxGroup 
	{
		public var skyGroup:FlxGroup = new FlxGroup;
		public var groundGroup:FlxGroup = new FlxGroup;
		
		private var lightSky:Backdrop;
		private var midSky:Backdrop;
		private var darkSky:Backdrop;
		
		private var lightGround:Backdrop;
		private var midGround:Backdrop;
		private var darkGround:Backdrop;
		
		public function Background() 
		{			
			active = true;
		}
		
		override public function update():void 
		{
			super.update();
		}
		
		public function setGround():void
		{
			lightGround = new Backdrop(Registry.BD_LIGHTHILL, 0, Registry.map.height - 160, -0.05, 0.1, 0, 0, true);
			midGround = new Backdrop(Registry.BD_MIDHILL, 80, Registry.map.height - 145, -0.07, 0.1, 0, 0, true);
			darkGround = new Backdrop(Registry.BD_DARKHILL, 130, Registry.map.height - 140, -0.1, 0.1, 0, 0, true);
			
			groundGroup.add(lightGround);
			groundGroup.add(midGround);
			groundGroup.add(darkGround);
		}
		
		public function setSky():void
		{
			lightSky = new Backdrop(Registry.BD_LIGHTCLOUD, 0, -60, -0.05, -0.1, -0.05, 0, true);
			midSky = new Backdrop(Registry.BD_MIDCLOUD, 0, -75, -0.07, -0.1, -0.07, 0, true);
			darkSky = new Backdrop(Registry.BD_DARKCLOUD, 0, -90, -0.1, -0.1, -0.1, 0, true);
			
			skyGroup.add(lightSky);
			skyGroup.add(midSky);
			skyGroup.add(darkSky);
		}		
	}

}