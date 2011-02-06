package Controllers {
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Chip
	 */
	public class ViewController {
		protected var _view:MovieClip;
		
		public function ViewController(view:MovieClip) {
			_view = view;
		}
		
		public function get view():MovieClip {
			return _view;
		}
		
		public function set view(value:MovieClip):void {
			_view = value;
		}
		
	}

}