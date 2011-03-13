package  Server {
	public class FindGameInfo extends GameInfo implements IServerInfo {
		private var _answer:Boolean = false;
		private var _description:String = "";
		private var _id:Number;
		private var _qPlayers:int;
		private var _type:String;
		
		public function FindGameInfo(response:XML):void {
			super(response);
			_answer = Number(response.game_id) > 0 ? true : false;
		}
		
		public function get answer():Boolean { return _answer; }
		
		//public function get description():String { return _description; }

	}
}
