package Server {
	
	/**
	 * ...
	 * @author Chip
	 */
	public interface IServerRequest {
		function init():void;
		function loadData():void;
		function addEventListener(eventType:String, listener:Function);
	}
	
}