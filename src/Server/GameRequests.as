package Server  
{
	
	import flash.events.*;
	import flash.net.*;
	
	public class GameRequests extends EventDispatcher
	{
		
		private var url_loader:URLLoader;
		private var _info:GamesList;
		
		public function GameRequests(user_id:uint, cPlayers:uint) 
		{
			var url_request:URLRequest = new URLRequest(ServerPaths.SERVER_URL+"getPrices.php?user_id="+user_id+"&cPlayers="+cPlayers+"&i="+Math.random());
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
		}
		
		private function onLoaded(e:Event):void
		{
			_info = new GamesList(new XML(url_loader.data));
			
			dispatchEvent(new ServerEvent(ServerEvent.GAMES_LOADED, _info));
			
		}
		
		private function onError(e:Event):void
		{			
		}
		
		public function get info():GamesList
		{
			return _info;
		}
	}
	
}
