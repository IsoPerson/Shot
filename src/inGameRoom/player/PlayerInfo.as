package inGameRoom.player {
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Chip
	 */
	public class PlayerInfo extends EventDispatcher{
		private var _vkInfo:PlayerVkInfo;
		private var ava:PlayerAva;
		private var _baseInfo:PlayerBaseInfo;
		private var _gameInfo:PlayerGameInfo;
		
		public function PlayerInfo() {
			super();
		}
		
		public function setVkInfo(playerVkInfo:PlayerVkInfo):void {
			_vkInfo = playerVkInfo;
		}
		
		public function setBaseInfo(playerBaseInfo:PlayerBaseInfo):void {
			_baseInfo = playerBaseInfo;
		}
		
		public function setGameInfo(playerGameInfo:PlayerGameInfo):void {
			_gameInfo = playerGameInfo;
		}
		
		public function initPlayerGameInfo(playerGameInfo:PlayerGameInfo):void {
			
		}
		
	}
}