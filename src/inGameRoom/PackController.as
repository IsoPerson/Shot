package inGameRoom {
	import inGameRoom.player.PlayerController;
	import inGameRoom.player.PlayerCoordinates;
	import inGameRoom.player.PlayerInfo;
	import cards.Card;
	/**
	 * ...
	 * @author Chip
	 */
	public class PackController {
		private var _players:Vector.<PlayerController>;
		private var _cards:Vector.<Card>;
		
		public var BASE_CARDS_COUNT:uint = 4;
		
		public function PackController(players:Vector.<PlayerController>):void {
			super();
			_players = players;
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
				sendCardsTo(player.playerInfo, BASE_CARDS_COUNT);
			}
		}
		
		private function initCards():void {
			//somthing with pack
		}
		
		private function sendCardsTo(player:PlayerInfo, numCards:uint):void {
			for (var i:int = 0; i < numCards;++i ) {
				player.gameInfo.privateCards.push(_cards.pop());
			}
		}
		
	}
}