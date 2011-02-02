package  Server  
{
	
	public class ServerAnswer implements IServerInfo
	{

		private var _answer:Boolean = false;
		private var _description:String = "";
		
		public function ServerAnswer(response:XML) 
		{
			if (response != "done") {
				_description = response; //"limit ability","limit ability vip"
				_answer = false;
			}
			else {
				_answer = true;
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
