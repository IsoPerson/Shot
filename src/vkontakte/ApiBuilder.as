package vkontakte {
	import vkontakte.vkapi.VkApiNode;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class ApiBuilder{
		private var viewer_id:Number = 55743;
		private var api_id:Number = 1917774;
		private var api_secret:String = "1jTWUT7ern";
		private var server_url:String = "http://api.vkontakte.ru/api.php";
		
		public function ApiBuilder() {
			
		}
		
		public function build():VkApiNode {
			return new VkApiNode(viewer_id, api_id, api_secret, false, 'XML', '2.0', server_url);;
		}
		
	}

}