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
		private var _cardsController:PlayerCardsController;
		
		private var coordinates:PlayerCoordinates;
		
		public function PlayerController() {
			super(new MovieClip());
			_cardsController = new PlayerCardsController(_playerInfo.gameInfo);
			initObjects();
		}
		
		public function get playerInfo():PlayerInfo {
			return _playerInfo;
		}
		
		public function addAbility(ability:Ability):void {
			_playerInfo.addAbility(ability);
			_details.addAbility(new AbilityViewForPlayerDetails(ability, _playerInfo.numAbility()));
		}
		
		private function initObjects():void {
			_details = new PlayerDetailsPanel(getMovieClip("detailsPanel"));
		}
		
		
	}
}