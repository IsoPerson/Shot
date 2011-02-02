package Server  
 {
	
	public class BuyMoney extends EventDispatcher
	{
		private var url_loader:URLLoader;
		
		public function BuyMoney(user_id:Number, count:int) 
		{
			var url_request:URLRequest = new URLRequest(ServerFacade.url+"buyVip.php?user_id="+user_id+"&count="+count);
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
		}
		
		private function onLoaded(e:Event)
		{			
			var info:BuyMoneyInfo = new BuyMoneyInfo(new XML(url_loader.data));
			dispatchEvent(new ServerEvent(ServerEvent.BUY_MONEY, info));
			
		}
		
		private function onError(e:Event)
		{			
		}
	}
	
}
