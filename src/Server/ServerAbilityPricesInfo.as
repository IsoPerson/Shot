package   Server  
{
	
	public class ServerAbilityPricesInfo  implements IServerInfo
	{

		private var _prices:Array = new Array();
		
		public function ServerAbilityPricesInfo(data:XML) 
		{
			var t:Object;
			for each(var element:XML in data.*) 
			{
				t = new Object();
				t.price = Number(element);
				t.type = Number(element.@type);
				_prices.push(t);
			}
		}
		
		public function get prices():Array
		{
			return _prices;
		}
		
	}
	
}
