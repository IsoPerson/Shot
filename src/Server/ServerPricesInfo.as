package  Server  
{
	
	public class ServerPricesInfo  implements IServerInfo
	{

		private var _vip:Number = 0;
		private var _vote:Number = 0;
		private var _dayRewards:Number = 0;
		private var _dayRewardsVip:Number = 0;
		
		public function ServerPricesInfo(data:XML) 
		{
			_vip = Number(data.vipPrice);
			_vote = Number(data.votePrice);
			_dayRewards = Number(data.dayRewardsPrice);
			_dayRewardsVip = Number(data.dayRewardsVipPrice);
		}
		
		public function get vip():Number
		{
			return _vip;
		}
		public function get vote():Number
		{
			return _vote;
		}
		public function get dayRewards():Number
		{
			return _dayRewards;
		}
		public function get dayRewardsVip():Number
		{
			return _dayRewardsVip;
		}
	}
	
}
