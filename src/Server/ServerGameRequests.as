package Server {
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Timer;

	/**
	 * ...
	 * @author Chip
	 */
	public class ServerGameRequests extends EventDispatcher{
		private var timerGetInfo:Timer;
		
		private var _loader:URLLoader;
		private var _request:URLRequest;
		
		private var _data:IServerInfo;
		private var _gameInfo:GameInfo;
		
		public function ServerGameRequests() {
			timerGetInfo = new Timer(1000);
			timerGetInfo.addEventListener(TimerEvent.TIMER, timerHandler);
			timerGetInfo.stop();
		}
		
		public function get data():IServerInfo {
			return _data;
		}
		
		public function startGetGameInfo(game_id:String, gameInfo:GameInfo):void {
			_gameInfo = gameInfo;
			_request = new URLRequest(ServerPaths.SERVER_URL + "getGameInfo.php?game_id=" + game_id);
			_loader = new URLLoader();
			_loader.addEventListener(Event.COMPLETE, loadCompleteHandler);
			_loader.load(_request);
			timerGetInfo.start();
		}
		
		public function stopGetGameInfo():void{
			timerGetInfo.stop();
			_loader.removeEventListener(Event.COMPLETE, loadCompleteHandler);
		}
		
		private function timerHandler(event:TimerEvent):void {
			loadGameInfo();
		}
		
		private function loadGameInfo():void {
			if (_loader) {
				_loader.load(_request);
			}
		}
		
		private function loadCompleteHandler(event:Event):void {
			var response:XML = new XML(_loader.data);
			_gameInfo.updateData(response);
		}
	
	}
}