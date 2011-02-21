package menu.menuPointer {
	import Controllers.ViewController;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Chip
	 */
	public class MenuPointerArrow extends ViewController {
		private var _playing:Boolean = false;
		
		public function MenuPointerArrow(view:MovieClip) {
			super(view);
			setMode();
			addListeners();
		}
		
		private function setMode():void {
			if (_view){
				_view.gotoAndStop(0);
				_view.mouseChildren = false;
				_view.buttonMode = true;
			}
		}
		
		private function addListeners():void {
			_view.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
		}

		private function onEnterFrame(event:Event):void {
			if ((event.target as MovieClip).currentFrame == (event.target as MovieClip).totalFrames) {
				(event.target as MovieClip).stop();
				_view.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				_playing = false;
			}
		}
		
		private function onMouseOver(event:MouseEvent):void {
			if (!_playing){
				_playing = true;
				(event.target as MovieClip).play();
				_view.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			}
		}
		
	}
}