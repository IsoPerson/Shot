package Server  
 {
	import flash.events.*;
	import flash.net.*;
	
	public class BuyAbility extends EventDispatcher
	{
		private var url_loader:URLLoader;
		private var _info:ServerAnswer;
		
		public function BuyAbility(user_id:Number, ab_id:Number ) 
		{
			var url_request:URLRequest = new URLRequest(ServerPaths.SERVER_URL+"buyAbility.php?user_id="+user_id+"&ability_id="+ab_id);
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
		}
		
		private function onLoaded(e:Event):void
		{			
			_info = new ServerAnswer(new XML(url_loader.data));
			dispatchEvent(new ServerEvent(ServerEvent.BUY_ABILITY, _info));
			
		}
		
		private function onError(e:Event):void
		{			
		}
		public function get info():ServerAnswer
		{
			return _info;
		}
	}
	
}
