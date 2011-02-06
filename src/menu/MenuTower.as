package menu {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Chip
	 */
	public class MenuTower{
		private var _view:MovieClip;
		private var _animationView:MovieClip;
		private var _hidenObjects:Vector.<MovieClip>;
		private var _room:MovieClip;
		
		public function MenuTower(view:MovieClip, animationView:MovieClip = null ) {
			_view = view;
			_animationView = (animationView) ? animationView : view;
			if (_view) {
				setMode();
				addListeners();
			}
		}
		
		public function addHidenObjects(objects:Vector.<MovieClip>):void {
			_hidenObjects = objects;
			hideHidenObjects();
		}
		
		public function setRoom(room:MovieClip):void {
			_room = room;
			if (room) {
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
		
	}

}