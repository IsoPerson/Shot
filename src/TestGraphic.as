package  {
	import flash.display.MovieClip;
	import graphic.MainMenuView;
	/**
	 * ...
	 * @author Chip
	 */
	public class TestGraphic extends MovieClip{
		private var mainMenu:MovieClip;
		//var chat:chat
		
		public function TestGraphic() {
			super();
		}
		
		public function start():void {
			createMenu();
			addMenuToStage();
		}
		
		private function createMenu():void {
			mainMenu = new MainMenu();
		}
		
		private function addMenuToStage():void {
			addChild(mainMenu);
		}
		
	}

}