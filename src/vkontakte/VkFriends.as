package vkontakte {
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Chip
	 */
	public class VkFriends extends EventDispatcher{
		private static var _friends:Vector.<Profile>;
		private static var _appFriends:Vector.<Profile>;
		
		public function VkFriends() {
			
		}
		
		public function get friends():Vector.<Profile> {
			return _friends;
		}
		
		public function get appFriends():Vector.<Profile> {
			return _appFriends;
		}
		
		private function getFriends():void {
			
		}
		
		private function getAppFriends():void {
			
		}
		
	}

}