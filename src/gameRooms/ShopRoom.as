package gameRooms {
	import Events.WindowEvent;
	import managers.RoomsManager;
	import graphic.gameRooms.ShopRoomView;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Chip
	 */
	public class ShopRoom extends Room {
		private var _exitBtn:MovieClip;
		
		public function ShopRoom() {
			super(new ShopRoomView(), RoomsManager.SHOP_ROOM);
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
			_exitBtn.addEventListener(MouseEvent.CLICK, exitHandler);
		}
		
		private function exitHandler(event:MouseEvent):void {
			view.dispatchEvent(new WindowEvent(WindowEvent.CLOSE));
		}
		
	}

}