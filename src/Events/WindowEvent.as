package Events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class WindowEvent extends Event {
		
		public static const CLOSE:String = "close";
		
		public function WindowEvent(eventType) {
			super(eventType);
		}
		
	}

}