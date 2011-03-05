package Events {
	import flash.events.Event;
	import gameWindows.Window;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class WindowEvent extends Event {
		private var _window:Window;
		
		public static const CLOSE:String = "close";
		
		public function WindowEvent(eventType:String, window:Window) {
			super(eventType);
			_window = window;
		}
		
		public function get window():Window {
			return _window;
		}
		
	}

}