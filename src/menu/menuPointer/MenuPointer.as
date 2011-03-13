package menu.menuPointer {
	import Controllers.ViewController;
	
	import Events.MenuPointerEvent;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import managers.WindowsManager;

	/**
	 * ...
	 * @author Chip
	 */
	public class MenuPointer extends ViewController{
		private var _arrowCreateGame:MenuPointerArrow;
		private var _arrowFastGame:MenuPointerArrow;
		private var _arrowTopPlayers:MenuPointerArrow;
		
		public function MenuPointer(view:MovieClip) {
			super(view);
			initArrows();
			addListeners();
		}
		
		private function initArrows():void {
			_arrowCreateGame = new ArrowCreateGame(getMovieClip("arrowCreateGame"));
			_arrowFastGame = new ArrowFastGame(getMovieClip("arrowFastGame"));
			_arrowTopPlayers = new MenuPointerArrow(getMovieClip("arrowTopPlayers"));
		}
		
		private function addListeners():void{
			_arrowFastGame.view.addEventListener(MouseEvent.CLICK, fastGameClickHandler);
		}
		
		public function fastGameClickHandler(event:MouseEvent):void {
			dispatchEvent(new MenuPointerEvent(MenuPointerEvent.FIND_GAME));
		}
		
	}
}