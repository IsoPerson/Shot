package Controllers {
	import Events.MoveEvent;
	import gameRooms.GameRoom;
	import inGameRoom.MoveController;
	import inGameRoom.PackController;
	import inGameRoom.player.PlayerController;
	import managers.RoomsManager;
	import Server.ServerFacade;
	import Server.ServerEvent;
	/**
	 * ...
	 * @author Chip
	 */
	public class GameController {
		private var serverFacade:ServerFacade;
		
		private var _gameRoom:GameRoom;
		private var _moveController:MoveController;
		private var _packController:PackController;
		private var _players:Vector.<PlayerController>;
		
		private var nPlayers:uint;
		private var qPlayers:uint;
		
		public function GameController(serverFacade:ServerFacade) {
			super();
			this.serverFacade = serverFacade;
		}
		
		public function initGame():void {
			_gameRoom = new GameRoom();
			_moveController = new MoveController();
			_packController = new PackController(_players);
			RoomsManager.getInstance().show(RoomsManager.GAME_ROOM);
			//sendServerEvents();
			addServerListeners();
		}
		
		private function startGame():void {
			_packController.startGame();
			_moveController.startGame();
		}
		/*
		private function sendServerEvents():void {
			serverFacade.initGame(startGameInfo);
		}
		*/
		
		private function addServerListeners():void {
			serverFacade.addEventListener(ServerEvent.GAME_START, startGameHandler);
		}
		
		private function addListeners():void {
			_moveController.addEventListener(MoveEvent.CHANGE_MOVE, changeMoveHandler);
			_moveController.addEventListener(MoveEvent.END_MY_MOVE, endMyMoveHandler);
			_moveController.addEventListener(MoveEvent.START_MY_MOVE, StartMyMoveHandler);
		}
		
		private function removeListeners():void {
			
		}
		
		//handlers
		private function changeMoveHandler(event:MoveEvent):void {
			
		}
		private function startMyMoveHandler(event:MoveEvent):void {
			_gameRoom.unblockMoveIface();
		}
		private function endMyMoveHandler(event:MoveEvent):void {
			_gameRoom.blockMoveIface();
		}
		
		//server handlers
		private function startGameHandler(event:ServerEvent):void {
			startGame();
		}
		
	}
}