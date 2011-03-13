package gameWindows {
	import Controllers.ViewController;
	import Events.WindowEvent;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import graphic.WindowClouds;
	import Server.IServerInfo;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.CustomEase;
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
		
		private var _position:Point;
		private var _width:Number;
		private var _height:Number;

		private var _parentStage:DisplayObjectContainer;
		
		private const SHOW_SPEED:Number = .4;
		private const HIDE_SPEED:Number = .3;
		
		public static const NORMAL:uint = 0;
		public static const FULL_SCREEN:uint = 1;
		
		public function Window(view:DisplayObject, name:String, windowType:uint = 0, priority:uint = 0) {
			super(view as MovieClip);
			_name = name;
			_type = windowType;
			_priority = priority;
			_width = view.width;
			_height = view.height;
			if (windowType == NORMAL) {
				createEase();
			}
			addListeners();
		}
		
		public function get name():String {
			return _name;
		}
		
		public function get type():uint {
			return _type;
		}
		
		public function get priority():uint {
			return _priority;
		}
		
		public function init():void {}
		public function setInfo(object:IServerInfo):void{}
		
		public function show():void {
			if (view) _parentStage.addChild(view);
		}
		
		public function closeHandler(event:MouseEvent = null):void {
			close();// animateWindowHide();
		}
		
		private function createEase():void {
			CustomEase.create("bottomWindEase", [{s:0,cp:0.57299,e:0.828},
																						{s:0.828,cp:1.083,e:1.02},
																						{s:1.02,cp:0.957,e:1}]);
		}
		
		private function addListeners():void {
			if (_type == NORMAL){
				view.addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			}
		}
		
		private function addToStageHandler(event:Event):void {
			if (!_position) { _position = new Point(view.x, view.y); }
			animateWindowShow();
		}
		
		private function animateWindowShow():void {
			view.x = _position.x + _width / 2;
			view.y = _position.y + _height / 2;
			view.scaleX = 0;
			view.scaleY = 0;
			TweenMax.to(view, SHOW_SPEED, {scaleX:1, scaleY:1, x:_position.x, y:_position.y, ease:CustomEase.byName("bottomWindEase")});
		}
		
		public function animateWindowHide():void {
			TweenMax.to(view, HIDE_SPEED, { scaleX:0, scaleY:0, x: _position.x + _width / 2,
																			y:_position.y + _height / 2,
																			onComplete: close});
		}
		
		private function close():void {
			dispatchEvent(new WindowEvent(WindowEvent.CLOSE, this));
		}
		
	}
}