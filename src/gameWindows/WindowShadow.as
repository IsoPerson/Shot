package gameWindows {
	import cards.CardViewController;
	import Controllers.ViewController;
	import graphic.WindowClouds;
	
	import flash.events.Event;
	
	import com.greensock.TweenMax;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class WindowShadow extends ViewController{
		
		public function WindowShadow() {
			super(new WindowClouds());
			view.addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
		}
		
		private function addToStageHandler(event:Event):void {
			view.alpha = 0;
			TweenMax.to(view, .4, {alpha:1});
		}
	
	}
}