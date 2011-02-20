package inGameRoom.player {
	/**
	 * ...
	 * @author Chip
	 */
	public class PlayerBaseInfo{
		private var _vip:Boolean;
		private var _position:uint;
		
		public function PlayerBaseInfo() {
			super();
		}
		
		public function set vip(value:Boolean):void {
			_vip = value;
		}
		public function set position(value:uint):void {
			_position = position;
		}
		
		public function get vip():Boolean {
			return _vip;
		}
		public function get position():uint {
			return _position;
		}
		
	}
}