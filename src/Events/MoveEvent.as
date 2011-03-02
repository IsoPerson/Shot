package Events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class MoveEvent extends Event{
		public static const CHANGE_MOVE:String = "changeMove";
		public static const END_MY_MOVE:String = "endMyMove";
		public static const START_MY_MOVE:String = "startMyMove";
		
		private var _moveNow:int;
		
		public function MoveEvent(type:String) {
			super(type);
		}
		
		public function get moveNow():int {
			return _moveNow;
		}
		
	}
}