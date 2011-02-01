package Server  
 {
	
	public class CreateGame extends EventDispatcher
	{
		private var url_loader:URLLoader;
		
		public function CreateGame(user_id:Number, qPlayers:int, type:String, stake:int) 
		{
			var url_request:URLRequest = new URLRequest(ServerFacade.url+"createGame.php?user_id="+user_id+"&qPlayers="+count+"&qPlayers="+qPlayers+"&stake="+stake);
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
		}
		
		private function onLoaded(e:Event)
		{			
			var info:GameIdInfo = new GameIdInfo(new XML(url_loader.data));
			dispatchEvent(new ServerEvent(ServerEvent.CREATE_GAME, info));
			
		}
		
		private function onError(e:Event)
		{			
		}
	}
	
}
