package managers {
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author Chip
	 */
	public interface IManager {
		function register(object:DisplayObject, object_id:String):void;
		function show(object_id:String):void;
	}
	
}