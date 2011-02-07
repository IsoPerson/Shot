package menu {
	import gameRooms.GameRequestsRoom;
	import gameRooms.ShopRoom;
	import managers.RoomsManager;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import graphic.MainMenuView;
	import graphic.gameRooms.ShopRoomView;
	/**
	 * ...
	 * @author Chip
	 */
	public class MainMenu {
		private var _view:MovieClip;//MainMenuView;
		
		private var _shopTower:MenuTower;
		private var _bankTower:MenuTower;
		private var _gameTower:MenuTower;
		private var _pointer:MenuPointer;
		
		public function MainMenu(view:MovieClip = null) {
			_view = new MainMenuView();
			addRoomsToManager();
			initObjects();
			addListeners();
		}
		
		public function get view():MovieClip {
			return _view;
		}
		
		private function addRoomsToManager():void {
			RoomsManager.getInstance().register(new ShopRoom());
			RoomsManager.getInstance().register(new GameRequestsRoom());
		}
		
		private function initObjects():void {
			initTowers();
			initPointer();
		}
		
		private function initTowers():void {
			_shopTower = new MenuTower(view.shopTower as MovieClip);
			initShopTowerHidenObjects();
			_bankTower = new MenuTower(view.bankTower as MovieClip);
			initBankTowerHidenObjects();
			_gameTower = new MenuTower(view.gameTower as MovieClip, view.gameTower.doors);
			initGameTowerHidenObjects();
			initTowersRoom();
		}
		
		private function initPointer():void {
			_pointer = new MenuPointer(view.pointer);
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
		
		private function initTowersRoom():void {
			_shopTower.setRoomId(RoomsManager.SHOP_ROOM);
			_bankTower.setRoomId(RoomsManager.BANK_ROOM);
			_gameTower.setRoomId(RoomsManager.GAME_REQUESTS_ROOM);
		}
				
		private function addListeners():void {
			addShopTowerListeners();
		}
		
		private function addShopTowerListeners():void {
			//_shopToweraddEventListeners
		}
		
	}

}