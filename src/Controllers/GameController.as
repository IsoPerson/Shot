package Controllers {
	import Events.GameRoomEvent;
	import Events.MoveEvent;
	import gameRooms.BankRoom;
	import gameRooms.GameRoom;
	import inGameRoom.MoveController;
	import inGameRoom.PackController;
	import inGameRoom.player.PlayerController;
	import managers.WindowsManager;
	import Server.GameInfo;
	import Server.IServerInfo;
	import Server.ServerFacade;
	import Server.ServerEvent;
	/**
	 * ...
	 * @author Chip
	 */
	public class GameController {
		private var serverFacade:ServerFacade;
		private var game_id:String;
		private var gameInfo:GameInfo;
		
		private var _gameRoom:GameRoom;
		private var _moveController:MoveController;
		private var _packController:PackController;
		private var _players:Vector.<PlayerController>;
		
		private var nPlayers:uint;
		private var qPlayers:uint;
		
		public function GameController(serverFacade:ServerFacade) {
			super();
			this.serverFacade = serverFacade;
			_gameRoom = WindowsManager.getInstance().getElement(WindowsManager.GAME_ROOM)
										as GameRoom;
		}
		
		public function initGame(gameInfo:GameInfo):void {
			this.gameInfo = gameInfo;
			_moveController = new MoveController();
			_packController = new PackController(_players);
			WindowsManager.getInstance().show(WindowsManager.GAME_ROOM);
			_gameRoom.showWaitingTab();
			sendServerEvents();
			addListeners();
			addServerListeners();
		}
		
		private function startGame():void {
			_packController.startGame();
			_moveController.startGame();
		}
		
		private function sendServerEvents():void {
			serverFacade.giveMeGameInfoPlease(game_id);
		}
		
		private function addServerListeners():void {
			serverFacade.addEventListener(ServerEvent.GAME_START, startGameHandler);
			serverFacade.addEventListener(ServerEvent.GAME_INFO_UPDATE, gameInfoUpdate);
		}
		
		private function addListeners():void {
			_moveController.addEventListener(MoveEvent.CHANGE_MOVE, changeMoveHandler);
			_moveController.addEventListener(MoveEvent.END_MY_MOVE, endMyMoveHandler);
			_moveController.addEventListener(MoveEvent.START_MY_MOVE, startMyMoveHandler);
			_gameRoom.addEventListener(GameRoomEvent.READY_FOR_PLAYERS, testAddPlayers);
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
		private function gameInfoUpdate(event:ServerEvent):void {
			
		}
		private function startGameHandler(event:ServerEvent):void {
			startGame();
		}
		
		private function testAddPlayers(event:GameRoomEvent):void {
			for (var i:int = 0; i < 7;++i ) {
				addPlayer(new PlayerController(), i);
			}
		}
		private function addPlayer(player:PlayerController, place:int):void {
			player.testInit(place);
			_gameRoom.view.addChild(player.view);
		}
		
	}
}