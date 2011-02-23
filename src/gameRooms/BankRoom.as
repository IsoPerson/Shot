package gameRooms {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import Events.BuyEvent;
	import graphic.BankRoomView;
	
	import managers.RoomsManager;

	/**
	 * ...
	 * @author Chip
	 */
	public class BankRoom extends Room {
		private var _exitBtn:MovieClip;
		private var _incBtn:MovieClip;
		private var _decBtn:MovieClip;
		private var _buyBtn:MovieClip;
		private var _moneyTxt:TextField;
		private var _votesTxt:TextField;
		
		private const BANK_X:int = 400;
		private const BANK_Y:int = 300;
		private const GOLD_COUNT:int = 100;
		private const VOTES_COUNT:int = 1;
		
		private var _cur_votes:uint;
		
		
		public function BankRoom() {
			super(new BankRoomView(), RoomsManager.BANK_ROOM);
			_view.x = BANK_X;
			_view.y = BANK_Y;
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
			_exitBtn = getMovieClip("exitBtn");
			_buyBtn = getMovieClip("buyBtn");
			_incBtn = getMovieClip("r_votes");
			_decBtn = getMovieClip("l_votes");
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
			_exitBtn.mouseChildren = false;
			_exitBtn.buttonMode = true;
			_buyBtn.mouseChildren = false;
			_buyBtn.buttonMode = true;
			_incBtn.mouseChildren = false;
			_incBtn.buttonMode = true;
			_decBtn.mouseChildren = false;
			_decBtn.buttonMode = true;
		}
		
		private function addListeners():void {
			_exitBtn.addEventListener(MouseEvent.CLICK, closeHandler);
			_buyBtn.addEventListener(MouseEvent.CLICK, buyHandler);
			_incBtn.addEventListener(MouseEvent.CLICK, incVotesHandler);
			_decBtn.addEventListener(MouseEvent.CLICK, decVotesHandler);
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