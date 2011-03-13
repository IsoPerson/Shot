package Events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class CardEvent extends Event {
		
		public static const CARDS_UPDATE:String = "cardsUpdate";
		public static const OPEN_CARD_ON_TABLE:String = "openCardOnTable";
		public static const CHANGE_CARDS_PRIVATE_STATE:String = "changeCardsPrivateState";
		
		public function CardEvent(type:String) {
			super(type);
		}
		
	}

}