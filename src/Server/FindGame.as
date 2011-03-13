﻿package Server {
import flash.events.*;
import flash.net.*;

public class FindGame extends EventDispatcher{
	private var url_loader:URLLoader;
	private var _info:GameInfo;
	private var _userId:String;
	
	public function FindGame(user_id:String){
		send();
		_userId = user_id;
	}
	
	private function send():void{
		var url_request:URLRequest = new URLRequest(ServerPaths.SERVER_URL+
																									"findAndJoinGame.php?user_id="+_userId);
		url_loader = new URLLoader;			
		url_loader.addEventListener(Event.COMPLETE,onLoaded);	
		url_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);	
		url_loader.addEventListener(IOErrorEvent.IO_ERROR,onError);	
		url_loader.load(url_request);	
	}
	
	private function onLoaded(e:Event):void{
		_info = new GameInfo(new XML(url_loader.data));
		dispatchEvent(new ServerEvent(ServerEvent.FIND_GAME, _info));
	}
	
	private function onError(e:Event):void{
		trace("[cant load findGame data]");
	}
	
	public function get info():GameInfo{
		return _info;
	}
}
}
