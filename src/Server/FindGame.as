package Server  
 {
	
	public class FindGame extends EventDispatcher
	{
		private var url_loader:URLLoader;
		
		public function FindGame(user_id:Number) 
		{
			var url_request:URLRequest = new URLRequest(ServerFacade.url+"findAndJoinGame.php?user_id="+user_id);
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
		}
		
		private function onLoaded(e:Event)
		{			
			var info:FindGameInfo = new FindGameInfo(new XML(url_loader.data));
			dispatchEvent(new ServerEvent(ServerEvent.FIND_GAME, info));
			
		}
		
		private function onError(e:Event)
		{			
		}
	}
	
}
