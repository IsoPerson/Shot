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
	public class ArrowCreateGame extends MenuPointerArrow{
		
		public function ArrowCreateGame(view:MovieClip) {
			super(view);
			addListeners();
		}
		
		override protected function addListeners():void {
			super.addListeners();
			view.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(event:MouseEvent):void {
			WindowsManager.getInstance().show(WindowsManager.CREATE_GAME_WINDOW);
		}
		
	}
}