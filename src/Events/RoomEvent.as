package Events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class RoomEvent extends Event{
		
		public static const WANT_SERVER_DATA:String = "giveMeServerDataPlz";
		
		public function RoomEvent(type:String) {
			super(type);
		}
		
	}

}