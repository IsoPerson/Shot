package Controllers {
	import Events.GameRoomEvent;
	import Events.MoveEvent;
	import Events.WindowEvent;
	
	import Server.GameInfo;
	import Server.IServerInfo;
	import Server.ServerEvent;
	import Server.ServerEvents.ServerGameEvent;
	import Server.ServerFacade;
	
	import gameRooms.BankRoom;
	import gameRooms.GameRoom;
	
	import inGameRoom.MoveController;
	import inGameRoom.PackController;
	import inGameRoom.player.PlayerController;
	
	import managers.WindowsManager;

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
			_players = new Vector.<PlayerController>();
			this.serverFacade = serverFacade;
			_gameRoom = WindowsManager.getInstance().getElement(WindowsManager.GAME_ROOM)
										as GameRoom;
		}
		
		public function initGame(gameInfo:IServerInfo):void {
			this.gameInfo = gameInfo as GameInfo;
			this.gameInfo.addEventListener(ServerGameEvent.GAME_INFO_UPDATED, gameInfoUpdatedHandler);
			game_id = this.gameInfo.id.toString();
			_moveController = new MoveController();
			_packController = new PackController(_players);
			WindowsManager.getInstance().show(WindowsManager.GAME_ROOM);
			_gameRoom.showWaitingTab();
			sendServerEvents();
			addListeners();
			addServerListeners();
		}
		
		private function startGame():void {
			gameInfo.addEventListener(ServerGameEvent.GAME_INFO_UPDATED, gameInfoUpdatedHandler);
			_packController.createTestPack();
			_packController.startGame();
			_moveController.startGame();
		}
		
		private function sendServerEvents():void {
			serverFacade.giveMeGameInfoPlease(game_id, gameInfo);
		}
		
		private function addServerListeners():void {
			serverFacade.addEventListener(ServerEvent.GAME_START, startGameHandler);
		}
		private function removeServerListeners():void{
			serverFacade.removeEventListener(ServerEvent.GAME_START, startGameHandler);
		}
		
		private function addListeners():void {
			_moveController.addEventListener(MoveEvent.CHANGE_MOVE, changeMoveHandler);
			_moveController.addEventListener(MoveEvent.END_MY_MOVE, endMyMoveHandler);
			_moveController.addEventListener(MoveEvent.START_MY_MOVE, startMyMoveHandler);
			_gameRoom.addEventListener(GameRoomEvent.READY_FOR_PLAYERS, testAddPlayers);
			_gameRoom.addEventListener(WindowEvent.CLOSE, closeRoomHandler);
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
		private function gameInfoUpdatedHandler(event:ServerGameEvent):void {
			
		}
		private function startGameHandler(event:ServerEvent):void {
			removeServerListeners();
			startGame();
		}
		
		private function closeRoomHandler(event:WindowEvent):void {
			removeGame();
		}
		
		private function removeGame():void {
			for each (var player:PlayerController in _players) {
				player.remove();
			}
		}
		
		private function testAddPlayers(event:GameRoomEvent):void {
			for (var i:int = 0; i < 7;++i ) {
				addPlayer(new PlayerController(), i);
			}
			startGame();
		}
		private function addPlayer(player:PlayerController, place:int):void {
			player.testInit(place);
			_players.push(player);
			_gameRoom.view.addChild(player.view);
		}
		
	}
}