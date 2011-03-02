package gameWindows {
	import Events.GameEvent;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import graphic.Tab_createGame;
	
	import managers.WindowsManager;

	/**
	 * ...
	 * @author Chip
	 */
	public class CreateGameWindow extends Window {
		private var _exitBtn:MovieClip;
		private var _incPlayers:MovieClip;
		private var _decPlayers:MovieClip;
		private var _incStake:MovieClip;
		private var _decStake:MovieClip;
		private var _qPlayersTxt:TextField;
		private var _stakeTxt:TextField;
		private var _onlyFriends:MovieClip;
		private var _onlyVip:MovieClip;
		private var _startBtn:MovieClip;
		
		private var _cur_Players:int;
		private var _cur_stake:int;
		
		private var _cur_state_friends:Number;
		private var _cur_state_vip:Number;
		
		
		private const WINDOW_X:int = 100;
		private const WINDOW_Y:int = 100;
		
		private const COUNT_PLAYERS:int = 7;
		private const STAKE_STEP:int = 100;
		private const DEFAULT_STAKE:int = 100;
		
		public function CreateGameWindow() {
			super(new Tab_createGame(), WindowsManager.CREATE_GAME_WINDOW, 1);
			view.x = WINDOW_X;
			view.y = WINDOW_Y;
			initObjects();
			setObjectsMode();
			addListeners();
		}
		
		private function initObjects():void {
			_exitBtn = getMovieClip("exitBtn");
			_qPlayersTxt = getTextField("qPlayersTxt");
			_stakeTxt = getTextField("stakeTxt");
			_incPlayers = getMovieClip("r_qPlayers");
			_decPlayers = getMovieClip("l_qPlayers");
			_incStake = getMovieClip("r_stake");
			_decStake = getMovieClip("l_stake");
			_onlyFriends = getMovieClip("onlyFriends");
			_onlyVip = getMovieClip("onlyVip");
			_startBtn = getMovieClip("startGameBtn");
		}
		
		private function setObjectsMode():void {
			_exitBtn.mouseChildren = false;
			_exitBtn.buttonMode = true;
			_incPlayers.mouseChildren = false;
			_incPlayers.buttonMode = true;
			_decPlayers.mouseChildren = false;
			_decPlayers.buttonMode = true;
			_decStake.mouseChildren = false;
			_decStake.buttonMode = true;
			_incStake.mouseChildren = false;
			_incStake.buttonMode = true;
			_startBtn.mouseChildren = false;
			_startBtn.buttonMode = true;
		}
		
		private function addListeners():void {
			_exitBtn.addEventListener(MouseEvent.CLICK, closeHandler);
			_incPlayers.addEventListener(MouseEvent.CLICK, incPlayersHandler);
			_decPlayers.addEventListener(MouseEvent.CLICK, decPlayersHandler);
			_incStake.addEventListener(MouseEvent.CLICK, incStakeHandler);
			_decStake.addEventListener(MouseEvent.CLICK, decStakeHandler);
			_onlyFriends.addEventListener(MouseEvent.CLICK, friendsHandler);
			_onlyVip.addEventListener(MouseEvent.CLICK, vipHandler);
			_startBtn.addEventListener(MouseEvent.CLICK, startHandler);
		}
		
		private function incPlayersHandler(e:MouseEvent):void{
			if(_cur_Players < 7) {_cur_Players++;} 	
			_qPlayersTxt.text = _cur_Players.toString();
		}
		
		private function decPlayersHandler(e:MouseEvent):void{
			
			if(_cur_Players > 1) {_cur_Players--;} 			
			_qPlayersTxt.text = _cur_Players.toString();
		}
		
		private function incStakeHandler(e:MouseEvent):void{
			_cur_stake += STAKE_STEP; 	
			_stakeTxt.text = _cur_stake.toString();
		}
		
		private function decStakeHandler(e:MouseEvent):void{
			
			if(_cur_stake > DEFAULT_STAKE) {_cur_stake -= DEFAULT_STAKE;} 			
			_stakeTxt.text = _cur_stake.toString();
		}
		
		override public function init():void{			
			trace("init CreateGameWindow");
			
			_qPlayersTxt.text = COUNT_PLAYERS.toString();
			_cur_Players = COUNT_PLAYERS;
			_cur_stake = STAKE_STEP;
			_stakeTxt.text = DEFAULT_STAKE.toString();
			_cur_state_friends = _cur_state_vip = 0.01;
			_onlyFriends.alpha = _cur_state_friends;
			_onlyVip.alpha = _cur_state_vip;
			
		}
		
		private function friendsHandler(e:MouseEvent):void{
			_cur_state_friends = _cur_state_friends == 0.01 ? 1 : 0.01;
			_onlyFriends.alpha = _cur_state_friends;
		}
		
		private function vipHandler(e:MouseEvent):void{
			_cur_state_vip = _cur_state_vip == 0.01 ? 1 : 0.01;
			_onlyVip.alpha = _cur_state_vip;
		}
		
		private function startHandler(e:MouseEvent):void{
			var data:Array = new Array();
			data["qPlayers"] = _cur_Players;
			data["stake"] = _cur_stake;
			data["onlyFriends"] = _cur_state_friends == 0.01 ? false : true;
			data["onlyVip"] = _cur_state_vip == 0.01 ? false : true; 
			dispatchEvent(new GameEvent(GameEvent.CREATE_GAME,data));
		}
	}

}