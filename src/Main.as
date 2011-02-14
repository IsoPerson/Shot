package {
	import Events.VkFriendsEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import gameChat.Chat;
	import managers.LayersManager;
	
	import menu.MainMenu;
	import managers.RoomsManager;
	import managers.WindowsManager;
	import vkontakte.VkFriends;
	
	import graphic.MainMenuView;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class Main extends Sprite {
		private var layersManager:LayersManager;
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

			LayersManager.layersContainer = this;
			LayersManager.registerLayers();
			RoomsManager.setStage(LayersManager.getLayer(LayersManager.ROOMS));
			WindowsManager.setStage(LayersManager.getLayer(LayersManager.WINDOWS));
			
			mainMenu = new MainMenu();
			chat = new Chat();
			LayersManager.getLayer(LayersManager.BASE).addChild(mainMenu.view);
			LayersManager.getLayer(LayersManager.BASE).addChild(chat.view);
			
			//addChild(testGraphic);
		}
		
	}	
}