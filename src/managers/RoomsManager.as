package managers {
	import flash.display.MovieClip;
	import rooms.Room;
	
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author Chip
	 */
	public class RoomsManager implements IManager {
		private var rooms:Vector.<Room>;
		//private 
		
		
		public function RoomsManager():void {
			super();
		}
		
		public function register(object:DisplayObject, object_id:String):void {
			addRoom(object as MovieClip, object_id);
		}
		
		private function addRoom(room:MovieClip, roomId:String):void {
			if (!rooms) rooms = new Vector.<Room>;
			rooms.push(new Room(room, roomId));
		}
		
		public function show(object_id:String):void {
			
		}
		
	}

}