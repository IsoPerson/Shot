package gameLayers {
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class Layer extends Sprite {
		private var _layerName:String;
		
		public function Layer(layerName:String) {
			super();
			_layerName = layerName;
		}

		public function get layerName():String {
			return _layerName;
		}
		
	}
}