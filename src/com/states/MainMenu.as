package com.states 
{
	import com.levels.Background;
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class MainMenu extends FlxState 
	{
		private var background:Background;
		
		private var title:FlxText;
		private var start:FlxText;
		
		public function MainMenu() 
		{
			
		}
		
		override public function create():void 
		{
			FlxG.flash(0x00000000, 1);
			
			FlxG.bgColor = 0xff85878F;
			
			background = new Background();
			
			setText();
			background.setSky();
			
			/* Music play here */
			
			add(background.skyGroup);
			add(title);
			add(start);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (FlxG.keys.any())
			{
				FlxG.fade(0xff000000, 1, changeState);
			}
		}
		
		private function setText():void
		{
			start = new FlxText(0, FlxG.height - 30, FlxG.width, "- PRESS ANY KEY TO START -");
			start.alignment = "center";
			start.shadow = 0xff000000;
			
			title = new FlxText(0, (FlxG.height * 0.5) - 20, FlxG.width, Registry.GAME_TITLE);
			title.size *= 2;
			title.alignment = "center";
			title.shadow = 0xff000000;
		}
		
		private function changeState():void
		{
			FlxG.switchState(new PlayState);
		}
		
		override public function destroy():void 
		{
			super.destroy();
		}
		
	}

}