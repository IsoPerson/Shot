package Server.ServerEvents {

import flash.events.Event;

public class ServerGameEvent extends Event {
	
	public static var GAME_INFO_UPDATED:String = "gameInfoUpdated";
	public function ServerGameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
	{
		super(type, bubbles, cancelable);
	}
}

}