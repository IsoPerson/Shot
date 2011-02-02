package Server  
 {
	
	public class UpdateActivity extends EventDispatcher
	{
		private var url_loader:URLLoader;
		
		public function UpdateActivity(user_id:Number) 
		{
			var url_request:URLRequest = new URLRequest(ServerFacade.url+"updateActivity.php?user_id="+user_id);
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
		}
		
		private function onLoaded(e:Event)
		{			
			var info:UpdateActivInfo = new UpdateActivInfo(new XML(url_loader.data));
			dispatchEvent(new ServerEvent(ServerEvent.UPDATE_ACTIV, info));
			
		}
		
		private function onError(e:Event)
		{			
		}
	}
	
}
