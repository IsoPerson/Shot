package Server  
 {
	import flash.events.*;
	import flash.net.*;
	
	public class UpdateActivity extends EventDispatcher
	{
		private var url_loader:URLLoader;
		private var _info:UpdateActivInfo;
		
		public function UpdateActivity(user_id:Number) 
		{
			var url_request:URLRequest = new URLRequest(ServerPaths.SERVER_URL+"updateActivity.php?user_id="+user_id);
			url_loader = new URLLoader;			
			url_loader.addEventListener(Event.COMPLETE,onLoaded);	
			url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
			url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
			url_loader.load(url_request);	
		}
		
		private function onLoaded(e:Event):void
		{			
			_info = new UpdateActivInfo(new XML(url_loader.data));
			dispatchEvent(new ServerEvent(ServerEvent.UPDATE_ACTIV, _info));
			
		}
		
		private function onError(e:Event):void
		{			
		}
		
		public function get info():UpdateActivInfo
		{
			return _info;
		}
	}
	
}
