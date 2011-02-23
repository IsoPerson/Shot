package Server {
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Chip
	 */
	public class ServerFacade extends EventDispatcher{
		private var serverPrices:IServerRequest;
		private var _abilityPrices:ServerAbilityPrices;
		private var _dayRewards:DayRewards;
		private var _prices:ServerPrices;
		private var _activity:UpdateActivity;
		private var _games:GetGame;
		private var _gamesFind:FindGame;
		private var _gamesJoin:JoinGame;
		private var _gamesCreate:CreateGame;
		private var _gamesList:GameRequests;
		private var _buyAbil:BuyAbility;
		private var _buyMoney:BuyMoney;
		private var _buyVip:BuyVip;
		
		
		public function ServerFacade() {
			super();
			init();
			addListeners();
		}

		public function init():void {
			_abilityPrices = new ServerAbilityPrices();
			//serverPrices.init();
			//abilityPricesRequest();
			dayRewardsRequest(102841);
			
			//----test---------------
			//pricesRequest(1,1,1,1);
			//activityRequest(102841);
			//getGameRequest(1);
			//findGameRequest(102841);
			//joinGameRequest(102841,1);
			//createGameRequest(102841,5,"N",100);
			//gamesListRequest(102841,5);
			//buyMoneyRequest(102841,1);
		}
		
		private function addListeners():void {
			_abilityPrices.addEventListener(ServerEvent.ABILITYPRICES_LOADED, abilityPricesLoadedHandler);
		}

		public function abilityPricesRequest():void {
			_abilityPrices.load();
		}
		private function abilityPricesLoadedHandler(event:ServerEvent):void {
			dispatchEvent(new ServerEvent(ServerEvent.ABILITYPRICES_LOADED));
		}
		
		public function get getShopInfo():IServerInfo
		{
			return  _abilityPrices.info;
		}
		
		//----------------
		private function dayRewardsRequest(vkid:Number):void {
			_dayRewards = new DayRewards(vkid);			
		}		
		public function get dayRewards():Number
		{
			return  _dayRewards.info.money;
		}
		
		//----------------
		public function pricesRequest(vip:uint, vote:uint, dayRewards:uint, dayRewardsVip:uint):void 
		{
			_prices = new ServerPrices(vip, vote, dayRewards,dayRewardsVip);
			_prices.addEventListener(ServerEvent.PRICES_LOADED,onPricesLoaded);
		}
		private function onPricesLoaded(e:ServerEvent):void
		{
			_prices.removeEventListener(ServerEvent.PRICES_LOADED,onPricesLoaded);
			dispatchEvent(e);//new ServerEvent(ServerEvent.PRICES_LOADED, e.data));
		}
		//----------------
		public function activityRequest(vkid:Number):void 
		{
			_activity = new UpdateActivity(vkid);
			_activity.addEventListener(ServerEvent.UPDATE_ACTIV,onActivityLoaded);
		}
		private function onActivityLoaded(e:ServerEvent):void
		{
			_activity.removeEventListener(ServerEvent.UPDATE_ACTIV,onActivityLoaded);
			dispatchEvent(e); 
		}
		
		//----------------
		public function getGameRequest(id:Number):void 
		{
			_games = new GetGame(id);
			_games.addEventListener(ServerEvent.GET_GAME,onGamesLoaded);
		}
		private function onGamesLoaded(e:ServerEvent):void
		{
			_games.removeEventListener(ServerEvent.GET_GAME,onGamesLoaded);
			dispatchEvent(e); 
		}
		
		//----------------
		public function findGameRequest(vkid:Number):void 
		{
			_gamesFind = new FindGame(vkid);
			_gamesFind.addEventListener(ServerEvent.FIND_GAME,onGamesFinded);
		}
		private function onGamesFinded(e:ServerEvent):void
		{
			_gamesFind.removeEventListener(ServerEvent.FIND_GAME,onGamesFinded);
			dispatchEvent(e); 
		}
		
		//----------------
		public function joinGameRequest(vkid:Number,game_id:Number):void 
		{
			_gamesJoin = new JoinGame(vkid,game_id);
			_gamesJoin.addEventListener(ServerEvent.JOIN_GAME,onGamesJoined);
		}
		private function onGamesJoined(e:ServerEvent):void
		{
			_gamesJoin.removeEventListener(ServerEvent.JOIN_GAME,onGamesJoined);
			dispatchEvent(e); 
		}
		
		//----------------
		public function createGameRequest(user_id:Number, qPlayers:int, type:String, stake:int):void 
		{
			_gamesCreate = new CreateGame(user_id, qPlayers, type, stake);
			_gamesCreate.addEventListener(ServerEvent.CREATE_GAME,onGamesCreated);
		}
		private function onGamesCreated(e:ServerEvent):void
		{
			_gamesCreate.removeEventListener(ServerEvent.CREATE_GAME,onGamesCreated);
			dispatchEvent(e); 
		}
		
		//----------------
		public function gamesListRequest(user_id:Number, cPlayers:uint):void 
		{
			_gamesList = new GameRequests(user_id, cPlayers);
			_gamesList.addEventListener(ServerEvent.GAMES_LOADED,onGamesListLoaded);
		}
		private function onGamesListLoaded(e:ServerEvent):void
		{
			_gamesList.removeEventListener(ServerEvent.GAMES_LOADED,onGamesListLoaded);
			dispatchEvent(e); 
		}
		
		//----------------
		public function buyAbilityRequest(user_id:Number, ab_id:Number ):void 
		{
			_buyAbil = new BuyAbility(user_id, ab_id);
			_buyAbil.addEventListener(ServerEvent.BUY_ABILITY,onbuyAbility);
		}
		private function onbuyAbility(e:ServerEvent):void
		{
			_buyAbil.removeEventListener(ServerEvent.BUY_ABILITY,onbuyAbility);
			dispatchEvent(new ServerEvent(ServerEvent.BUY_ABILITY,e.data)); 
		}
		
		
		//----------------
		public function buyMoneyRequest(user_id:Number, count:Number ):void 
		{
			_buyMoney = new BuyMoney(user_id, count);
			_buyMoney.addEventListener(ServerEvent.BUY_MONEY,onbuyMoney);
		}
		private function onbuyMoney(e:ServerEvent):void
		{
			_buyMoney.removeEventListener(ServerEvent.BUY_MONEY,onbuyMoney);
			dispatchEvent(new ServerEvent(ServerEvent.BUY_MONEY,e.data)); 
		}
		
		
		//----------------
		public function buyVipRequest(user_id:Number ):void 
		{
			_buyVip = new BuyVip(user_id);
			_buyVip.addEventListener(ServerEvent.BUY_VIP,onbuyVip);
		}
		private function onbuyVip(e:ServerEvent):void
		{
			_buyVip.removeEventListener(ServerEvent.BUY_VIP,onbuyVip);
			dispatchEvent(e); 
		}
		
		
	}

}