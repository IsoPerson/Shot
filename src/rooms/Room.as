package rooms {
	import Controllers.ViewController;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Chip
	 */
	public class Room extends ViewController{
		private var _roomId:String;
		
		public function Room(view:MovieClip, roomId:String ) {
			super(view);
			_roomId = roomId;
		}
		
		public function get roomId():String {
			return _roomId;
		}
		
	}

}