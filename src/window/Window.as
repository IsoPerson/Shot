package window {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Chip
	 */
	public class Window implements IWindow{
		public static const INFO:uint = 0;
		public static const INTERACTIVE:uint = 1;
		
		private var _type:uint;
		private var _priority:uint;
		
		private var _view:DisplayObject;
		private var _parentStage:DisplayObjectContainer;
		
		public function Window(view:DisplayObject, type:uint, priority:uint) {
			super();
			_view = view;
			_type = type;
			_priority = priority;
		}
		
		public function type():uint {
			return _type;
		}
		
		public function priority():uint {
			return _priority;
		}
		
		public function parentStage():DisplayObjectContainer {
			return _parentStage;
		}
		
		public function show():void {
			if (view) _parentStage.addChild(view);
		}
		
	}

}