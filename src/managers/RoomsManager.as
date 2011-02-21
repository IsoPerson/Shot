package managers {
	import Events.WindowEvent;
	
	import Server.IServerInfo;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.events.Event;
	
	
	import gameRooms.Room;

	/**
	 * ...
	 * @author Chip
	 */
	public class RoomsManager extends EventDispatcher implements IManager {
		private static var _instance:RoomsManager;
		private var rooms:Vector.<Room>;
		private var _stage:DisplayObjectContainer;
		
		public static const MAIN_MENU_ROOM:String = "mainMenu_room";
		public static const SHOP_ROOM:String = "shop_room";
		public static const BANK_ROOM:String = "bank_room";
		public static const GAME_REQUESTS_ROOM:String = "gameRequests_room";
		public static const GAME_ROOM:String = "game_room";
		public static const GET_SHOP_INFO:String = "get_shop_info";
		
		public function RoomsManager():void {
			if (_instance) throw new Error("RoomsManager is Singleton");
		}
		
		public static function getInstance():RoomsManager {
			if (!_instance) _instance = new RoomsManager();
			return _instance;
		}
		
		public static function setStage(stage:DisplayObjectContainer):void {
			if (!_instance) _instance = new RoomsManager();
			_instance._stage = stage;
			
		}
		
		public function register(object:Room):void {
			addRoom(object);
			addRoomListeners(object);
		}
		
		private function addRoom(room:Room):void {
			if (!rooms) {rooms = new Vector.<Room>();}
			rooms.push(room);
		}
		private function addRoomListeners(room:Room):void {
			room.view.addEventListener(WindowEvent.CLOSE, closeRoomHandler);
			for each (var room:Room in rooms) {
				if (room.name == SHOP_ROOM) { room.addEventListener(RoomsManager.GET_SHOP_INFO, getShopInfo);}
			}	
		}
		
		public function show(object_id:String):void {
			if (_stage) {
				addToStage(getObjectById(object_id) as MovieClip);
				for each (var room:Room in rooms) {
					if (room.name == object_id) {room.init();}
				}
			}
		}
		
		private function getObjectById(id:String):DisplayObject {
			for each (var room:Room in rooms) {
				if (room.name == id) return room.view;
			}
			return null;
		}
		
		private function addToStage(roomView:MovieClip):void {
			if (roomView) _stage.addChild(roomView);
		}
		private function removeFromStage(roomView:MovieClip):void {
			if (roomView) _stage.removeChild(roomView);
		}
		
		private function closeRoomHandler(event:WindowEvent):void {
			removeFromStage(event.target as MovieClip);
		}
		
		
		
		
		private function getShopInfo(e:Event):void
		{			
			for each (var room:Room in rooms) {
				if (room.name == SHOP_ROOM) { room.removeEventListener(RoomsManager.GET_SHOP_INFO, getShopInfo);}
			}
			_instance.dispatchEvent(new Event(RoomsManager.GET_SHOP_INFO));
		}
		
		public function setRoomInfo(object:IServerInfo, id:String):void 
		{
			for each (var room:Room in rooms) {
				if (room.name == id) {room.setInfo(object);}
			}
		}
	}

}