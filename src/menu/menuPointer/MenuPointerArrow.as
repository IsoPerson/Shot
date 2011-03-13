package menu.menuPointer {
	import Controllers.ViewController;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;

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
				view.gotoAndStop(0);
				view.mouseChildren = false;
				view.buttonMode = true;
			}
		}
		
		protected function addListeners():void {
			_view.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			_view.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}
/*
		private function onEnterFrame(event:Event):void {
			if (view.currentFrame == view.totalFrames) {
				view.stop();
				view.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				_playing = false;
			}
		}
		
		private function onMouseOver(event:MouseEvent):void {
			if (!_playing){
				_playing = true;
				view.play();
				view.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			}
		}
	*/
		
		private function onMouseOver(event:MouseEvent):void{
			var filter:GlowFilter = new GlowFilter(0xFFFFFF, .5, 20, 20, 2);
			view.filters = [filter];
		}
		private function onMouseOut(event:MouseEvent):void{
			view.filters = [];
		}
		
	}
}