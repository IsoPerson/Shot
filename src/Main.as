package {
	import Events.VkFriendsEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import menu.MainMenu;
	import managers.RoomsManager;
	import vkontakte.VkFriends;
	
	import graphic.MainMenuView;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class Main extends Sprite {
		private var mainMenu:MainMenu;
		
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			trace("privetstvuyu");
			
			var vkFriends:VkFriends = new VkFriends();
			//vkFriends.loadData();

			RoomsManager.setStage(this);
			mainMenu = new MainMenu();
			addChild(mainMenu.view);
			
			//addChild(testGraphic);
		}
		
	}
	
}