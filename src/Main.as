package {
	import Events.VkFriendsEvent;
	
	import Server.ServerFacade;
	
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import gameChat.Chat;
	
	import graphic.MainMenuView;
	
	import managers.LayersManager;
	import managers.WindowsManager;
	
	import menu.MainMenu;
	
	import vkontakte.VkFriends;
	
	/**
	 * ...
	 * @author Chip
	 */
	[SWF(width=800, height=800, frameRate=25)]
	public class Main extends Sprite {
		private var mainMenu:MainMenu;
		private var chat:Chat;
		
		private var wrapper:Object;
		
		public function Main():void {
			if (stage) { init();
			}else { addEventListener(Event.ADDED_TO_STAGE, init); }
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			trace("privetstvuyu");
			
			LayersManager.getInstance().layersContainer = this;
			LayersManager.getInstance().registerLayers();
			
			var vkFriends:VkFriends = new VkFriends();
			
			WindowsManager.getInstance().setRoomsStage(LayersManager.getInstance().getLayer(LayersManager.ROOMS));
			WindowsManager.getInstance().setWindowsStage(LayersManager.getInstance().getLayer(LayersManager.WINDOWS));

			initMainMenu();
			
			initChat();
			
		}
		
		private function initMainMenu():void{
			mainMenu = new MainMenu(createServerFacade());
			LayersManager.getInstance().getLayer(LayersManager.BASE).addChild(mainMenu.view);
		}
		
		private function createServerFacade():ServerFacade{
			if (parent.parent) { wrapper = Object(parent.parent); }
			var viewerId:String;
			if ((wrapper) && (wrapper.application)) {
				viewerId = wrapper.application.parameters.viewer_id;
				//server_url = wrapper.application.parameters.api_url + '?';
			} else { viewerId = "55743"; }
			return new ServerFacade(viewerId);
		}
		
		private function initChat():void{
			chat = new Chat();
			LayersManager.getInstance().getLayer(LayersManager.BASE).addChild(chat.view);
		}
		
	}
}