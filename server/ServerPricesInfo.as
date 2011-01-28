package  server  
{
	
	public class ServerPricesInfo {

		private var vip_price:Number = 0;
		private var vote_price:Number = 0;
		private var rewards_price:Number = 0;
		private var rewardsVip_price:Number = 0;
		
		public function ServerPricesInfo(data:XML) 
		{
			vip_price = Number(data.vipPrice);
			vote_price = Number(data.votePrice);
			rewards_price = Number(data.dayRewardsPrice);
			rewardsVip_price = Number(data.dayRewardsVipPrice);
		}
		
		public function get vip():Number
		{
			return vip_price;
		}
		public function get vote():Number
		{
			return vote_price;
		}
		public function get dayRewards():Number
		{
			return rewards_price;
		}
		public function get dayRewardsVip():Number
		{
			return rewardsVip_price;
		}
	}
	
}
