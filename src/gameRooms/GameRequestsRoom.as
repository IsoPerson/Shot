package gameRooms {
	import Events.RoomEvent;
	
	import Server.GameInfo;
	import Server.GamesList;
	import Server.IServerInfo;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.*;
	
	import graphic.gameRooms.GameRequestsRoomView;
	
	import managers.RoomsManager;
	/**
	 * ...
	 * @author Chip
	 */
	public class GameRequestsRoom extends Room {
		private var _exitBtn:MovieClip;
		private var _selectBox:MovieClip;
		private var _info:Array = null;
		private var _gamesList:Array = new Array();
		private var _lastItem:MovieClip;
		private var _txtColor:uint;
		private var _textFormat:TextFormat;
		
		
		public function GameRequestsRoom() {	
			super(new GameRequestsRoomView(), RoomsManager.GAME_REQUESTS_ROOM);
			initObjects();
			setObjectsMode();
			addListeners();
		}
		
		private function initObjects():void {
			_exitBtn = getMovieClip("exitBtn");
			_selectBox = getMovieClip("selectBox");
		}
		
		private function setObjectsMode():void {
			_exitBtn.mouseChildren = false;
			_exitBtn.buttonMode = true;
			_selectBox.visible = false;
		}
		
		private function addListeners():void {
			_exitBtn.addEventListener(MouseEvent.CLICK, closeHandler);
		}
		
		override public function init():void{			
			trace("init GameRequestsRoom");
			dispatchEvent(new RoomEvent(RoomEvent.WANT_SERVER_DATA));
		}
		
		override public function setInfo(obj:IServerInfo):void{
			_info = (obj as GamesList).games;	
			showInfo();			
		}
		
		private function showInfo():void
		{
			trace("showInfo");
			if (!_info) { return; }
			resetList();
			var item:MovieClip;
			for (var i:int = 0; i < _info.length; i++) {
				item = createGameItem(_info[i]);
				_gamesList.push(item);
				item.x = 70;
				item.y = 196 + 35*i;
				view.addChild(item);
			}
			
		}
		
		private function resetList():void
		{
			var item:MovieClip;
			while (_gamesList.length > 0) {
				item = _gamesList.pop();
				view.removeChild(item);				
			}
		}
		
		private function createGameItem(game:GameInfo):MovieClip{
			
			_txtColor = 0x000000;
			if (game.type == "F") _txtColor = 0xcccccc ;
			else if (game.type == "V") _txtColor = 0xffaaffaa ;
			
			_textFormat = new TextFormat();
			_textFormat.size = 18;
			_textFormat.color = _txtColor;
			
			var item:MovieClip = new MovieClip();
			item.addChild(addNameTxt(game.Name));
			item.addChild(addLevelTxt(game.level));
			item.addChild(addStakeTxt(game.stake));
			item.addChild(addPlayersTxt(game.nPlayers,game.qPlayers));
			
			
			return item;
			
		
		/*	
			
			
			var temp_sprite:Sprite = new Sprite ;
			temp_sprite.alpha = 0 ;
			temp_sprite.buttonMode = true ;
			//temp_sprite.addEventListener(MouseEvent.CLICK, onGameClick) ;
			temp_sprite.addEventListener(MouseEvent.MOUSE_OVER, onGameMouseOver) ;
			this.selectBox.addEventListener(MouseEvent.MOUSE_OUT, onGameMouseOut) ;
			
			temp_sprite.graphics.beginFill(0xffffff) ;
			temp_sprite.graphics.drawRect(0, 0, selectBox.width, selectBox.height - 5) ;
			temp_sprite.graphics.endFill() ;
			temp_sprite.x = selectBoxX ;
			temp_sprite.y = selectBoxStartY + tfGames.length * selectBoxHeight  + 2;
			addChild(temp_sprite) ;
			tfRow[4] = new Sprite() ;
			tfRow[4] = temp_sprite ;
			
			if (row["type"] != "N") {
				var temp_icoGame:Sprite ;
				if (row["type"] == "V") temp_icoGame = new Game_requests_vipGame() ;
				else if (row["type"] == "F") temp_icoGame = new Game_requests_friendGame() ;
				temp_icoGame.x = selectBoxX + 250 ;
				temp_icoGame.y = selectBoxStartY + tfGames.length * selectBoxHeight + 3 ;
				addChild(temp_icoGame) ;
				tfRow[5] = temp_icoGame ;
			}
			
			tfGames.push(tfRow) ;*/
		}
		
		private function addNameTxt(name:String):TextField{
			var txt:TextField = getDefaultTextField();
			//trace(name);						
			txt.width = 300;			
			txt.autoSize = TextFieldAutoSize.LEFT;
			txt.text = name;
			return txt;
		}
		
		private function addLevelTxt(level:int):TextField{
			var txt:TextField = getDefaultTextField();
			txt.x = 285;
			txt.autoSize = TextFieldAutoSize.CENTER ;
			txt.text = level.toString();
			
			return txt;
			
		}
		
		private function addStakeTxt(stake:Number):TextField{
			var txt:TextField = getDefaultTextField();
			txt.x = 420;
			txt.autoSize = TextFieldAutoSize.CENTER ;
			txt.text = stake.toString();
			
			return txt;
		}
		
		private function addPlayersTxt(num1:int,num2:int):TextField{
			var txt:TextField = getDefaultTextField();			
			txt.x = 545;
			txt.autoSize = TextFieldAutoSize.CENTER ;
			txt.text = num1+"/"+num2;
			return txt;
			
		}
		
		private function getDefaultTextField():TextField
		{
			var dtxt:TextField = new TextField();			
			dtxt.y = 0;
			dtxt.x = 0;
			dtxt.width = 130;
			dtxt.textColor = _txtColor ;
			dtxt.antiAliasType = AntiAliasType.ADVANCED;
			dtxt.selectable = false;
			dtxt.mouseEnabled = false;						
			dtxt.defaultTextFormat = _textFormat;			
			return dtxt;
		}
		
	}

}