package Server {
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Chip
	 */
	public class ServerFacade extends EventDispatcher{
		private var serverPrices:IServerRequest;
		
		public function ServerFacade() {
			super();
			init();
		}

		public function init():void {
			serverPrices.init();
		}

		public function pricesRequest():void {
			
		}

		public function gameRulesRequest():void {
			
		}
		
	}

}