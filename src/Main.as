package 
{
	import com.states.MainMenu;
	import org.flixel.FlxGame;
	
	/**
	 * ...
	 * @author Loose
	 */
	[SWF(width = "480", height = "360")]
	
	public class Main extends FlxGame
	{
		
		public function Main():void 
		{
			super(240, 180,MainMenu, 2, 60, 30);
			forceDebugger = true;
		}		
	}
	
}