package Server  
 {
	import flash.events.*;
	import flash.net.*;
	
	public class GetGame extends EventDispatcher
	{
		private var url_loader:URLLoader;
		private var id:Number;
		private var _info:FullGameInfo
		
		public function GetGame(game_id:Number) 
		{
			var url_request:URLRequest = new URLRequest(ServerPaths.SERVER_URL+"getGameInfo.php?game_id="+game_id);
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
			id = game_id;
		}
		
		private function onLoaded(e:Event):void
		{			
			_info = new FullGameInfo(new XML(url_loader.data));
			_info.id = id;
			dispatchEvent(new ServerEvent(ServerEvent.GET_GAME, _info));
			
		}
		
		private function onError(e:Event):void
		{			
		}
		
		public function get info():FullGameInfo
		{
			return _info;
		}
	}
	
}
