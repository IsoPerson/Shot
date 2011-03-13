package Events {

import flash.events.Event;

public class MenuPointerEvent extends Event {
	
	public static const FIND_GAME:String = "findGameClick";
	
	public function MenuPointerEvent(type:String){
		super(type);
	}
}

}