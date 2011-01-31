package  {
	import flash.display.MovieClip;
	import shot.MainMenu;
	/**
	 * ...
	 * @author Chip
	 */
	public class TestGraphic extends MovieClip{
		private var mainMenu:MovieClip;
		
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