package managers {
	import window.IWindow;
	import window.Window;
	
	import Events.WindowEvent;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Chip
	 */
	public class WindowManager {
		private var windows:Vector.<IWindow>;
		private var windowQueue:Vector.<IWindow>;
		
		private var _stage:DisplayObjectContainer;
		private var defaultStage:DisplayObjectContainer;
		
		public function WindowManager(defaultStage:DisplayObjectContainer) {
			super();
			this.defaultStage = defaultStage;
		}
		
		public function set stage(value:DisplayObjectContainer):void {
			_stage = value;
		}
		
		public function registerWindow(wind:IWindow):void {
			if (!windows) windows = new Vector.<IWindow>;
			windows.push(wind);
			wind.addEventListener(WindowEvent.CLOSE, onWindowClose);
		}
		
		public function showWindowByName(windowName:String):void {
			for each (var window:IWindow in windows) {
				if (window.name == windowName) showWindow(window);
			}
		}
		
		private function showWindow(wind:IWindow):void {
			for (var i:int = 0; i < windowQueue.length; ++i) {
				if (windowQueue[i].priority > window.priority) {
					_stage.addChild(windowQueue.splice(i, 0, window));
				}
			}
		}
		
		private function onWindowClose(event:WindowEvent):void {
			
		}
		
	}
}