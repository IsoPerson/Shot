package  Server  
{
	
	public class GameIdInfo implements IServerInfo
	{

		private var _answer:Boolean = false;
		private var _description:String = "";
		private var _id:Number;
		
		
		public function GameIdInfo(response:XML) 
		{
			if (Number(response.game_id) > 0)
			{
				_answer = true;
				_id = Number(response.game_id);
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
		
		public function get id():Number
		{
			return _id;
		}
	}
	
}
