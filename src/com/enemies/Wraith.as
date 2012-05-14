package com.enemies 
{
	/**
	 * ...
	 * @author Loose
	 */
	public class Wraith extends Enemy 
	{
		
		public function Wraith(x:Number, y:Number) 
		{
			source = Registry.EN_WRAITH;
			
			super(x, y);
			
			setHealth(4);
			setProperties(8, true);
			
			width = 8;
			height = 13;
			offset.x = 4;
			offset.y = 3;	
		}
	}

}