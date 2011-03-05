package gameRooms {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import Events.BuyEvent;
	import gameWindows.Window;
	import graphic.BankRoomView;
	import ifaceBaseComponents.BaseBtn;
	import ifaceBaseComponents.BaseTextBtn;
	
	import managers.WindowsManager;

	/**
	 * ...
	 * @author Chip
	 */
	public class BankRoom extends Window {
		private var _exitBtn:BaseBtn;
		private var _incBtn:BaseBtn;
		private var _decBtn:BaseBtn;
		private var _buyBtn:BaseTextBtn;
		private var _moneyTxt:TextField;
		private var _votesTxt:TextField;
		
		private const CENTER_X:int = 400;
		private const CENTER_Y:int = 300;
		private const GOLD_COUNT:int = 100;
		private const VOTES_COUNT:int = 1;
		
		private var _cur_votes:uint;
		
		
		public function BankRoom() {
			super(new BankRoomView(), WindowsManager.BANK_ROOM);
			_view.x = CENTER_X - _view.width / 2;
			_view.y = CENTER_Y - _view.height / 2;
			initObjects();
			resetInfo();
			setObjectsMode();
			addListeners();
		}
		
		override public function init():void
		{
			resetInfo();
		}
		
		private function initObjects():void {
			_exitBtn = new BaseBtn(getMovieClip("exitBtn"));
			_buyBtn = new BaseTextBtn(getMovieClip("buyBtn"), "Обменять");
			_incBtn = new BaseBtn(getMovieClip("r_votes"));
			_decBtn = new BaseBtn(getMovieClip("l_votes"));
			_moneyTxt = getTextField("moneyTxt");
			_votesTxt = getTextField("votesTxt");
		}
		
		private function resetInfo():void{
			
			_cur_votes = VOTES_COUNT;
			updateTxt()
		}
		
		private function updateTxt():void
		{
			_moneyTxt.text = (_cur_votes*GOLD_COUNT).toString();
			_votesTxt.text = _cur_votes.toString();
		}
		
		
		private function setObjectsMode():void {
		}
		
		private function addListeners():void {
			_exitBtn.view.addEventListener(MouseEvent.CLICK, closeHandler);
			_buyBtn.view.addEventListener(MouseEvent.CLICK, buyHandler);
			_incBtn.view.addEventListener(MouseEvent.CLICK, incVotesHandler);
			_decBtn.view.addEventListener(MouseEvent.CLICK, decVotesHandler);
		}
		
		private function buyHandler(e:MouseEvent):void{
			dispatchEvent(new BuyEvent(BuyEvent.BUY_MONEY,_cur_votes));
		}
		
		private function incVotesHandler(e:MouseEvent):void{
			_cur_votes++;
			updateTxt();
		}
		
		private function decVotesHandler(e:MouseEvent):void{
			
			if(_cur_votes > 1) {_cur_votes--;} 			
			updateTxt();
		}
		
	}

}