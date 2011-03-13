package managers {
	import Events.WindowEvent;
	import gameWindows.WindowShadow;
	import graphic.WindowClouds;
	import Server.IServerInfo;
	
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
		
		private var _stageForWindows:DisplayObjectContainer;
		private var _stageForRooms:DisplayObjectContainer;
		private var defaultStage:DisplayObjectContainer;
		
		private var shadow:WindowShadow;
		
		public static const CREATE_GAME_WINDOW:String = "createGameWindow";
		
		public static const MAIN_MENU_ROOM:String = "mainMenu_room";
		public static const SHOP_ROOM:String = "shop_room";
		public static const BANK_ROOM:String = "bank_room";
		public static const GAME_REQUESTS_ROOM:String = "gameRequests_room";
		public static const GAME_ROOM:String = "game_room";
		
		public function WindowsManager() {
			if (_instance) throw new Error("WindowsManager is Singleton");
			shadow = new WindowShadow();
		}
		
		public static function getInstance():WindowsManager {
			if(!_instance) { _instance = new WindowsManager(); }
			return _instance;
		}
		
		public function getStage(type:uint):DisplayObjectContainer {
			if (type == Window.NORMAL) {
				return _stageForWindows;
			}else {
				return _stageForRooms;
			}
		}
		
		public function setWindowsStage(value:DisplayObjectContainer):void {
			_stageForWindows = value;
		}
		public function setRoomsStage(value:DisplayObjectContainer):void {
			_stageForRooms = value;
		}
		
		public function register(wind:Window):void {
			if (!windows) {
				windows = new Vector.<Window>;
			}else {
				if (windowExists(wind)) return;
			}
			windows.push(wind);
			wind.addEventListener(WindowEvent.CLOSE, closeWindowHandler);
		}
		
		public function show(windowName:String):void {
			if (getStage(getElement(windowName).type)) {
				addToStage(getElement(windowName));
				getElement(windowName).init();
			}
		}
		
		public function getElement(id:String):Window {
			for each (var window:Window in windows) {
				if (window.name == id) return window;
			}
			return null;
		}
		
		public function setElementInfo(object:IServerInfo, id:String):void {
			for each (var window:Window in windows) {
				if (window.name == id) {window.setInfo(object);}
			}
		}
		
		private function addToStage(window:Window):void {
			if (window) {
				addShadow(window);
				getStage(window.type).addChild(window.view);
			}
		}
		private function removeFromStage(window:Window):void {
			if (window) {
				removeShadow(window);
				if (getStage(window.type).contains(window.view)) {
					getStage(window.type).removeChild(window.view);
				}else { trace("window dont contains in stage type -- " + window.type); }
			}
		}
		
		private function addShadow(window:Window):void {
			if (window.type == Window.NORMAL) {
				getStage(window.type).addChild(shadow.view);
			}
		}
		private function removeShadow(window:Window):void {
			if (window.type == Window.NORMAL) {
				if (getStage(window.type).contains(shadow.view)) {
					getStage(window.type).removeChild(shadow.view);
				}
			}
		}

		private function closeWindowHandler(event:WindowEvent):void {
			removeFromStage(event.window);
		}
		
		private function windowExists(wind:Window):Boolean {
			for each (var w:Window in windows) {
				if (w.name == wind.name) return true;
			}
			return false;
		}
		
	}
}