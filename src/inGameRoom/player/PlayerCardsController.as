package inGameRoom.player {
	import cards.CardViewController;
	import flash.events.Event;
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
			_playerGameInfo.addEventListener(PlayerGameInfo.PRIVATE_CARDS_UPDATE, updatePrivateCardsHandler);
		}
		
		private function updatePrivateCardsHandler(event:Event):void {
			
		}
		
	}
}