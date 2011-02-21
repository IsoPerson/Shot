package gameRooms {
	import Events.WindowEvent;
	
	import Server.IServerInfo;
	import Server.ServerAbilityPricesInfo;
	
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import graphic.AbilityInfoView;
	import graphic.AbilityView;
	import graphic.gameRooms.ShopRoomView;
	
	import managers.RoomsManager;

	/**
	 * ...
	 * @author Chip
	 */
	public class ShopRoom extends Room {
		private var _exitBtn:MovieClip;
		private var _info:Array = null;
		private var _abilityList:MovieClip = null;
		private var _lastItem:MovieClip = null;
		private var _infoMC:MovieClip = null;
		
		public function ShopRoom() {
			super(new ShopRoomView(), RoomsManager.SHOP_ROOM);
			initObjects();
			setObjectsMode();
			addListeners();
		}
		
		override public function init():void
		{			
			if (_info == null)	{dispatchEvent(new Event(RoomsManager.GET_SHOP_INFO));}
			else {showInfo();}
				
		}
		
		override public function setInfo(obj:IServerInfo):void
		{
			_info = (obj as ServerAbilityPricesInfo).prices;;			
			showInfo();
		}
		
		private function initObjects():void {
			_exitBtn = getMovieClip("exitBtn");
		}
		
		private function setObjectsMode():void {
			_exitBtn.mouseChildren = false;
			_exitBtn.buttonMode = true;
		}
		
		private function addListeners():void {
			_exitBtn.addEventListener(MouseEvent.CLICK, exitHandler);
		}
		
		private function exitHandler(event:MouseEvent):void {
			view.dispatchEvent(new WindowEvent(WindowEvent.CLOSE));
		}
		
		private function showInfo():void
		{
			if (_info != null)
			{
				if (_abilityList == null)
				{
					_abilityList = new MovieClip();
					var item:MovieClip;
					//var data:Array = (_info as ServerAbilityPricesInfo).prices;
					var i:int;
					var col:int;
					var row:int;
					row = col = 0;
					_abilityList.x = 130;
					_abilityList.y = 140;
					
					for (i=0; i< _info.length; i++)
					{
						item = new AbilityView();
						item.x = 180*col;
						item.y = 92*row;
						item.pushedFilter.visible = false;
						col++;
						if (col==3) {col = 0; row++;}
						item.priceTxt.text = _info[i].price+"$";
						item.labelTxt.text = _info[i].label;
						item.name = "a"+i;
						if (_info[i].type != "V")
						{
							item.vipIco.visible = false;
						}
						item.addEventListener(MouseEvent.CLICK,onClickAbility);
						item.addEventListener(MouseEvent.MOUSE_OVER,onOverAbility);
						item.addEventListener(MouseEvent.MOUSE_OUT,onOutAbility);
						item.mouseChildren = false;
						_abilityList.addChild(item);
						
					}			
					view.addChild(_abilityList);
					
					if (row > 4) 
					{				
						var square:Sprite = new Sprite();
						square.graphics.beginFill(0xFF);
						square.graphics.drawRect(100, 130, 550, 370);
						square.graphics.endFill();
						//view.addChild(square);
						_abilityList.mask = square;
					}
				}
				else
				{
					_abilityList.y = 140;
					if (_lastItem != null) {_lastItem.pushedFilter.visible = false;}
					_lastItem = null;			
					view.removeChild(_infoMC);
				}				
			}
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
			var num:Number = Number(item.name.slice(1,item.name.length));
			if (_infoMC == null) 
			{	_infoMC = new AbilityInfoView();
				//_infoMC.mouseChildren = false;
				
			}						
			_infoMC.infoTxt.text = _info[num].info; 
			_infoMC.x = _abilityList.x + item.x + 50;
			_infoMC.y = _abilityList.y + item.y;
			view.addChild(_infoMC);
		}
		
		private function onOutAbility(e:MouseEvent):void
		{
			view.removeChild(_infoMC);
		}
	}

}