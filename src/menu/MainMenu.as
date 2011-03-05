package menu {
	import Controllers.ViewController;
	import Events.*;
	import ifaceBaseComponents.BaseTextBtn;
	import menu.menuTowers.BankTower;
	import menu.menuTowers.GameRequestsTower;
	import menu.menuTowers.ShopTower;
	
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
	
	import menu.menuPointer.MenuPointer;

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
		
		public function MainMenu(view:MovieClip = null) {
			super(new MainMenuView());
			_serverFacade = new ServerFacade();
			addRoomsToManager();
			addWindowsToManager();
			initObjects();
			addListeners();
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
		}
		
		private function addRoomsListeners():void {
			RoomsManager.getInstance().getRoom(RoomsManager.SHOP_ROOM).addEventListener(RoomEvent.WANT_SERVER_DATA, getShopInfo);
			RoomsManager.getInstance().getRoom(RoomsManager.SHOP_ROOM).addEventListener(BuyEvent.BUY_ABILITY, buyAbility);
			RoomsManager.getInstance().getRoom(RoomsManager.BANK_ROOM).addEventListener(BuyEvent.BUY_MONEY, buyMoney);
			RoomsManager.getInstance().getRoom(RoomsManager.GAME_REQUESTS_ROOM).addEventListener(RoomEvent.WANT_SERVER_DATA,
																					getGameRequestsInfo);
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
		
		private function onCreateGame(e:GameEvent):void{
			_serverFacade.createGameRequest(102841,e.data["qPlayers"],"F",e.data["stake"]);
			_serverFacade.addEventListener(ServerEvent.CREATE_GAME, onGameCreated);
		}
		
		private function onGameCreated(e:ServerEvent):void{
			_serverFacade.removeEventListener(ServerEvent.CREATE_GAME, onGameCreated);
		}
		
	}

}