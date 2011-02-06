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
			_shopTower = new MenuTower(view.shopTower as MovieClip);
			initShopTowerHidenObjects();
			_bankTower = new MenuTower(view.bankTower as MovieClip);
			initBankTowerHidenObjects();
			_gameTower = new MenuTower(view.gameTower as MovieClip, view.gameTower.doors);
			initGameTowerHidenObjects();
		}
		
		private function initShopTowerHidenObjects():void {
			var hidenObjects:Vector.<MovieClip> = new Vector.<MovieClip>;
			hidenObjects.push(view.shopTower.wind_1);
			hidenObjects.push(view.shopTower.wind_2);
			hidenObjects.push(view.shopTower.wind_3);
			_shopTower.addHidenObjects(hidenObjects);
		}
		private function initBankTowerHidenObjects():void {
			var hidenObjects:Vector.<MovieClip> = new Vector.<MovieClip>;
			hidenObjects = new Vector.<MovieClip>;
			hidenObjects.push(view.bankTower.wind_1);
			hidenObjects.push(view.bankTower.wind_2);
			_bankTower.addHidenObjects(hidenObjects);
		}
		private function initGameTowerHidenObjects():void {
			var hidenObjects:Vector.<MovieClip> = new Vector.<MovieClip>;
			hidenObjects = new Vector.<MovieClip>;
			hidenObjects.push(view.gameTower.winds);
			_gameTower.addHidenObjects(hidenObjects);
		}
				
		private function addListeners():void {
			addShopTowerListeners();
		}
		
		private function addShopTowerListeners():void {
			//_shopToweraddEventListeners
		}
		
	}

}