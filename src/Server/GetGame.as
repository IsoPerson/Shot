package Server  
 {
	
	public class GetGame extends EventDispatcher
	{
		private var url_loader:URLLoader;
		private var id:Number;
		
		
		public function GetGame(game_id:Number) 
		{
			var url_request:URLRequest = new URLRequest(ServerFacade.url+"findAndJoinGame.php?game_id="+game_id);
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
			id = game_id;
		}
		
		private function onLoaded(e:Event)
		{			
			var info:FullGameInfo = new FullGameInfo(new XML(url_loader.data));
			info.id = id;
			dispatchEvent(new ServerEvent(ServerEvent.GET_GAME, info));
			
		}
		
		private function onError(e:Event)
		{			
		}
	}
	
}
