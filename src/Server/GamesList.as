package   Server  
{
	
	public class GamesList  implements IServerInfo
	{

		public var _games:Array;
		
		public function GamesList(data:XML) 
		{
			var gameInfo:GameInfo;
			
			for each (var item:XML in data.games.*) 
			{
				gameInfo = new GameInfo(item);
				_games.push(gameInfo);
			}
				
		}
		
		public function get games():Array
		{
			return _games;
		}
		
				
		
		
	}
	
}
