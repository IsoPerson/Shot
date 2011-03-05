package Events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class GameRoomEvent extends Event {
		
		public static const READY_FOR_PLAYERS:String = "readyForPlayers";
		
		public function GameRoomEvent(type:String) {
			super(type);
		}
		
	}

}