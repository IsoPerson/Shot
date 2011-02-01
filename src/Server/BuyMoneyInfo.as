package  Server  
{
	
	public class BuyMoneyInfo implements IServerInfo
	{

		private var _answer:Boolean = false;
		private var _description:String = "";
		private var _money:Number;
		
		
		public function BuyMoneyInfo(response:XML) 
		{
			if (Number(response.money) > 0)
			{
				_answer = true;
				_money = Number(response.money);
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
