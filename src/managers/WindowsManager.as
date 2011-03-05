package managers {
	import Events.WindowEvent;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	
	import gameWindows.IWindow;
	import gameWindows.Window;
	/**
	 * ...
	 * @author Chip
	 */
	public class WindowsManager implements IManager{
		private static var _instance:WindowsManager;
		private var windows:Vector.<Window>;
		private var windowQueue:Vector.<Window>;
		
		private var _stage:DisplayObjectContainer;
		private var defaultStage:DisplayObjectContainer;
		
		public static const CREATE_GAME_WINDOW:String = "createGameWindow";
		
		public function WindowsManager() {
			if (_instance) throw new Error("WindowsManager is Singleton");
		}
		
		public static function getInstance():WindowsManager {
			return _instance;
		}
		
		public static function setStage(value:DisplayObjectContainer):void {
			if (!_instance) _instance = new WindowsManager();
			_instance._stage = value;
		}
		
		public function register(wind:Window):void {
			if (!windows) {
				windows = new Vector.<Window>;
			}else {
				if (windowExists(wind)) return;
			}
			windows.push(wind);
			wind.view.addEventListener(WindowEvent.CLOSE, closeWindowHandler);
		}
		
		public function show(windowName:String):void {
			if (_stage) {
				addToStage(getWindow(windowName).view);
			}
			getWindow(windowName).init();
		}
		
		private function getObjectById(id:String):DisplayObject {
			for each (var window:Window in windows) {
				if (window.name == id) return window.view;
			}
			return null;
		}
		
		public function getWindow(id:String):Window {
			for each (var window:Window in windows) {
				if (window.name == id) return window;
			}
			return null;
		}
		
		private function addToStage(windowView:MovieClip):void {
			if (windowView) _stage.addChild(windowView);
		}
		private function removeFromStage(windowView:MovieClip):void {
			if (windowView) _stage.removeChild(windowView);
		}

		private function showWindowByName(windowName:String):void {
			for each (var window:Window in windows) {
				if (window.name == windowName) showWindow(window);
			}
		}
		
		private function showWindow(wind:Window):void {
			for (var i:int = 0; i < windowQueue.length; ++i) {
				if (windowQueue[i].priority > wind.priority) {
					_stage.addChild(windowQueue.splice(i, 0, wind).view);
				}
			}
		}
		
		private function closeWindowHandler(event:WindowEvent):void {
			removeFromStage(event.target as MovieClip);
		}
		
		private function windowExists(wind:Window):Boolean {
			for each (var w:Window in windows) {
				if (w.name == wind.name) return true;
			}
			return false;
		}
		
	}
}