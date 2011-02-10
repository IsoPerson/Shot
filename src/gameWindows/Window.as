package gameWindows {
	import Controllers.ViewController;
	import Events.WindowEvent;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Chip
	 */
	public class Window extends ViewController{
		public static const INFO:uint = 0;
		public static const INTERACTIVE:uint = 1;
		
		private var _name:String;
		private var _type:uint;
		private var _priority:uint;
		
		private var _parentStage:DisplayObjectContainer;
		
		public function Window(view:DisplayObject, name:String, priority:uint = 0) {
			super(view as MovieClip);
			_name = name;
			_priority = priority;
		}
		
		public function get name():String {
			return _name;
		}
		
		public function get priority():uint {
			return _priority;
		}
		
		public function show():void {
			if (view) _parentStage.addChild(view);
		}
		
		public function closeHandler(event:MouseEvent = null):void {
			view.dispatchEvent(new WindowEvent(WindowEvent.CLOSE));
		}
		
	}

}