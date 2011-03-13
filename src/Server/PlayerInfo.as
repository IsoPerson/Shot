package Server {
	
	public class PlayerInfo  implements IServerInfo {
		private var _role:String;
		private var _id:Number;
		private var _level:int;
		private var _vip:int;		
		private var _ability:Array = new Array;
		
		public function PlayerInfo(item:XML) {
			_role = String(item.role);
			_id = Number(item.id);
			for each (var ab:XML in item.ability.*) { _ability.push(int(ab)); }
			_level = int(item.level);
			_vip = int(item.vip);
		}
		
		public function get role():String { return _role; }
		
		public function get id():int{ return _id; }

		public function get level():int { return _level; }
		
		public function get vip():int { return _vip; }
		
		public function get ability():Array { return _ability; }
		
	}
}
