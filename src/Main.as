package {
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class Main extends Sprite {
		
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			trace("privetstvuyu");
			var testDeck:IDeck = new Deck();
			trace(testDeck.enabled);
			trace(testDeck.emptyMainPack());
			testDeck.resetMainPack();
			//trace(testCard);
		}
		
	}
	
}