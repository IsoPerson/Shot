package  Events  
	
{
	import flash.events.Event;
	
	public class GameEvent extends Event
	{
		
		public static const CREATE_GAME:String = "create game";
		
		
		
		public var _data:Array;
		
		public function GameEvent(type:String, dt:Array)
		{
			super(type);
			_data = dt;
		}
		
		public function get data():Array
		{
			return _data;
		}
	}
}
