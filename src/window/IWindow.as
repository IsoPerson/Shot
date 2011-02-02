package window {
	import flash.display.DisplayObjectContainer;
	
	/**
	 * ...
	 * @author Chip
	 */
	public interface IWindow {
		function type():uint;
		function priority():uint;
		function parentStage():DisplayObjectContainer;
		function show():void;
		//function hide():void;
	}
	
}