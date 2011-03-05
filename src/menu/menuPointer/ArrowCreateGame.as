package menu.menuPointer {
	import Controllers.ViewController;
	import flash.events.Event;
	import managers.WindowsManager;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Chip
	 */
	public class ArrowCreateGame extends ViewController{
		
		public function ArrowCreateGame(view:MovieClip) {
			super(view);
			view.gotoAndStop(0);
			view.mouseChildren = false;
			view.buttonMode = true;
			addListeners();
		}
		
		private function addListeners():void {
			view.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			view.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onEnterFrame(event:Event):void {
			if (view.currentFrame == view.totalFrames) {
				view.stop();
				view.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			}
		}
		
		private function onMouseOver(event:MouseEvent):void {
			view.play();
			view.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onClick(event:MouseEvent):void {
			WindowsManager.getInstance().show(WindowsManager.CREATE_GAME_WINDOW);
		}
		
	}
}