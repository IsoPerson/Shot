package gameRooms {
	import Controllers.ViewController;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Chip
	 */
	public class Room extends ViewController{
		private var _id:String;
		
		public function Room(view:MovieClip, id:String ) {
			super(view);
			_id = id;
		}
		
		public function get id():String {
			return _id;
		}
		
	}

}