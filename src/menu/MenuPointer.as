package menu {
	import Controllers.ViewController;
	import Events.WindowEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Chip
	 */
	public class MenuPointer extends ViewController{
		private var _arrowCreateGame:MovieClip;
		private var _arrowFastGame:MovieClip;
		private var _arrowTopPlayers:MovieClip;
		
		public function MenuPointer(view:MovieClip) {
			super(view);
			initArrows();
			setArrowsMode();
			addListeners();
		}
		
		private function initArrows():void {
			_arrowCreateGame = view.arrowCreateGame as MovieClip;
			_arrowFastGame = view.arrowFastGame as MovieClip;
			_arrowTopPlayers = view.arrowTopPlayers as MovieClip;
		}
		
		private function setArrowsMode():void {
			_arrowCreateGame.gotoAndStop(0);
			_arrowCreateGame.mouseChildren = false;
			_arrowCreateGame.buttonMode = true;
			_arrowFastGame.gotoAndStop(0);
			_arrowFastGame.mouseChildren = false;
			_arrowFastGame.buttonMode = true;
			_arrowTopPlayers.gotoAndStop(0);
			_arrowTopPlayers.mouseChildren = false;
			_arrowTopPlayers.buttonMode = true;
		}
		
		private function addListeners():void {
			addListenerFor(_arrowCreateGame);
			addListenerFor(_arrowFastGame);
			addListenerFor(_arrowTopPlayers);
			_arrowCreateGame.addEventListener(MouseEvent.CLICK,createGameHandler);
		}
		private function addListenerFor(arrow:MovieClip):void {
			arrow.addEventListener(MouseEvent.MOUSE_OVER, onArrowMouseOver);
		}
		
		private function onArrowEnterFrame(event:Event):void {
			if ((event.target as MovieClip).currentFrame == (event.target as MovieClip).totalFrames) {
				(event.target as MovieClip).stop();
				(event.target as MovieClip).removeEventListener(Event.ENTER_FRAME, onArrowEnterFrame);
			}
		}
		
		private function onArrowMouseOver(event:MouseEvent):void {
			(event.target as MovieClip).play();
			(event.target as MovieClip).addEventListener(Event.ENTER_FRAME, onArrowEnterFrame);
		}
		
		private function onArrowMouseOut(event:MouseEvent):void {
			(event.target as MovieClip).gotoAndStop(0);
		}
		
		private function createGameHandler(e:MouseEvent):void
		{
			dispatchEvent(new WindowEvent(WindowEvent.CREATE_GAME));
		}
	}

}