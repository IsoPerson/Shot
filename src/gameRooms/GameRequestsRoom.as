package gameRooms {
	import managers.RoomsManager;
	import graphic.gameRooms.GameRequestsRoomView;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Chip
	 */
	public class GameRequestsRoom extends Room {
		private var _exitBtn:MovieClip;
		private var _selectBox:MovieClip;
		
		public function GameRequestsRoom() {	
			super(new GameRequestsRoomView(), RoomsManager.GAME_REQUESTS_ROOM);
			initObjects();
			setObjectsMode();
			addListeners();
		}
		
		private function initObjects():void {
			_exitBtn = getMovieClip("exitBtn");
			_selectBox = getMovieClip("selectBox");
		}
		
		private function setObjectsMode():void {
			_exitBtn.mouseChildren = false;
			_exitBtn.buttonMode = true;
			_selectBox.visible = false;
		}
		
		private function addListeners():void {
			_exitBtn.addEventListener(MouseEvent.CLICK, closeHandler);
		}
		
	}

}