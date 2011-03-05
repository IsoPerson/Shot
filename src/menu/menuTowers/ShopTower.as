package menu.menuTowers {
	import managers.WindowsManager;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Chip
	 */
	public class ShopTower extends MenuTower{
		
		public function ShopTower(view:MovieClip) {
			super(view);
			initHidenObjects();
			setRoomId(WindowsManager.SHOP_ROOM);
		}
		
		private function initHidenObjects():void {
			var hidenObjects:Vector.<MovieClip> = new Vector.<MovieClip>;
			hidenObjects.push(getMovieClip("wind_1"));
			hidenObjects.push(getMovieClip("wind_2"));
			hidenObjects.push(getMovieClip("wind_3"));
			addHidenObjects(hidenObjects);
		}
		
	}
}