package menu {
	import Controllers.GameController;
	import Controllers.ViewController;
	import Events.BuyEvent;
	import Events.RoomEvent;
	
	import Server.ServerAnswer;
	import Server.ServerEvent;
	import Server.ServerFacade;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import gameRooms.BankRoom;
	import gameRooms.GameRequestsRoom;
	import gameRooms.GameRoom;
	import gameRooms.ShopRoom;
	
	import gameWindows.CreateGameWindow;
	
	import graphic.MainMenuView;
	import graphic.Tab_createGame;
	import graphic.gameRooms.ShopRoomView;
	
	import managers.RoomsManager;
	import managers.WindowsManager;
	
	import menu.MenuPointer;

	/**
	 * ...
	 * @author Chip
	 */
	public class MainMenu extends ViewController{
		
		private var _shopTower:MenuTower;
		private var _bankTower:MenuTower;
		private var _gameTower:MenuTower;
		private var _pointer:MenuPointer;
		private var _serverFacade:ServerFacade;
		
		private var _shopRoom:ShopRoom = new ShopRoom();
		private var _gameRoom:GameRoom = new GameRoom();
		private var _bankRoom:BankRoom = new BankRoom();
		
		
		public function MainMenu() {
			super(new MainMenuView());
			_serverFacade = new ServerFacade();
			addRoomsToManager();
			addWindowsToManager();
			initObjects();
			addListeners();
		}
		
		private function addRoomsToManager():void {
			RoomsManager.getInstance().register(_shopRoom);
			RoomsManager.getInstance().register(new GameRequestsRoom());
			RoomsManager.getInstance().register(_gameRoom);
			RoomsManager.getInstance().register(_bankRoom);
			
		}
		
		private function addWindowsToManager():void {
			WindowsManager.getInstance().register(new CreateGameWindow());
		}
		
		private function initObjects():void {
			initTowers();
			initPointer();
		}
		
		private function initTowers():void {
			_shopTower = new MenuTower(getMovieClip("shopTower"));// view.shopTower as MovieClip);
			initShopTowerHidenObjects();
			_bankTower = new MenuTower(getMovieClip("bankTower"));
			initBankTowerHidenObjects();
			_gameTower = new MenuTower(getMovieClip("gameTower"), view.gameTower.doors);
			initGameTowerHidenObjects();
			initTowersRoom();
		}
		
		private function initTowersRoom():void {
			_shopTower.setRoomId(RoomsManager.SHOP_ROOM);
			_bankTower.setRoomId(RoomsManager.BANK_ROOM);
			_gameTower.setRoomId(RoomsManager.GAME_ROOM);
			var gameController:GameController = new GameController(_serverFacade);
			_gameRoom.initGameController(gameController);
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
		
		private function addListeners():void {
			addShopTowerListeners();
		}
		
		private function addShopTowerListeners():void {
			RoomsManager.getInstance().getRoom(RoomsManager.SHOP_ROOM).addEventListener(RoomEvent.WANT_SERVER_DATA, getShopInfo);
			RoomsManager.getInstance().getRoom(RoomsManager.SHOP_ROOM).addEventListener(BuyEvent.BUY_ABILITY, buyAbility);
		}
		
		private function getShopInfo(e:RoomEvent):void{
			RoomsManager.getInstance().getRoom(RoomsManager.SHOP_ROOM).removeEventListener(RoomEvent.WANT_SERVER_DATA, getShopInfo);
			_serverFacade.abilityPricesRequest();
			_serverFacade.addEventListener(ServerEvent.ABILITYPRICES_LOADED, abilityPricesLoadedHandler);
		}
		private function abilityPricesLoadedHandler(event:ServerEvent):void {
			RoomsManager.getInstance().setRoomInfo(_serverFacade.getShopInfo,RoomsManager.SHOP_ROOM);
		}
		
		private function buyAbility(e:BuyEvent):void
		{
			_serverFacade.buyAbilityRequest(102841,e.count);
			_serverFacade.addEventListener(ServerEvent.BUY_ABILITY, onBuyAbility);
		}
		
		private function onBuyAbility(e:ServerEvent):void
		{
			var info:ServerAnswer = e.data as ServerAnswer;
			_serverFacade.removeEventListener(ServerEvent.BUY_ABILITY, onBuyAbility);
			if (info.answer)
			{
				//RoomsManager.getInstance().onBuyAbility(RoomsManager.SHOP_ROOM);
				//занести в список способностей и обновить деньги
			}
			else
			{
				//ошибка покупки
			}
		}
	}

}