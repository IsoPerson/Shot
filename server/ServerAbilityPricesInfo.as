package   server  
{
	
	public class ServerAbilityPricesInfo {

		private var info:Array = new Array();
		
		public function ServerAbilityPricesInfo(data:XML) 
		{
			var t:Object;
			for each(var element:XML in data.*) 
			{
				t = new Object();
				t.price = Number(element);
				t.type = Number(element.@type);
				info.push(t);
			}
		}
		
		public function get prices():Array
		{
			return info;
		}
		
	}
	
}
