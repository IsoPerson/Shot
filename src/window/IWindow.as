package window {
	import flash.display.DisplayObjectContainer;
	
	/**
	 * ...
	 * @author Chip
	 */
	public interface IWindow {
		function get name():String;
		function get priority():uint;
		function show():void;
		
		function addEventListener(eventType:String, listener:Function):void;
	}
	
}