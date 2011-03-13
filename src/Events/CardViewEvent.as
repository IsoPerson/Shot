package Events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class CardViewEvent extends Event {
		private var _cardId:int;
		
		public static const CLICK:String = "cardViewClick";
		
		public function CardViewEvent(type:String, cardId:int) {
			super(type);
			_cardId = cardId;
		}
		
		public function get cardId():int {
			return _cardId;
		}
		
	}

}