package   Server  
{
	
	public class GameInfo  implements IServerInfo
	{

		private var _name:String;
		private var _id:Number;
		private var _level:int;
		private var _stake:int;
		private var _nPlayers:int;
		private var _qPlayers:int;
		private var _type:String;
		
		public function GameInfo(item:XML) 
		{
			_name = String(item.creator_id);
			_id = Number(item.game_id);
			_level = int(item.level);
			_stake = int(item.stake);
			_nPlayers = int(item.nPlayers);
			_qPlayers = int(item.qPlayers);
			_type = String(item.type);

			if (item) {
				fillPlayers(item);
			}
		}
		
		private function fillPlayers(item:XML):void {
			for each (var player:XML in item.players.*) {
				
			}
		}
		
		public function get Name():String
		{
			return _name;
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
