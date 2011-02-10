package gameWindows {
	import flash.display.MovieClip;
	import managers.WindowsManager;
	import graphic.Tab_createGame;
	
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Chip
	 */
	public class CreateGameWindow extends Window {
		private var _exitBtn:MovieClip;
		
		private const WINDOW_X:int = 100;
		private const WINDOW_Y:int = 100;
		
		public function CreateGameWindow() {
			super(new Tab_createGame(), WindowsManager.CREATE_GAME_WINDOW, 1);
			view.x = WINDOW_X;
			view.y = WINDOW_Y;
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
			_exitBtn.addEventListener(MouseEvent.CLICK, closeHandler);
		}
		
	}

}