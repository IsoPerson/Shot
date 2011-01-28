package Server {
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Chip
	 */
	public class ServerPrices extends EventDispatcher implements IServerRequest{
		private var _vipPrice:int;
		private var _moneyPrice:int;
		private var abilityPriceList:Vector.<AbilityPrice>;
		
		public function ServerPrices() {
			super();
		}
		
		public function init():void {
			
		}
		
		public function loadData():void {
			
		}
		
		public function addEventListener(eventType:String, listener:Function):void {
			super.addEventListener(eventType, listener);
		}
		
		//pub
		
	}

}