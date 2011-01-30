package Server  
 {
	
	public class ServerAbilityPrices extends EventDispatcher
	{
		private var url_loader:URLLoader;
		
		public function ServerAbilityPrices() 
		{
			var url_request:URLRequest = new URLRequest(ServerFacade.url+"getAbilityPrice.php");
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
		}
		
		private function onLoaded(e:Event)
		{			
			var info:ServerAbilityPricesInfo = new ServerAbilityPricesInfo(new XML(url_loader.data));
			dispatchEvent(new ServerEvent(ServerEvent.ABILITYPRICES_LOADED, info));
			
		}
		
		private function onError(e:Event)
		{			
		}
	}
	
}
