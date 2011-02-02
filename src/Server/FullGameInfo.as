package  Server  
{
	
	public class FullGameInfo implements IServerInfo
	{

		private var _answer:Boolean = false;
		private var _description:String = "";
		private var _id:Number;
		private var _nPlayers:int;
		//private var _type:String;
		private var _request_id:Number;
		private var _creator:Number;
		private var _stake:Number;
		private var _state:String;
		private var _pack:Array = new Array;
		private var _players:Array = new Array;
		
		
		public function FullGameInfo(response:XML) 
		{
			if (Number(response.request_id) > 0)
			{
				_answer = true;
				//_id = Number(response.game_id);
				_nPlayers = int(response.nPlayers);
				//_type = String(response.type);
				_creator = Number(response.creator_id);
				_stake = Number(response.stake);
				_state = String(response.type);
				_request_id = Number(response.request_id);
				
				if (response.pack.children()[1])
				{
					for each(var item:XML in response.pack.*)
					{
						_pack.push(int(item)); 
					}
				}
				
				var player:PlayerInfo;
				for each (var user:XML in response.players.*)
				{
					player = new PlayerInfo(user);
					_players.push(player);
				}
			}
			else
			{
				_description = response; 
				_answer = false;
			}
			
				
		}
		
		public function get answer():Boolean
		{
			return _answer;
		}
		
		public function get description():String
		{
			return _description;
		}
		
		public function get id():int
		{
			return _id;
		}
	
		public function get nPlayers():int
		{
			return _nPlayers;
		}
		//public function get type():String
		//{
			//return _type;
		//}
		
		public function set id(i:int)
		{
			_id=i;
		}
		
		public function get creator():int
		{
			return _creator;
		}
		
		public function get request_id():Number
		{
			return _request_id;
		}
		
		public function get stake():int
		{
			return _stake;
		}
		
		public function get state():String
		{
			return _state;
		}
		
		public function get pack():Array
		{
			return _pack;
		}
		
		public function get players():Array
		{
			return _players;
		}

	}
	
}
