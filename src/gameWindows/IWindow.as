package gameWindows {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Chip
	 */
	public interface IWindow {
		function get name():String;
		function get view():MovieClip;
		function get priority():uint;
		function show():void;
		
		function addEventListener(eventType:String, listener:Function):void;
	}
	
}