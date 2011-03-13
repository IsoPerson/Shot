package inGameRoom {
	import cards.Card;
	import cards.CardFactory;
	import cards.Suits;
	
	import inGameRoom.player.PlayerController;
	import inGameRoom.player.PlayerCoordinates;
	import inGameRoom.player.PlayerInfo;

	/**
	 * ...
	 * @author Chip
	 */
	public class PackController {
		private var _players:Vector.<PlayerController>;
		private var _cards:Vector.<Card>;
		private var cardFactory:CardFactory;
		
		public var BASE_CARDS_COUNT:uint = 4;
		
		public function PackController(players:Vector.<PlayerController>):void {
			super();
			cardFactory = new CardFactory();
			_players = players;
		}
		
		public function createTestPack():void {
			_cards = new Vector.<Card>();
			for (var i:int = 0; i < 79; ++i ) {
				if (Math.random() < .5){ 
					_cards.push(cardFactory.createRadiusGunCard(i, Suits.CLUBS, 0));
				}else{
					_cards.push(cardFactory.createShotCard(i, Suits.CLUBS, 0));
				}
			}
		}
		
		public function set pack(value:Vector.<Card>):void {
			_cards = value;
		}
		public function get pack():Vector.<Card> {
			return _cards;
		}
		
		public function startGame():void {
			initCards();
			for each (var player:PlayerController in _players) {
				sendCardsTo(player.playerInfo, int(BASE_CARDS_COUNT));
			}
		}
		
		private function initCards():void {
			//somthing with pack
		}
		
		private function sendCardsTo(player:PlayerInfo, numCards:uint):void {
			for (var i:int = 0; i < numCards; ++i ) {
				if (_cards.length > 0) { player.gameInfo.addCard(_cards.pop()); }
			}
		}
		
	}
}