package menu.menuTowers {
	import managers.RoomsManager;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Chip
	 */
	public class BankTower extends MenuTower{
		
		public function BankTower(view:MovieClip) {
			super(view);
			initHidenObjects();
			setRoomId(RoomsManager.BANK_ROOM);
		}
		
		private function initHidenObjects():void {
			var hidenObjects:Vector.<MovieClip> = new Vector.<MovieClip>();
			hidenObjects.push(getMovieClip("wind_1"));
			hidenObjects.push(getMovieClip("wind_2"));
			addHidenObjects(hidenObjects);
		}
		
	}

}