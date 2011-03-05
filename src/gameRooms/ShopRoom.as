package gameRooms {
	import Events.BuyEvent;
	import Events.RoomEvent;
	import Events.WindowEvent;
	import gameWindows.Window;
	import ifaceBaseComponents.BaseBtn;
	import ifaceBaseComponents.BaseTextBtn;
	
	import Server.IServerInfo;
	import Server.ServerAbilityPricesInfo;
	
	import abilityes.AbilityInShop;
	
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import graphic.AbilityInfoView;
	import graphic.AbilityView;
	import graphic.gameRooms.ShopRoomView;
	
	import managers.WindowsManager;

	/**
	 * ...
	 * @author Chip
	 */
	public class ShopRoom extends Window {
		private var _exitBtn:BaseBtn;
		private var _buyBtn:BaseTextBtn;
		private var _info:Array = null;
		private var _abilityList:MovieClip;
		private var _lastItem:MovieClip;
		private var _infoMC:MovieClip;
		
		private const ABILITY_COLUMNS:int = 4;
		private const ABILITY_LIST_X:int = 115;
		private const ABILITY_LIST_Y:int = 140;
		
		public function ShopRoom() {
			super(new ShopRoomView(), WindowsManager.SHOP_ROOM);
			initObjects();
			setObjectsMode();
			addListeners();
			dispatchEvent(new RoomEvent(RoomEvent.WANT_SERVER_DATA));
		}
		
		override public function init():void
		{			
			if (_info) { showInfo(); }
		}
		
		override public function setInfo(obj:IServerInfo):void
		{
			_info = (obj as ServerAbilityPricesInfo).prices;			
			showInfo();
		}
		
		private function initObjects():void {
			_exitBtn = new BaseBtn(getMovieClip("exitBtn"));
			_buyBtn = new BaseTextBtn(getMovieClip("buyBtn"), "Купить");
			createInfoMC();
		}
		
		private function createInfoMC():void {
			_infoMC = new AbilityInfoView();
			_infoMC.mouseEnabled = false;
			_infoMC.mouseChildren = false;
			_infoMC.infoTxt.selectable = false;
			//_infoMC.visible = false;
			//view.addChild(_infoMC);
		}
		
		private function setObjectsMode():void {
		}
		
		private function addListeners():void {
			_exitBtn.view.addEventListener(MouseEvent.CLICK, closeHandler);
			_buyBtn.view.addEventListener(MouseEvent.CLICK, buyHandler);
		}
		
		private function showInfo():void
		{
			if (!_info) { return; }
			if (!_abilityList) {
				_abilityList = new MovieClip();
				_abilityList.x = ABILITY_LIST_X;
				_abilityList.y = ABILITY_LIST_Y;
				for (var i:int = 0; i < _info.length; i++) {
					_abilityList.addChild(createAbility(i));
				}
				view.addChild(_abilityList);
				//view.setChildIndex(_infoMC, view.numChildren - 1);
				if (i / ABILITY_COLUMNS > 4) { setMask(); }
			}else {
				//честно говооря так и не понял что тут происходит, поэтому не знал как называть функцию, в которую этот блок убрать))
				_abilityList.y = ABILITY_LIST_Y;
				if (_lastItem != null) {_lastItem.pushedFilter.visible = false;}
				_lastItem = null;			
				try {view.removeChild(_infoMC);}catch(e:Error){};
			}				
		}
		
		private function createAbility(num:int):MovieClip {
			var item:AbilityInShop= new AbilityInShop(130 * int(num % ABILITY_COLUMNS),
																								92*int(num / ABILITY_COLUMNS), (_info[num].type != "V"));
			item.setPrice(_info[num].price+"$");
			item.setAbilityName(_info[num].label);
			item.view.name = "a" + num;
			item.view.addEventListener(MouseEvent.CLICK,onClickAbility);
			item.view.addEventListener(MouseEvent.MOUSE_OVER,onOverAbility);
			item.view.addEventListener(MouseEvent.MOUSE_OUT, onOutAbility);
			return item.view;
		}
		
		private function setMask():void {
			var square:Sprite = new Sprite();
			square.graphics.beginFill(0xFF);
			square.graphics.drawRect(100, 130, 550, 370);
			square.graphics.endFill();
			_abilityList.mask = square;
		}
		private function onClickAbility(e:MouseEvent):void
		{
			var item:MovieClip = e.currentTarget as MovieClip;
			item.pushedFilter.visible = true;
			if (_lastItem != null) {_lastItem.pushedFilter.visible = false;}
			_lastItem = item;
		}		

		private function onOverAbility(e:MouseEvent):void
		{
			var item:MovieClip = e.currentTarget as MovieClip;			
			var num:Number = Number(item.name.slice(1, item.name.length));
			if (_infoMC){
				_infoMC.infoTxt.text = _info[num].info; 
				_infoMC.x = _abilityList.x + item.x + 50;
				_infoMC.y = _abilityList.y + item.y;
				view.addChild(_infoMC);
			}
		}
		
		private function onOutAbility(e:MouseEvent):void
		{
			if (_infoMC) { view.removeChild(_infoMC); }
		}

		private function buyHandler(event:MouseEvent):void {
			if (_lastItem != null){
				var num:Number = Number(_lastItem.name.slice(1,_lastItem.name.length));
				trace("buy num="+num);
				dispatchEvent(new BuyEvent(BuyEvent.BUY_ABILITY,num));
				_lastItem.pushedFilter.visible = false;
				_lastItem = null;
			}	
		}
		
		//public function buyOk()
		//{
			//_lastItem.pushedFilter.visible = false;
			//_lastItem = null;
			
		//}
	}

}