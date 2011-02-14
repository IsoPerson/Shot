package inGameRoom.player {
	/**
	 * ...
	 * @author Chip
	 */
	public class PlayerInfo {
		private var _vk_id:int;
		private var _vk_name:String;
		private var _vip:Boolean;
		
		private var ava:PlayerAva;
		private var details:PlayerDetails;
		
		private var _position:uint;
		private var _role:uint;
		private var _radius:uint;
		private var _isCreator:Boolean;
		private var _alive:Boolean;
		private var hp:int;
		
		private var _privateCards:Vector.<Card>;
		private var _openCards:Vector.<Card>;
		
		
		public function PlayerInfo() {
			
		}
		
	}

}