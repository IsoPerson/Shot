package menu {
	import flash.display.MovieClip;
	import graphic.Chat;
	import graphic.MainMenuView;
	/**
	 * ...
	 * @author Chip
	 */
	public class MainMenu {
		private var _view:MovieClip;//MainMenuView;
		
		private var _shopTower:MovieClip;
		private var _bankTower:MovieClip;
		private var _gameTower:MovieClip;
		
		public function MainMenu(view:MovieClip = null) {
			_view = new MainMenuView();
			initObjects();
			setObjectsMode();
		}
		
		public function get view():MovieClip {
			return _view;
		}
		
		private function initObjects():void {
			_shopTower = view.shopTower as MovieClip;
			_bankTower = view.bankTower as MovieClip;
			_gameTower = view.gameTower as MovieClip;
		}
		
		private function setObjectsMode():void {
			_shopTower.gotoAndStop(0);
			_bankTower.gotoAndStop(0);
			_gameTower.doors.gotoAndStop(0);
		}
		
	}

}