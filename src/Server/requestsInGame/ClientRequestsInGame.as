package Server.requestsInGame {
import Server.clientInformation.DataForServer;

import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class ClientRequestsInGame {
	private var _gameId:String;
	private var _vkId:String;
	
	private var _urlLoader:URLLoader;
	
	private static var _instance:ClientRequestsInGame;
	
	public function ClientRequestsInGame(singleton:Singleton){
	}
	
	public static function getInstance():void{
		if (!_instance){ _instance = new ClientRequestsInGame(singleton); }
		return _instance;
	}
	
	public function set gameId(value:String):void{
		_gameId = value;
	}
	
	public function set vkId(value:String):void{
		_vkId = value;
	}
	
	public function sendCard(dataForServer:DataForServer):void{
		_urlLoader = new URLLoader();
		var urlRequest = new URLRequest(ServerPaths.SERVER_URL + dataForServer.toString() + 
																		"&game_id=" + _gameId + "&user_id=" + _vkId);
		_urlLoader.addEventListener(Event.COMPLETE, cardSendCompleteHandler);
		_urlLoader.load(urlRequest);
	}
	
	private function cardSendCompleteHandler(event:Event):void{
		_urlLoader.removeEventListener(Event.COMPLETE, cardSendCompleteHandler);
	}
	
}
}

public class Singleton():void{}