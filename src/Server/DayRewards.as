package Server  
 {
	
	public class DayRewards extends EventDispatcher
	{
		private var url_loader:URLLoader;
		
		public function DayRewards(user_id:Number) 
		{
			var url_request:URLRequest = new URLRequest(ServerFacade.url+"dayRewards.php?user_id="+user_id);
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
		}
		
		private function onLoaded(e:Event)
		{			
			var info:DayRewardsInfo = new DayRewardsInfo(new XML(url_loader.data));
			dispatchEvent(new ServerEvent(ServerEvent.DAY_REWARDS_LOADED, info));
			
		}
		
		private function onError(e:Event)
		{			
		}
	}
	
}
