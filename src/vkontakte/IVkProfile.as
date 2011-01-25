package vkontakte {
	//import flash.
	
	/**
	 * ...
	 * @author Chip
	 */
	public interface IVkProfile {
		function initFromXML(xmlProfile:XML):void;
		function get firstName():String;
		function get lastName():String;
		function get gender():uint;
		function get avaUrl():String;
	}
	
}