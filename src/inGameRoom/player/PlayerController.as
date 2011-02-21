package inGameRoom.player {
	import abilityes.Ability;
	import abilityes.AbilityViewForPlayerDetails;
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
		
		public function addAbility(ability:Ability):void {
			_details.addAbility(new AbilityViewForPlayerDetails(_playerInfo.addAbility(ability)));
		}
		
		private function initObjects():void {
			_details = getMovieClip("detailsPanel");
		}
		
		
	}
}