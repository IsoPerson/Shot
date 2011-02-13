package gameLayers {
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class Layer extends Sprite {
		private var _name:String;
		
		public function Layer(name:String) {
			super();
			_name = name;
		}

		public function get name():String {
			return _name;
		}
		
	}
}