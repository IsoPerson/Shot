package   Server  
{
	
	public class GameInfo  implements IServerInfo
	{

		public var _Name:String;
		public var _id:Number;
		public var _level:int;
		public var _stake:int;
		public var _nPlayers:int;
		public var _qPlayers:int;
		public var _type:String;
		
		public function GameInfo(item:XML) 
		{
			_name = String(item.creator_id);
			_id = Number(item.game_id);
			_level = int(item.level);
			_stake = int(item.stake);
			_nPlayers = int(item.nPlayers);
			_qPlayers = int(item.qPlayers);
			_type = String(item.type);
				
		}
		
		public function get Name():String
		{
			return _Name;
		}
		
		public function get id():int
		{
			return _id;
		}
		public function get level():int
		{
			return _level;
		}
		
		public function get stake():int
		{
			return _stake;
		}
		public function get nPlayers():int
		{
			return _nPlayers;
		}
		public function get qPlayers():int
		{
			return _qPlayers;
		}
		public function get type():String
		{
			return _type;
		}
		
		
		
		
	}
	
}
