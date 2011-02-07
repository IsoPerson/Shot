package managers {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import gameRooms.Room;
	import Events.WindowEvent;
	
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author Chip
	 */
	public class RoomsManager implements IManager {
		private static var _instance:RoomsManager;
		private var rooms:Vector.<Room>;
		private var _stage:DisplayObjectContainer;
		
		public static const MAIN_MENU_ROOM:String = "mainMenu_room";
		public static const SHOP_ROOM:String = "shop_room";
		public static const BANK_ROOM:String = "bank_room";
		public static const GAME_REQUESTS_ROOM:String = "gameRequests_room";
		public static const GAME_ROOM:String = "game_room";
		
		
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
		}
		
		public function show(object_id:String):void {
			if (_stage) {
				addToStage(getObjectById(object_id) as MovieClip);
			}
		}
		
		private function getObjectById(id:String):DisplayObject {
			for each (var room:Room in rooms) {
				if (room.id == id) return room.view;
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
		
	}

}