package Server  
 {
	import flash.events.*;
	import flash.net.*;
	
	public class BuyMoney extends EventDispatcher
	{
		private var url_loader:URLLoader;
		private var _info:BuyMoneyInfo;
		
		public function BuyMoney(user_id:Number, count:int) 
		{
			var url_request:URLRequest = new URLRequest(ServerPaths.SERVER_URL+"buyMoney.php?user_id="+user_id+"&count="+count);
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
		}
		
		private function onLoaded(e:Event):void
		{			
			_info = new BuyMoneyInfo(new XML(url_loader.data));
			dispatchEvent(new ServerEvent(ServerEvent.BUY_MONEY, _info));
			
		}
		
		private function onError(e:Event):void
		{			
		}
		public function get info():BuyMoneyInfo
		{
			return _info;
		}
	}
	
}
