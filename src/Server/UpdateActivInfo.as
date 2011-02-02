package  Server  
{
	
	public class UpdateActivInfo implements IServerInfo
	{

		private var _answer:Boolean = false;
		private var _description:String = "";
		private var _first:uint;
		
		
		public function UpdateActivInfo(response:XML) 
		{
			if (Number(response.first) >= 0)
			{
				_answer = true;
				_first = Number(response.first);
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
		
		public function get first():Number
		{
			return _first;
		}
	}
	
}
