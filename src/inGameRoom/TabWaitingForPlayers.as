package inGameRoom {
	import Controllers.ViewController;
	
	import Events.WindowEvent;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Quad;
	import com.greensock.text.SplitTextField;
	
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
		
		private const START_TEXT:String = "Ожидание игроков";
		private const BASE_TEXT:String = "Ожидание игроков, еще: ";
		
		public function TabWaitingForPlayers() {
			super(new TabWaitingForPlayersView());
			view.x = 400;
			view.y = 300;
			view.mouseChildren = false;
			initObjects();
		}
		
		public function setNumPlayersForWaiting(nPlayers:int):void{
			setText(BASE_TEXT + nPlayers.toString());
		}
		
		private function initObjects():void {
			_nPlayersTxt = getTextField("nPlayersTxt");
			setText(START_TEXT);
			_nPlayersTxt.autoSize = TextFieldAutoSize.CENTER;
			_nPlayersTxt.multiline = true;
		}
		
		private function setText(value:String):void{
			_nPlayersTxt.text = value;
		}
		
	}
}