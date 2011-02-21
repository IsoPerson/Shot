package managers {
	import Events.BuyEvent;
	import Events.WindowEvent;
	
	import Server.IServerInfo;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
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
		}
		
		public function show(object_id:String):void {
			if (_stage) {
				addToStage(getObjectById(object_id) as MovieClip);
				for each (var room:Room in rooms) {
					if (room.name == object_id) {room.init();}
				}
			}
		}
		
		public function getRoom(id:String):Room {
			for each (var room:Room in rooms) {
				if (room.name == id) return room;
			}
			return null;
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
		
		public function setRoomInfo(object:IServerInfo, id:String):void 
		{
			for each (var room:Room in rooms) {
				if (room.name == id) {room.setInfo(object);}
			}
		}
		
		private function buyAbility(e:BuyEvent):void
		{						
			//trace("2");
			_instance.dispatchEvent(new BuyEvent(BuyEvent.BUY_ABILITY,(e.count+1)));
		}
		
		//private function onBuyAbility(id:String):void
		//{			
		//	for each (var room:Room in rooms) {
		//		if (room.name == id) {room.buyOk();}
		//	}
			
		//}
	}

}