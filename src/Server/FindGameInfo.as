package  Server  
{
	
	public class FindGameInfo implements IServerInfo
	{

		private var _answer:Boolean = false;
		private var _description:String = "";
		private var _id:Number;
		private var _qPlayers:int;
		private var _type:String;
		
		
		public function FindGameInfo(response:XML) 
		{
			if (Number(response.game_id) > 0)
			{
				_answer = true;
				_id = Number(response.game_id);
				_qPlayers = int(response.qPlayers);
				_type = String(response.type);
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
