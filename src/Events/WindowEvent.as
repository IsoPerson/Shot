package Events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class WindowEvent extends Event {
		
		public static const CLOSE:String = "close";
		public static const CREATE_GAME:String = "create game";
		
		public function WindowEvent(eventType:String) {
			super(eventType);
		}
		
	}

}