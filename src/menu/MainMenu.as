package menu {
	import Controllers.GameController;
	import Controllers.ViewController;
	
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
	
	import ifaceBaseComponents.BaseTextBtn;
	
	import managers.WindowsManager;
	
	import menu.menuPointer.MenuPointer;
	import menu.menuTowers.BankTower;
	import menu.menuTowers.GameRequestsTower;
	import menu.menuTowers.ShopTower;

	/**
	 * ...
	 * @author Chip
	 */
	public class MainMenu extends ViewController{
		
		private var _shopTower:ShopTower;
		private var _bankTower:BankTower;
		private var _gameTower:GameRequestsTower;
		private var _pointer:MenuPointer;
		private var _serverFacade:ServerFacade;
		
		private var _rulesBtn:BaseTextBtn;
		
		private var gameController:GameController;
		
		public function MainMenu(serverFacade:ServerFacade) {
			super(new MainMenuView());
			_serverFacade = serverFacade || new ServerFacade("");
			addWindowsToManager();
			initObjects();
			addListeners();
		}
		
		public function set serverFacade(value:ServerFacade):void { _serverFacade = value; }
		
		private function addWindowsToManager():void {
			WindowsManager.getInstance().register(new ShopRoom());
			WindowsManager.getInstance().register(new GameRequestsRoom());
			WindowsManager.getInstance().register(new BankRoom());
			WindowsManager.getInstance().register(new GameRoom());
			
			WindowsManager.getInstance().register(new CreateGameWindow());
		}
		
		private function initObjects():void {
			initTowers();
			initPointer();
			_rulesBtn = new BaseTextBtn(getMovieClip("rulesBtn"), "Правила");
		}
		
		private function initTowers():void {
			_shopTower = new ShopTower(getMovieClip("shopTower"));
			_bankTower = new BankTower(getMovieClip("bankTower"));
			_gameTower = new GameRequestsTower(getMovieClip("gameTower"));
		}
		
		private function initPointer():void {
			_pointer = new MenuPointer(view.pointer);
		}
		
		private function addListeners():void {
			addRoomsListeners();
			addWindowsListeners();
			addPointerListeners();
		}
		
		private function addRoomsListeners():void {
			WindowsManager.getInstance().getElement(WindowsManager.SHOP_ROOM).
																								addEventListener(RoomEvent.WANT_SERVER_DATA, getShopInfo);
			WindowsManager.getInstance().getElement(WindowsManager.SHOP_ROOM).addEventListener(BuyEvent.BUY_ABILITY, buyAbility);
			WindowsManager.getInstance().getElement(WindowsManager.BANK_ROOM).addEventListener(BuyEvent.BUY_MONEY, buyMoney);
			WindowsManager.getInstance().getElement(WindowsManager.GAME_REQUESTS_ROOM).addEventListener(RoomEvent.WANT_SERVER_DATA,
																					getGameRequestsInfo);
		}
		
		private function addWindowsListeners():void {
			WindowsManager.getInstance().getElement(WindowsManager.CREATE_GAME_WINDOW).addEventListener(
													GameEvent.CREATE_GAME, onCreateGame);
		}
		
		private function addPointerListeners():void{
			_pointer.addEventListener(MenuPointerEvent.FIND_GAME, findGameHandler);
		}
		
		private function getShopInfo(e:RoomEvent):void{
			WindowsManager.getInstance().getElement(WindowsManager.SHOP_ROOM).
														removeEventListener(RoomEvent.WANT_SERVER_DATA, getShopInfo);
			_serverFacade.abilityPricesRequest();
			_serverFacade.addEventListener(ServerEvent.ABILITYPRICES_LOADED, abilityPricesLoadedHandler);
		}
		private function abilityPricesLoadedHandler(event:ServerEvent):void {
			WindowsManager.getInstance().setElementInfo(_serverFacade.getShopInfo,WindowsManager.SHOP_ROOM);
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
			WindowsManager.getInstance()..setElementInfo(_serverFacade.gameRequestData, WindowsManager.GAME_REQUESTS_ROOM);
			
		}
		
		private function onCreateGame(e:GameEvent):void{
			_serverFacade.createGameRequest(e.data["qPlayers"],"N",e.data["stake"]);
			_serverFacade.addEventListener(ServerEvent.CREATE_GAME, onGameCreated);
		}
		
		private function onGameCreated(event:ServerEvent):void{
			_serverFacade.removeEventListener(ServerEvent.CREATE_GAME, onGameCreated);
			gameController = new GameController(_serverFacade);
			gameController.initGame(event.data as GameInfo);
		}
		
		private function findGameHandler(event:MenuPointerEvent):void{
			_serverFacade.findGameRequest();
			_serverFacade.addEventListener(ServerEvent.FIND_GAME, findGameCompleteHandler);
		}
		
		private function findGameCompleteHandler(event:ServerEvent):void{
			_serverFacade.removeEventListener(ServerEvent.FIND_GAME, findGameCompleteHandler);
			gameController  = new GameController(_serverFacade);
			gameController.initGame(event.data);
		}
		
	}
}