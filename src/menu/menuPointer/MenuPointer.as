package menu.menuPointer {
	import Controllers.ViewController;
	import managers.WindowsManager;
	import managers.RoomsManager;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
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
			_arrowCreateGame = new MenuPointerArrow(getMovieClip("arrowCreateGame"));
			_arrowFastGame = new MenuPointerArrow(getMovieClip("arrowFastGame"));
			_arrowTopPlayers = new MenuPointerArrow(getMovieClip("arrowTopPlayers"));
		}
		
		private function addListeners():void {
			_arrowCreateGame.view.addEventListener(MouseEvent.CLICK, clickCreateGameHandler);
			_arrowFastGame.view.addEventListener(MouseEvent.CLICK, clickFastGameHandler);
		}
		
		private function clickCreateGameHandler(event:MouseEvent):void {
			WindowsManager.getInstance().show(WindowsManager.CREATE_GAME_WINDOW);
		}
		private function clickFastGameHandler(event:MouseEvent):void {
			RoomsManager.getInstance().show(RoomsManager.GAME_ROOM);
		}
				
	}
}