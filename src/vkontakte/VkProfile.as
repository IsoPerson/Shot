package vkontakte {
	/**
	 * ...
	 * @author Chip
	 */
	public class VkProfile implements IVkProfile{
		private var _firstName:String;
		private var _lastName:String;
		private var _gender:uint;//0 - man, 1 - woman
		private var _avaUrl:String;
		
		public function Profile() {
			
		}
		
		public function initFromXML(xmlProfile:XML):void {
			_firstName = xmlProfile["first_name"];
			_lastName = xmlProfile["last_name"];
			if (xmlProfile.children().photo_medium) _avaUrl = xmlProfile.children().photo_medium;
			_gender = xmlProfile["gender"];
		}
		
		public function get firstName():String {
			return _firstName;
		}
		public function get lastName():String {
			return _lastName;
		}
		public function get avaUrl():String {
			return _avaUrl;
		}
		public function get gender():uint {
			return _gender;
		}
		
	}

}