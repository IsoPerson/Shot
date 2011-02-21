package gameChat {
	import Controllers.ViewController;
	import flash.display.MovieClip;
	import graphic.ChatView;
	/**
	 * ...
	 * @author Chip
	 */
	public class Chat extends ViewController {
		private var _bgMax:MovieClip;
		
		private const CHAT_X:int = 0;
		private const CHAT_Y:int = 330;
		
		public function Chat() {
			super(new ChatView());
			_view.x = CHAT_X;
			_view.y = CHAT_Y;
			initObjects();
			setObjectsMode();
		}
		
		private function initObjects():void {
			_bgMax = getMovieClip("bg_max");
		}
		
		private function setObjectsMode():void {
			_bgMax.visible = false;
		}
		
	}

}