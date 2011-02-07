package gameRooms {
	import managers.RoomsManager;
	import graphic.gameRooms.GameRequestsRoomView;
	
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Chip
	 */
	public class GameRequestsRoom extends Room{
		
		public function GameRequestsRoom(view:MovieClip = null) {
			if (!view) { view = new GameRequestsRoomView(); }
			super(view, RoomsManager.GAME_REQUESTS_ROOM);
		}
		
	}

}