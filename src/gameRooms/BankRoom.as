package gameRooms {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import graphic.BankRoomView;
	import managers.RoomsManager;
	/**
	 * ...
	 * @author Chip
	 */
	public class BankRoom extends Room {
		private var _exitBtn:MovieClip;
		
		private const BANK_X:int = 400;
		private const BANK_Y:int = 300;
		
		public function BankRoom() {
			super(new BankRoomView(), RoomsManager.BANK_ROOM);
			_view.x = BANK_X;
			_view.y = BANK_Y;
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