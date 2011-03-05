package inGameRoom {
	import com.greensock.text.SplitTextField;
	import com.greensock.TweenMax;
	import com.greensock.easing.Quad;
	import Controllers.ViewController;
	import Events.WindowEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import graphic.TabWaitingForPlayersView;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class TabWaitingForPlayers extends ViewController {
		private var _nPlayersTxt:TextField;
		
		public function TabWaitingForPlayers() {
			super(new TabWaitingForPlayersView());
			view.x = 400;
			view.y = 300;
			view.buttonMode = true;
			view.mouseChildren = false;
			initObjects();
			addListeners();
		}
		
		private function initObjects():void {
			_nPlayersTxt = getTextField("nPlayersTxt");
			_nPlayersTxt.text = "Добавить игроков";
			_nPlayersTxt.autoSize = TextFieldAutoSize.CENTER;
			_nPlayersTxt.multiline = true;
		}
		
		private function addListeners():void {
			view.addEventListener(MouseEvent.CLICK, clickTextHandler);
		}
		
		private function clickTextHandler(event:MouseEvent):void {
			animateText();
		}
		
		private function animateText():void {
				var stf:SplitTextField = new SplitTextField(_nPlayersTxt);
				for (var i:int = stf.textFields.length - 1; i > -1; i--) {
					TweenMax.to(stf.textFields[i], 1, { blurFilter: { blurX:10, blurY:10 }, x:Math.random() * 650 - 100,
												y:Math.random() * 350 - 100, scaleX:Math.random() * 4 - 2, scaleY:Math.random() * 4 - 2,
												rotation:Math.random() * 360 - 180, autoAlpha:0, delay:Math.random() * 0.5,
												ease:Quad.easeIn, repeat:1, yoyo:true, repeatDelay:1.2, onComplete: onAnimationComplete});
				}
		}
		
		private function onAnimationComplete():void {
			dispatchEvent(new WindowEvent(WindowEvent.CLOSE, null));
		}
		
	}

}