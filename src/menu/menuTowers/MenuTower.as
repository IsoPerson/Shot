package menu.menuTowers {
	import Controllers.ViewController;
	import managers.WindowsManager;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Chip
	 */
	[Abstract]
	internal class MenuTower extends ViewController{
		private var _animationView:MovieClip;
		private var _hidenObjects:Vector.<MovieClip>;
		private var _roomId:String;
	
		
		public function MenuTower(view:MovieClip) {
			super(view);
			_animationView = view;
			if (view) {
				setMode();
				addListeners();
			}
		}
		
		protected function set animationView(value:MovieClip):void {
			_animationView = value;
			_animationView.gotoAndStop(0);
		}
		
		protected function addHidenObjects(objects:Vector.<MovieClip>):void {
			_hidenObjects = objects;
			hideHidenObjects();
		}
		
		protected function setRoomId(roomId:String):void {
			_roomId = roomId;
			if (roomId) {
				_view.addEventListener(MouseEvent.CLICK, openRoom);
			}
		}
		
		private function setMode():void {
			_animationView.gotoAndStop(0);
			_view.buttonMode = true;
			_view.mouseChildren = false;
		}
		
		private function addListeners():void {
			_view.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			_view.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}
		
		private function onMouseOver(event:MouseEvent):void {
			_animationView.play();
			showHidenObjects();
		}
		private function onMouseOut(event:MouseEvent):void {
			_animationView.gotoAndStop(0);
			hideHidenObjects();
		}
		
		private function hideHidenObjects():void {
			if (_hidenObjects) {
				for each (var hidenObject:MovieClip in _hidenObjects) {
					hidenObject.visible = false;
				}
			}
		}
		private function showHidenObjects():void {
			if (_hidenObjects) {
				for each (var hidenObject:MovieClip in _hidenObjects) {
					hidenObject.visible = true;
				}
			}
		}
		
		private function openRoom(event:MouseEvent = null):void {
			WindowsManager.getInstance().show(_roomId);
		}
		
	}

}