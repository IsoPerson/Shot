package vkontakte {
	
	/**
	 * ...
	 * @author Chip
	 */
	public interface IVkProfile {
		function initFromXML(xmlProfile:XML);
		function get firstName():String;
		function get lastName():String;
		function get gender():uint;
		function get avaUrl():String;
	}
	
}