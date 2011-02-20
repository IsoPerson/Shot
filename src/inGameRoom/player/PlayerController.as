package inGameRoom.player {
	import Controllers.ViewController;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Chip
	 */
	public class PlayerController extends ViewController{
		private var _playerInfo:PlayerInfo;
		private var _details:PlayerDetailsPanel;
		
		private var coordinates:PlayerCoordinates;
		
		public function PlayerController() {
			super(new MovieClip());
			initObjects();
		}
		
		public function get playerInfo():PlayerInfo {
			return _playerInfo;
		}
		
		private function initObjects():void {
			_details = getMovieClip("detailsPanel");
		}
		
		
	}

}