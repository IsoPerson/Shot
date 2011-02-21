package vkontakte {
	import Events.VkFriendsEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.EventDispatcher;
	import flash.events.Event;

	import vkontakte.vkapi.VkApiNode;

	/**
	 * ...
	 * @author Chip
	 */
	public class VkFriends extends EventDispatcher {
		private var api:VkApiNode;
		private var friendsRequest:URLRequest;
		private var friendsLoader:URLLoader;
		private var appFriendsRequest:URLRequest;
		private var appFriendsLoader:URLLoader;
		
		private static var _friends:Vector.<IVkProfile>;
		private static var _appFriends:Vector.<IVkProfile>;
		
		private var apiBuilder:ApiBuilder = new ApiBuilder();
		
		public function VkFriends() {
			api = apiBuilder.build();
		}
		
		public function loadData():void {
			getFriends();
			getAppFriends();
		}
		
		public function get friends():Vector.<IVkProfile> {
			return _friends;
		}
		
		public function get appFriends():Vector.<IVkProfile> {
			return _appFriends;
		}
		
		private function addFriend(friend:IVkProfile):void {
			if (!_friends) _friends = new Vector.<IVkProfile>;
			_friends.push(friend);
		}
		
		private function addAppFriend(appFriend:IVkProfile):void {
			if (!_appFriends) _appFriends = new Vector.<IVkProfile>;
			_appFriends.push(appFriend);
		}
		
		private function getFriends():void {
			var query:String = api.getFriends();
			friendsRequest = new URLRequest(query);
			friendsLoader = new URLLoader(friendsRequest);
			friendsLoader.addEventListener(Event.COMPLETE, friendsLoaded);
			friendsLoader.load(friendsRequest);
		}
		
		private function getAppFriends():void {
			var query:String = api.getFriends();
			appFriendsRequest = new URLRequest(query);
			appFriendsLoader = new URLLoader(appFriendsRequest);
			appFriendsLoader.addEventListener(Event.COMPLETE, appFriendsLoaded);
			appFriendsLoader.load(appFriendsRequest);
		}
		
		private function friendsLoaded(event:Event):void {
			var response:XML = new XML(event.target.data);
			for each (var item:XML in response) {
				addFriend(new VkProfile(item));
			}
		}
		
		private function appFriendsLoaded(event:Event):void {
			testClass(event.target.data);
		}
		
		private function testClass(appFriendsXML:XML):void {
			trace(appFriendsXML);
		}
		
		
		
	}

}