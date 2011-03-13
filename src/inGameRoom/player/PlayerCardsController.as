package inGameRoom.player {
	import Events.CardEvent;
	import Events.CardViewEvent;
	
	import cards.Card;
	import cards.CardViewController;
	
	import com.greensock.TweenMax;
	import com.greensock.easing.Cubic;
	import com.greensock.plugins.BevelFilterPlugin;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import managers.LayersManager;

	/**
	 * ...
	 * @author Chip
	 */
	public class PlayerCardsController extends EventDispatcher{
		private var _stage:DisplayObjectContainer;
		private var _handContainer:Sprite;
		private var _tableContainer:Sprite;
		
		private var _cards:Vector.<CardViewController>;
		private var _playerGameInfo:PlayerGameInfo;
		
		private var handCardsPoint:Point;
		private var tableCardsPoint:Point;
		
		private var _currentCardsShiftOffset:Number;
		
		private var _orientationCoefficient:int; // right: 1, left: -1;
		
		private const CARDS_CONTEINER_LENGTH:Number = 100;
		private const MAX_CARDS_OFFSET:Number = 20;
		private const MOUSE_OVER_MODE_OFFSET:Number = 50;
		
		private const CARDS_SHIFT_SPEED:Number = .4;
		
		public function PlayerCardsController(playerGameInfo:PlayerGameInfo, hcPoint:Point,
																						tcPoint:Point, rightOrientation:Boolean = true) {
			super();
			_stage = LayersManager.getInstance().getLayer(LayersManager.CARDS);
			handCardsPoint = hcPoint;
			tableCardsPoint = tcPoint;
			addContainers();
			_playerGameInfo = playerGameInfo;
			_currentCardsShiftOffset = MAX_CARDS_OFFSET;
			_orientationCoefficient = rightOrientation ? 1 : -1;
			addListeners();
		}
		
		private function addContainers():void {
			_handContainer = new Sprite();
			_handContainer.x = handCardsPoint.x;
			_handContainer.y = handCardsPoint.y;
			_stage.addChild(_handContainer);
			_tableContainer = new Sprite();
			_tableContainer.x = tableCardsPoint.x;
			_tableContainer.y = tableCardsPoint.y;
			_stage.addChild(_tableContainer);
		}
		
		private function getContainer(type:uint):Sprite {
			return (type == Card.HAND) ? _handContainer : _tableContainer;
		}
		
		private function addListeners():void {
			_playerGameInfo.addEventListener(CardEvent.CARDS_UPDATE, updateCardsHandler);
			_playerGameInfo.addEventListener(CardEvent.OPEN_CARD_ON_TABLE, openCardOnTableHandler);
			_handContainer.addEventListener(MouseEvent.ROLL_OVER, rollOverHandHandler);
			_handContainer.addEventListener(MouseEvent.ROLL_OUT, rollOutHandHandler);
			_tableContainer.addEventListener(MouseEvent.ROLL_OVER, rollOverTableHandler);
			_tableContainer.addEventListener(MouseEvent.ROLL_OUT, rollOutTableHandler);
		}
		
		private function updateCardsHandler(event:CardEvent):void {
			for each (var cardInfo:Card in _playerGameInfo.cards) {
				if (!existsCard(cardInfo.id)) { addCard(cardInfo); }
			}
			for each (var card:CardViewController in _cards) {
				if (!_playerGameInfo.existsCard(card.id)) {
					removeCard(card);
				}
			}
		}
		
		private function openCardOnTableHandler(event:CardEvent):void {
			updateCardsParents();
			updateCardsPosition();
		}
		
		private function addCard(card:Card):void {
			var cardController:CardViewController = new CardViewController(card.id);
			if (!_cards) { _cards = new Vector.<CardViewController>(); }
			setCardPos(cardController, card.playingType);
			_cards.push(cardController);
			addCardViewListenersFor(cardController);
			getContainer(card.playingType).addChild(cardController.cardView);
			updateCardsPosition();
		}
		private function findCard(card:Card):CardViewController {
			for (var i:int = 0; i < _cards.length; ++i ) {
				if (_cards[i].id == card.id) {
					return _cards[i];
					break;
				}
			}
			return null;
		}
		private function removeCard(card:CardViewController):void {
			if (!card) { return; }
			
			if (_handContainer.contains(card.cardView)) {
				_handContainer.removeChild(card.cardView);
			}else if (_tableContainer.contains(card.cardView)){
				_tableContainer.removeChild(card.cardView);
			}
			removeCardViewListenersFor(card);
			card.remove();
			_cards.splice(_cards.indexOf(card), 1);
			updateCardsPosition();
		}
		
		private function setCardPos(card:CardViewController, cardType:uint):void {
			var _cardsShiftOffset:Number = CARDS_CONTEINER_LENGTH / (getConcreteCards(cardType).length );
			card.cardView.x = _cardsShiftOffset * _cards.length * _orientationCoefficient;
		}
		
		private function updateCardsParents():void {
			for each (var card:CardViewController in _cards) {
				if (!getContainer(_playerGameInfo.getCard(card.id).playingType).contains(card.cardView)) {
					if (_handContainer.contains(card.cardView)) { _handContainer.removeChild(card.cardView);
					}else if (_tableContainer.contains(card.cardView)) { _tableContainer.removeChild(card.cardView); }
					getContainer(_playerGameInfo.getCard(card.id).playingType).addChild(card.cardView);
				}
			}
		}
		
		private function updateCardsPosition():void {
			updateCardsPositionFor(Card.TABLE);
			updateCardsPositionFor(Card.HAND);
		}
		
		private function tweenCardsWith(concreteCards:Vector.<CardViewController>, 
																		cardsType:uint, offsetY:Number):void{
			var onCompleteFunction:Function = (offsetY == MOUSE_OVER_MODE_OFFSET) ?
				addHighlightListenersForCards : null;
			for (var i:int = 0; i < concreteCards.length; ++i ) {
				TweenMax.to(concreteCards[i].cardView, CARDS_SHIFT_SPEED,
					{x: offsetY * i * _orientationCoefficient,
						ease: Cubic.easeOut,
						onComplete: onCompleteFunction, onCompleteParams: [cardsType]});
			}
		}
		
		private function updateCardsPositionFor(cardsType:uint, cardsOffset:Number = 0):void {
			var concreteCards:Vector.<CardViewController> = getConcreteCards(cardsType);
			var cardsShiftOffset:Number;
			if (cardsOffset != 0) {
				cardsShiftOffset = cardsOffset;
			}else {
				cardsShiftOffset = CARDS_CONTEINER_LENGTH / concreteCards.length;
				if (cardsShiftOffset > MAX_CARDS_OFFSET) { cardsShiftOffset = MAX_CARDS_OFFSET; }
			}
			tweenCardsWith(concreteCards, cardsType, cardsShiftOffset);
		}
		
		private function getConcreteCards(cardsType:uint):Vector.<CardViewController>{
			var result:Vector.<CardViewController> = new Vector.<CardViewController>();
			for each (var cardController:CardViewController in _cards) {
				if (_playerGameInfo.getCard(cardController.id).playingType == cardsType) {
					result.push(cardController);
				}
			}
			return result;
		}
		
		private function existsCard(cardId:int):Boolean {
			for each (var card:CardViewController in _cards) {
				if (card.id == cardId) { return true; }
			}
			return false;
		}
		
		//cards listeners and handlers
		private function addHighlightListenersForCards(cardsType:uint):void {
			for each (var cardController:CardViewController in getConcreteCards(cardsType)) {
				cardController.addHighlightListeners();
			}
		}
		private function removeHighlightListenersForCards(cardsType:uint):void {
			for each (var cardController:CardViewController in getConcreteCards(cardsType)) {
				cardController.removeHighlightListeners();
			}
		}
		
		private function addCardViewListenersFor(card:CardViewController):void {
			card.addEventListener(CardViewEvent.CLICK, cardClickHandler);
		}
		private function removeCardViewListenersFor(card:CardViewController):void {
			card.removeEventListener(CardViewEvent.CLICK, cardClickHandler);
		}
		
		private function rollOverHandHandler(event:MouseEvent):void {
			updateCardsPositionFor(Card.HAND, MOUSE_OVER_MODE_OFFSET);
		}
		private function rollOutHandHandler(event:MouseEvent):void {
			updateCardsPositionFor(Card.HAND);
			removeHighlightListenersForCards(Card.HAND);
		}
		private function rollOverTableHandler(event:MouseEvent):void {
			updateCardsPositionFor(Card.TABLE, MOUSE_OVER_MODE_OFFSET);
		}
		private function rollOutTableHandler(event:MouseEvent):void {
			updateCardsPositionFor(Card.TABLE);
			removeHighlightListenersForCards(Card.TABLE);
		}
		
		private function cardClickHandler(event:CardViewEvent):void {
			dispatchEvent(new CardViewEvent(CardViewEvent.CLICK, event.cardId));
		}
		
		public function removeCards():void {
			if (_stage.contains(_handContainer)) { _stage.removeChild(_handContainer); }
			if (_stage.contains(_tableContainer)) { _stage.removeChild(_tableContainer); }
		}
		
	}
}