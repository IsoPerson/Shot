package gameRooms {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import graphic.GameRoomView;
	import managers.RoomsManager;
	/**
	 * ...
	 * @author Chip
	 */
	public class GameRoom extends Room{
		private var _exitBtn:MovieClip;
		
		public function GameRoom() {
			super(new GameRoomView(), RoomsManager.GAME_ROOM);
			initObjects();
			setObjectsMode();
			addListeners();
		}
		
		private function initObjects():void {
			_exitBtn = getMovieClip("exitBtn");
		}
		
		private function setObjectsMode():void {
			_exitBtn.mouseChildren = false;
			_exitBtn.buttonMode = true;
		}
		
		private function addListeners():void {
			_exitBtn.addEventListener(MouseEvent.CLICK, closeHandler);
		}
		
	}

}