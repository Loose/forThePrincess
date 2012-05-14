package com.enemies 
{
	/**
	 * ...
	 * @author Loose
	 */
	public class Reaper extends Enemy 
	{
		
		public function Reaper(x:Number, y:Number) 
		{
			source = Registry.EN_REAPER;
			
			super(x, y);
			
			setHealth(10);
			setProperties(10, false, 2);
			
			width = 6;
			height = 13;
			offset.x = 5;
			offset.y = 3;
		}		
	}

}