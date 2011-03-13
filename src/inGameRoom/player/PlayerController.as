package inGameRoom.player {
	import abilityes.Ability;
	import abilityes.AbilityViewForPlayerDetails;
	import Controllers.ViewController;
	import Events.CardViewEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import graphic.PlayerView;
	
	import com.greensock.TweenMax;
	/**
	 * ...
	 * @author Chip
	 */
	public class PlayerController extends ViewController{
		private var _playerInfo:PlayerInfo;
		private var _details:PlayerDetailsPanel;
		private var _cardsController:PlayerCardsController;
		
		private var _rPanel:MovieClip;
		private var _labelDead:TextField;
		
		private var coordinates:PlayerCoordinates;
		
		public function PlayerController() {
			super(new PlayerView());
			_playerInfo = new PlayerInfo();
			coordinates = new PlayerCoordinates();
			coordinates.addEventListener(Event.CHANGE, coordinatesChangeHandler);
			initObjects();
			setObjectsMode();
			addListeners();
		}
		
		public function testInit(place:int):void {
			_playerInfo.baseInfo.position = place;
			coordinates.set_crds(place);
			initCardsController();
		}
		
		public function initCardsController():void {
			var cardsRightOrientation:Boolean = _playerInfo.baseInfo.position < 4 ? true : false;
			_cardsController = new PlayerCardsController(_playerInfo.gameInfo, coordinates.crd_privateCards,
																										coordinates.crd_openCards, cardsRightOrientation);
			_cardsController.addEventListener(CardViewEvent.CLICK, cardClickHandler);
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
			_rPanel = getMovieClip("rPanel");
			_labelDead = getTextField("label_dead");
		}
		private function setObjectsMode():void {
			_rPanel.alpha = 0;
			_labelDead.visible = Math.random() > .5 ? false : true;
		}
		
		private function addListeners():void {
			view.addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
			view.addEventListener(MouseEvent.ROLL_OUT, rollOutHandler);
		}
		
		private function coordinatesChangeHandler(event:Event):void {
			view.x = coordinates.crd_ava.x;
			view.y = coordinates.crd_ava.y;
		}
		
		private function rollOverHandler(event:MouseEvent):void {
			TweenMax.to(_rPanel, 1, { alpha:1 } );
		}
		
		private function rollOutHandler(event:MouseEvent):void {
			TweenMax.to(_rPanel, 1, { alpha:0 } );
		}
		
		private function cardClickHandler(event:CardViewEvent):void {
			playerInfo.gameInfo.getCard(event.cardId).play();
		}
		
		public function remove():void {
			playerInfo.gameInfo.removeCards();
			_cardsController.removeCards();
		}
		
	}
}