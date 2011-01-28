package  server  

{
	import flash.events.Event;
	
	public class ServerEvent extends Event
	{
		static const PRICES_LOADED:String = "prices loaded";
		static const ABILITYPRICES_LOADED:String = "ability prices loaded";
		static const GAMES_LOADED:String = "games loaded";
		
		public var data:Object;
		
		public function ServerEvent(type:String, inParams:Object = null)
		{
			super(type);
			data = inParams;
		}
	}
}
