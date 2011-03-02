package menu {
	import Events.*;
	
	import Server.*;
	
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
	public class MainMenu {
		private var _view:MovieClip;//MainMenuView;
		
		private var _shopTower:MenuTower;
		private var _bankTower:MenuTower;
		private var _gameTower:MenuTower;
		private var _pointer:MenuPointer;
		private var _serverFacade:ServerFacade;
		
		
		
		public function MainMenu(view:MovieClip = null) {
			_view = new MainMenuView();
			_serverFacade = new ServerFacade();
			addRoomsToManager();
			addWindowsToManager();
			initObjects();
			addListeners();
		}
		
		public function get view():MovieClip {
			return _view;
		}
		
		private function addRoomsToManager():void {
			RoomsManager.getInstance().register(new ShopRoom());
			RoomsManager.getInstance().register(new GameRequestsRoom());
			RoomsManager.getInstance().register(new BankRoom());
			RoomsManager.getInstance().register(new GameRoom());
			
		}
		
		private function addWindowsToManager():void {
			WindowsManager.getInstance().register(new CreateGameWindow());
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
			_pointer.addEventListener(WindowEvent.CREATE_GAME, showCreateGame);
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
			RoomsManager.getInstance().getRoom(RoomsManager.SHOP_ROOM).addEventListener(RoomEvent.WANT_SERVER_DATA, getShopInfo);
			RoomsManager.getInstance().getRoom(RoomsManager.SHOP_ROOM).addEventListener(BuyEvent.BUY_ABILITY, buyAbility);
			RoomsManager.getInstance().getRoom(RoomsManager.BANK_ROOM).addEventListener(BuyEvent.BUY_MONEY, buyMoney);
			RoomsManager.getInstance().getRoom(RoomsManager.GAME_REQUESTS_ROOM).addEventListener(RoomEvent.WANT_SERVER_DATA, getGameRequestsInfo);
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
		
		private function buyMoney(e:BuyEvent):void
		{
			_serverFacade.buyMoneyRequest(102841,e.count);
			_serverFacade.addEventListener(ServerEvent.BUY_MONEY, onBuyMoney);
		}
		
		private function onBuyMoney(e:ServerEvent):void
		{
			var info:BuyMoneyInfo = e.data as BuyMoneyInfo;
			_serverFacade.removeEventListener(ServerEvent.BUY_MONEY, onBuyMoney);
			if (info.answer)
			{
				//info.money
				//обновить деньги
			}
			else
			{
				//ошибка покупки
			}
		}
		
		private function getGameRequestsInfo(e:RoomEvent):void{
			_serverFacade.gamesListRequest(4);
			_serverFacade.addEventListener(ServerEvent.GAMES_LOADED, onGamesLoadedHandler);
		}
		
		private function onGamesLoadedHandler(e:ServerEvent):void{
			_serverFacade.removeEventListener(ServerEvent.GAMES_LOADED, onGamesLoadedHandler);
			RoomsManager.getInstance().getRoom(RoomsManager.GAME_REQUESTS_ROOM).setInfo(_serverFacade.gameRequestData);			
			
		}
		
		private function showCreateGame(e:WindowEvent):void{
			WindowsManager.getInstance().show(WindowsManager.CREATE_GAME_WINDOW);
			WindowsManager.getInstance().getWindow(WindowsManager.CREATE_GAME_WINDOW).addEventListener(GameEvent.CREATE_GAME, onCreateGame);
		}
		
		private function onCreateGame(e:GameEvent):void{
			_serverFacade.createGameRequest(102841,e.data["qPlayers"],"F",e.data["stake"]);
			_serverFacade.addEventListener(ServerEvent.CREATE_GAME, onGameCreated);
		}
		
		private function onGameCreated(e:ServerEvent):void{
			
			_serverFacade.removeEventListener(ServerEvent.CREATE_GAME, onGameCreated);
			
		}
		
	}

}