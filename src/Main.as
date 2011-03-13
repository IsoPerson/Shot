package {
	import Events.VkFriendsEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import gameChat.Chat;
	import managers.LayersManager;
	
	import menu.MainMenu;
	import managers.WindowsManager;
	import vkontakte.VkFriends;
	import flash.display.StageScaleMode;
	import graphic.MainMenuView;
	
	/**
	 * ...
	 * @author Chip
	 */
	[SWF(width=800, height=800, frameRate=25)]
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
			
			LayersManager.getInstance().layersContainer = this;
			LayersManager.getInstance().registerLayers();
			var vkFriends:VkFriends = new VkFriends();
			stage.scaleMode = StageScaleMode.NO_SCALE;
			WindowsManager.getInstance().setRoomsStage(LayersManager.getInstance().getLayer(LayersManager.ROOMS));
			WindowsManager.getInstance().setWindowsStage(LayersManager.getInstance().getLayer(LayersManager.WINDOWS));
			mainMenu = new MainMenu();
			chat = new Chat();
			LayersManager.getInstance().getLayer(LayersManager.BASE).addChild(mainMenu.view);
			LayersManager.getInstance().getLayer(LayersManager.BASE).addChild(chat.view);

			//addChild(testGraphic);
		}
		
	}
	
}