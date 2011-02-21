package Controllers {
	import gameRooms.GameRoom;
	import inGameRoom.player.PlayerController;
	import managers.RoomsManager;
	/**
	 * ...
	 * @author Chip
	 */
	public class GameController {
		private var _gameRoom:GameRoom;
		private var _playerController:PlayerController;
		
		private var nPlayers:uint;
		private var qPlayers:uint;
		
		public function GameController() {
			super();
		}
		
		public function startGame():void {
			_gameRoom = new GameRoom();
			RoomsManager.getInstance().show(RoomsManager.GAME_ROOM);
		}
		
		private function addListeners():void {
			
		}
		
		private function removeListeners():void {
			
		}
		
	}
}