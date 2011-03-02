package inGameRoom.player {
	import cards.CardViewController;
	/**
	 * ...
	 * @author Chip
	 */
	public class PlayerCardsController {
		private var cards:Vector.<CardViewController>;
		private var _playerGameInfo:PlayerGameInfo;
		
		public function PlayerCardsController(playerGameInfo:PlayerGameInfo) {
			super();
			_playerGameInfo = playerGameInfo;
			addListeners();
		}
		
		private function addListeners():void {
			_playerGameInfo.addLiteners;
		}
		
	}
}