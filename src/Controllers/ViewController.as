package Controllers {
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Chip
	 */
	public class ViewController extends EventDispatcher implements IViewController{
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
		
		public function getMovieClip(movieClipName:String):MovieClip {
			return _view.getChildByName(movieClipName) as MovieClip;
		}
		
	}

}