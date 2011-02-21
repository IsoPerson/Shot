package  Server  

{
	import flash.events.Event;
	
	public class ServerEvent extends Event
	{
		public static const PRICES_LOADED:String = "prices loaded";
		public static const ABILITYPRICES_LOADED:String = "ability prices loaded";
		public static const GAMES_LOADED:String = "games loaded";
		public static const BUY_ABILITY:String = "buy ability";
		public static const BUY_VIP:String = "buy vip";
		public static const BUY_MONEY:String = "buy money";
		public static const CREATE_GAME:String = "create game";
		public static const JOIN_GAME:String = "join game";
		public static const DAY_REWARDS_LOADED:String = "day rewards loaded";
		public static const UPDATE_ACTIV:String = "update activ";
		public static const GET_GAME:String = "get game";
		public static const FIND_GAME:String = "find game";
		
		public var data:IServerInfo;
		
		public function ServerEvent(type:String, inParams:IServerInfo = null)
		{
			super(type);
			data = inParams;
		}
	}
}
