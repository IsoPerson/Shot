package   server  
{
	
	public class GameInfo {

		public var name:String;
		public var id:Number;
		public var level:int;
		public var stake:int;
		public var nPlayers:int;
		public var qPlayers:int;
		public var type:String;
		
		public function GameInfo(item:XML) 
		{
			name = String(item.creator_id);
			game_id = Number(item.game_id);
			level = int(item.level);
			stake = int(item.stake);
			nPlayers = int(item.nPlayers);
			qPlayers = int(item.qPlayers);
			type = String(item.type);
				
		}
		
				
	}
	
}
