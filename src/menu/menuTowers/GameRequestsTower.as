package menu.menuTowers {
	import managers.RoomsManager;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Chip
	 */
	public class GameRequestsTower extends MenuTower{
		
		public function GameRequestsTower(view:MovieClip) {
			super(view);
			animationView = getMovieClip("doors");
			initHidenObjects();
			setRoomId(RoomsManager.GAME_REQUESTS_ROOM);
		}
		
		private function initHidenObjects():void {
			var hidenObjects:Vector.<MovieClip> = new Vector.<MovieClip>();
			hidenObjects.push(getMovieClip("winds"));
			addHidenObjects(hidenObjects);
		}
		
	}

}