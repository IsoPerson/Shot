package Server  
 {
	
	public class JoinGame extends EventDispatcher
	{
		private var url_loader:URLLoader;
		
		public function JoinGame(user_id:Number,game_id:Number) 
		{
			var url_request:URLRequest = new URLRequest(ServerFacade.url+"joinGame.php?user_id="+user_id+"&game_id="+game_id);
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
		}
		
		private function onLoaded(e:Event)
		{			
			var info:GameIdInfo = new GameIdInfo(new XML(url_loader.data));
			dispatchEvent(new ServerEvent(ServerEvent.JOIN_GAME, info));
			
		}
		
		private function onError(e:Event)
		{			
		}
	}
	
}
