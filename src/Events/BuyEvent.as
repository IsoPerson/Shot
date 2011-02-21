package  Events  
	
{
	import flash.events.Event;
	
	public class BuyEvent extends Event
	{

		public static const BUY_ABILITY:String = "buy ability";
		public static const BUY_VIP:String = "buy vip";
		public static const BUY_MONEY:String = "buy money";

		
		public var _count:Number;
		
		public function BuyEvent(type:String, data:Number)
		{
			super(type);
			_count = data;
		}
		
		public function get count():Number
		{
			return _count;
		}
	}
}
