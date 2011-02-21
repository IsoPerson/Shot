package window {
	import Events.WindowEvent;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Chip
	 */
	public class Window extends EventDispatcher implements IWindow{
		public static const INFO:uint = 0;
		public static const INTERACTIVE:uint = 1;
		
		private var _name:String;
		private var _type:uint;
		private var _priority:uint;
		
		private var _view:DisplayObject;
		private var _parentStage:DisplayObjectContainer;
		
		public function Window(view:DisplayObject, name:String, priority:uint) {
			super();
			_view = view;
			_name = name;
			_priority = priority;
		}
		
		public function get name():uint {
			return _name;
		}
		
		public function get priority():uint {
			return _priority;
		}
		
		public function show():void {
			if (view) _parentStage.addChild(view);
		}
		
		override public function addEventlistener(eventType:String, listener:Function):void {
			super.addEventListener(eventType, listener);
		}
		
		private function onClose(event:MouseEvent = null):void {
			dispatchEvent(new WindowEvent(WindowEvent.CLOSE));
		}
		
	//	override public function init():void {}
	}

}