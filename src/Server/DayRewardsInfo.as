package  Server  
{
	
	public class DayRewardsInfo implements IServerInfo
	{

		private var _answer:Boolean = false;
		private var _description:String = "";
		private var _money:Number;
		
		
		public function DayRewardsInfo(response:XML) 
		{
			if (Number(response.firstInDay) > 0)
			{
				_answer = true;
				_money = Number(response.firstInDay);
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
		
		public function get money():Number
		{
			return _money;
		}
	}
	
}
