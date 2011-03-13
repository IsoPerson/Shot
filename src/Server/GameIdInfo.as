package  Server  
{
	
	public class GameIdInfo extends GameInfo implements IServerInfo
	{

		private var _answer:Boolean = false;
		private var _description:String = "";
		
		
		public function GameIdInfo(response:XML) 
		{
			super(response);
			if (Number(response.game_id) > 0)
			{
				_answer = true;
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
		
	}
}
