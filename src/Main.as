package {
	import Events.VkFriendsEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import gameChat.Chat;
	
	import menu.MainMenu;
	import managers.RoomsManager;
	import managers.WindowsManager;
	import vkontakte.VkFriends;
	import flash.display.StageScaleMode;
	import graphic.MainMenuView;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class Main extends Sprite {
		private var mainMenu:MainMenu;
		private var chat:Chat;
		
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			trace("privetstvuyu");
			
			var vkFriends:VkFriends = new VkFriends();
			//vkFriends.loadData();
			stage.scaleMode = StageScaleMode.NO_SCALE;
			RoomsManager.setStage(this);
			WindowsManager.setStage(this);
			mainMenu = new MainMenu();
			chat = new Chat();
			addChild(mainMenu.view);
			addChild(chat.view);
			
			//addChild(testGraphic);
		}
		
	}
	
}