package menu.menuPointer {
	import cards.CardViewController;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class ArrowFastGame extends MenuPointerArrow{
		
		public function ArrowFastGame(view:MovieClip) {
			super(view);
			addListeners();
		}
		
		override protected function addListeners():void {
			super.addListeners();
			view.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(event:MouseEvent):void {
		}

	}
}