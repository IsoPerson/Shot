package gameRooms {
	import Controllers.GameController;
	import Events.GameRoomEvent;
	import Events.WindowEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import gameWindows.Window;
	import graphic.GameRoomView;
	import graphic.TabWaitingForPlayersView;
	import ifaceBaseComponents.BaseBtn;
	import ifaceBaseComponents.BaseTextBtn;
	import inGameRoom.TabWaitingForPlayers;
	import managers.WindowsManager;
	/**
	 * ...
	 * @author Chip
	 */
	public class GameRoom extends Window{
		private var _exitBtn:BaseBtn;
		private var _endMoveBtn:BaseTextBtn;
		private var _shopBtn:BaseTextBtn;
		private var _undoBtn:BaseTextBtn;
		private var _dropCardBtn:BaseTextBtn;
		
		private var _tabWaiting:TabWaitingForPlayers;
		
		public function GameRoom() {
			super(new GameRoomView(), WindowsManager.GAME_ROOM, 1);
			initObjects();
			setObjectsMode();
			addListeners();
		}
		
		public function blockMoveIface():void {
			_endMoveBtn.view.visible = false;
		}
		public function unblockMoveIface():void {
			_endMoveBtn.view.visible = true;
		}
		
		public function showWaitingTab():void {
			view.addChild(_tabWaiting.view);
			_tabWaiting.addEventListener(WindowEvent.CLOSE, closeWaitingTabHandler);
		}
		private function removeWaitingTab():void {
			if (view.contains(_tabWaiting.view)) {
				view.removeChild(_tabWaiting.view);
				dispatchEvent(new GameRoomEvent(GameRoomEvent.READY_FOR_PLAYERS));
			}
		}
		private function closeWaitingTabHandler(event:WindowEvent):void {
			removeWaitingTab();
		}
		
		private function initObjects():void {
			_exitBtn = new BaseBtn(getMovieClip("exitBtn"));
			_endMoveBtn = new BaseTextBtn(getMovieClip("btnEndStep"), "Конец хода");
			_shopBtn = new BaseTextBtn(getMovieClip("btn_shop"), "Магазин");
			_undoBtn = new BaseTextBtn(getMovieClip("btnUndo"), "Отмена");
			_dropCardBtn = new BaseTextBtn(getMovieClip("btnReleaseCards"), "Сбросить");
			
			_tabWaiting = new TabWaitingForPlayers();
		}
		
		private function setObjectsMode():void {
			_undoBtn.view.gotoAndStop(0);
			_undoBtn.view.visible = false;
		}
		
		private function addListeners():void {
			_exitBtn.view.addEventListener(MouseEvent.CLICK, closeHandler);
			_shopBtn.view.addEventListener(MouseEvent.CLICK, shopBtnClickHandler);
			view.addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
		}
		
		private function addToStageHandler(event:Event):void {
		}
		
		private function shopBtnClickHandler(event:MouseEvent):void {
			WindowsManager.getInstance().show(WindowsManager.SHOP_ROOM);
		}
		
	}
}