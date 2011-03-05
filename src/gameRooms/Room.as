package gameRooms {
	import Controllers.ViewController;
	
	import Server.IServerInfo;
	
	import flash.display.MovieClip;
	
	import gameWindows.Window;

	/**
	 * ...
	 * @author Chip
	 */
	public class Room extends Window{
		
		public function Room(view:MovieClip, id:String, animate:Boolean = true ) {
			super(view, id, animate, 10);
		}
		
	// public function init():void {}
	 public function setInfo(obj:IServerInfo):void {}
	 //public function buyOk(obj:IServerInfo):void {}
	}

}