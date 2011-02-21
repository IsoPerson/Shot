package Server  
 {
	import flash.events.*;
	import flash.net.*;
	
	public class ServerAbilityPrices extends EventDispatcher
	{
		private var url_loader:URLLoader;
		private var _info:IServerInfo;
		
		
		public function ServerAbilityPrices() 
		{
			var url_request:URLRequest = new URLRequest(ServerPaths.SERVER_URL+"getAbilityPrice.php");
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
		}
		
		private function onLoaded(e:Event):void
		{			
			_info = new ServerAbilityPricesInfo(new XML(url_loader.data));
			//dispatchEvent(new ServerEvent(ServerEvent.ABILITYPRICES_LOADED, info));
			
		}
		
		private function onError(e:Event):void
		{			
		}
		
		public function get info():IServerInfo
		{
			return _info;
		}
	}
	
}
