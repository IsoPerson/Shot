package server  
{
	
	public class GameRequests extends EventDispatcher
	{
		
		private var url_loader:URLLoader;
		
		public function GameRequests(user_id:uint, cPlayers:uint) 
		{
			var url_request:URLRequest = new URLRequest(ServerFacade.url+"getPrices.php?user_id="+user_id+"&cPlayers="+cPlayers+"&i="+Math.random());
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
		}
		
		private function onLoaded(e:Event)
		{
			var data:XML=new XML(url_loader.data);	
			var game:GameInfo;
			var games:Array;
			
			for each (var item:XML in data.games.*) 
			{
				game = new GameInfo(item);
				games.push(game);
			}
			
			dispatchEvent(new ServerEvent(ServerEvent.GAMES_LOADED, {games:games}));
			
		}
		
		private function onError(e:Event)
		{			
		}

	}
	
}
