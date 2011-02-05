package menu {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import graphic.Chat;
	import graphic.MainMenuView;
	/**
	 * ...
	 * @author Chip
	 */
	public class MainMenu {
		private var _view:MovieClip;//MainMenuView;
		
		private var _shopTower:MenuTower;
		private var _bankTower:MenuTower;
		private var _gameTower:MenuTower;
		
		public function MainMenu(view:MovieClip = null) {
			_view = new MainMenuView();
			initObjects();
			setObjectsMode();
			addListeners();
		}
		
		public function get view():MovieClip {
			return _view;
		}
		
		private function initObjects():void {
			var hidenObjects:Vector.<MovieClip> = new Vector.<MovieClip>;
			_shopTower = new MenuTower(view.shopTower as MovieClip);
			hidenObjects.push(view.shopTower.wind_1);
			hidenObjects.push(view.shopTower.wind_2);
			hidenObjects.push(view.shopTower.wind_3);
			_shopTower.addHidenObjects(hidenObjects);
			
			_bankTower = new MenuTower(view.bankTower as MovieClip);
			hidenObjects = new Vector.<MovieClip>;
			hidenObjects.push(view.bankTower.wind_1);
			hidenObjects.push(view.bankTower.wind_2);
			_bankTower.addHidenObjects(hidenObjects);
			
			_gameTower = new MenuTower(view.gameTower as MovieClip, view.gameTower.doors);
			hidenObjects = new Vector.<MovieClip>;
			hidenObjects.push(view.gameTower.winds);
			_gameTower.addHidenObjects(hidenObjects);
		}
		
		private function setObjectsMode():void {
		}
		
		private function addListeners():void {
		}
		
	}

}