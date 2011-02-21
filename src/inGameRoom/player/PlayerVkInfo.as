package inGameRoom.player {
	import Controllers.ViewController;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class PlayerVkInfo extends ViewController{
		private var _vk_id:int;
		private var _vk_name:String;
		private var _vk_avatarUrl:String;
		
		public function PlayerVkInfo() {
			super(new MovieClip());
		}
		
		public function set vk_id(value:int):void {
			_vk_id = value;
		}
		
		public function set vk_name(value:String):void {
			_vk_name = value;
		}
		
		public function set vk_avatarUrl(value:String):void {
			_vk_avatarUrl = value;
		}
		
		public function get vk_id():int {
			return _vk_id;
		}
		
		public function get vk_name():String {
			return _vk_name;
		}
		
		public function get vk_avatarUrl():String {
			return _vk_avatarUrl;
		}
		
	}

}