package gameWindows {
	import Controllers.ViewController;
	import Events.WindowEvent;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
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

		private var _parentStage:DisplayObjectContainer;
		
		private const SHOW_SPEED:Number = .4;
		
		public static const NORMAL:uint = 0;
		public static const FULL_SCREEN:uint = 1;
		
		public function Window(view:DisplayObject, name:String, windowType:uint = 0, priority:uint = 0) {
			super(view as MovieClip);
			_name = name;
			_type = windowType;
			_priority = priority;
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
			view.dispatchEvent(new WindowEvent(WindowEvent.CLOSE));
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
			animateWindowShow();
		}
		
		private function animateWindowShow():void {
			var viewX:Number = view.x;
			var viewY:Number = view.y;
			view.x += view.width / 2;
			view.y += view.height / 2;
			view.scaleX = 0;
			view.scaleY = 0;
			TweenMax.to(view, SHOW_SPEED, {scaleX:1, scaleY:1, x:viewX, y:viewY, ease:CustomEase.byName("bottomWindEase")});
		}
		
	}
}