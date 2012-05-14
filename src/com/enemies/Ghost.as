package com.enemies 
{
	/**
	 * ...
	 * @author Loose
	 */
	public class Ghost extends Enemy 
	{
		
		public function Ghost(x:Number, y:Number) 
		{
			source = Registry.EN_GHOST;
			
			super(x, y);
			
			setHealth(2);
			setProperties(20);
			
			width = 6;
			height = 13;
			offset.x = 5;
			offset.y = 3;			
		}
		
	}

}