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
		}
		
		private function initArrows():void {
			_arrowCreateGame = new ArrowCreateGame(getMovieClip("arrowCreateGame"));
			_arrowFastGame = new ArrowFastGame(getMovieClip("arrowFastGame"));
			_arrowTopPlayers = new MenuPointerArrow(getMovieClip("arrowTopPlayers"));
		}
		
	}
}