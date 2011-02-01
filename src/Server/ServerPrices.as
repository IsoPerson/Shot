package  Server
{
	
	public class ServerPrices extends EventDispatcher 
	{
		
		private var url_loader:URLLoader;
		
		public function ServerPrices(vip:uint, vote:uint, dayRewards:uint, dayRewardsVip:uint) 
		{
			var url_request:URLRequest = new URLRequest(ServerFacade.url+"getPrices.php?vip="+vip+"&vote="+vote+"&dayRewards="+dayRewards+"&dayRewardsVip="+dayRewardsVip);
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
		}
		
		private function onLoaded(e:Event)
		{
			
			var info:ServerPricesInfo = new ServerPricesInfo(new XML(url_loader.data));
			dispatchEvent(new ServerEvent(ServerEvent.PRICES_LOADED, info));
			
		}
		
		private function onError(e:Event)
		{			
		}

	}
	
}
