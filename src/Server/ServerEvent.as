package  Server  

{
	import flash.events.Event;
	
	public class ServerEvent extends Event
	{
		static const PRICES_LOADED:String = "prices loaded";
		static const ABILITYPRICES_LOADED:String = "ability prices loaded";
		static const GAMES_LOADED:String = "games loaded";
		static const BUY_ABILITY:String = "buy ability";
		static const BUY_VIP:String = "buy vip";
		static const BUY_MONEY:String = "buy money";
		static const CREATE_GAME:String = "create game";
		static const JOIN_GAME:String = "join game";
		static const DAY_REWARDS_LOADED:String = "day rewards loaded";
		static const UPDATE_ACTIV:String = "update activ";
		static const GET_GAME:String = "get game";
		static const FIND_GAME:String = "find game";
		
		public var data:IServerInfo;
		
		public function ServerEvent(type:String, inParams:IServerInfo = null)
		{
			super(type);
			data = inParams;
		}
	}
}
