package cards {
	import Events.CardEvent;
	
	import Server.clientInformation.DataForServer;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import inGameRoom.player.PlayerInfo;

	/**
	 * ...
	 * @author Chip
	 */
	public class Card extends EventDispatcher{
		public var _cardName:String;
		private var _id:int;
		private var _playingType:int;
		private var _state:int;
		private var _viewType:String;
		private var _cardFunction:int;
		private var _suit:int;
		private var _numberValue:int;
		private var _radius:int;
		
		private var _needAnswer:Boolean;
		
		public static const SMALL_VIEW_TYPE:String = "smallViewType";
		public static const MEDIUM_VIEW_TYPE:String = "mediumViewType";
		public static const BIG_VIEW_TYPE:String = "bigViewType";
		
		public static const HAND:uint = 0;
		public static const TABLE:uint = 1;
		
		public static const ACTIVE:uint = 0;
		public static const PASSIVE:uint = 0;
		
		public static const SHOT:uint = 2;
		public static const RADIUS_GUN:uint = 18;
		
		[Abstract]
		public function Card(id:int) {
			super();
			_id = id;
			_radius = 0;
		}
		
		public function openOnTable():void {
			if (_playingType != TABLE) {
				_playingType = TABLE;
				dispatchEvent(new CardEvent(CardEvent.OPEN_CARD_ON_TABLE));
			}
		}
		
		/**
		 * getters/setters
		 */
		
		public function get cardName():String { return _cardName }
		public function set cardName(value:String):void {
			_cardName = value;
		}
		
		public function get id():int { return _id; }
		
		public function get suit():int{ return _suit; }
		public function set suit(value:int):void{
			_suit = value;
		}
		
		public function get numberValue():int{ return _numberValue; }
		public function set numberValue(value:int):void{
			_numberValue = value;
		}
		
		public function get radius():int { return _radius }
		public function set radius(value:int):void {
			_radius = value;
		}
		
		public function get playingType():int { return _playingType }
		public function set playingType(value:int):void {
			_playingType = value;
		}
		
		public function get state():int { return _state }
		public function set state(value:int):void {
			_state = value;
		}
		
		public function get cardFunction():int { return _cardFunction }
		public function set cardFunction(value:int):void {
			_cardFunction = value;
		}
		
		/**
		 * функция действия карты на персонажа, 
		 * определяется в подклассах, 
		 * по умолчанию отправляет себя на сервер
		 */
		public function play(player:PlayerInfo = null):void {
			sendToServer(player);
		}
		
		protected function sendToServer(player:PlayerInfo):void{
			var dataForServer:DataForServer = new DataForServer();
			dataForServer.addItem("id", _id.toString());
			dataForServer.addItem("stage","1");
			var playerVkId:String = (player) ? player.vkInfo.vk_id.toString() : "-1";
			dataForServer.addItem("user2_id", playerVkId);
		}
}
}