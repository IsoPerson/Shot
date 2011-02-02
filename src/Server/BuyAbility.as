package server  
 {
	
	public class BuyAbility extends EventDispatcher
	{
		private var url_loader:URLLoader;
		
		public function BuyAbility(user_id:Number, ab_id:Number ) 
		{
			var url_request:URLRequest = new URLRequest(ServerFacade.url+"buyAbility.php?user_id="+user_id+"&ability_id="+ab_id);
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
		}
		
		private function onLoaded(e:Event)
		{			
			var info:ServerAnswer = new ServerAnswer(new XML(url_loader.data));
			dispatchEvent(new ServerEvent(ServerEvent.BUY_ABILITY, info));
			
		}
		
		private function onError(e:Event)
		{			
		}
	}
	
}
