package  {
	
	/**
	 * ...
	 * @author Chip
	 */
	public interface IDeck {
		function init():void;
		function get enabled():Boolean;
		function get topCard():Card;
		function emptyMainPack():Boolean;
		function getCard():Card;
		function resetMainPack():void;
	}
	
}