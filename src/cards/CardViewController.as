package cards {
	import Controllers.ViewController;
	
	import Events.CardViewEvent;
	
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import graphic.CardSmallView;

	/**
	 * ...
	 * @author Chip
	 */
	public class CardViewController extends ViewController{
		private var _id:int;
		private var _openCard:Boolean;
		private var _position:Point;
		
		private var closedCard:MovieClip;
		
		private const UPDOWN_SPEED:Number = .2;
		private const SHOW_ANIMATION_SPEED:Number = 1;
		private const OFFSET_Y:Number = 5;
		
		public function CardViewController(id:int, openCard:Boolean = true, viewType:String = Card.SMALL_VIEW_TYPE):void {
			super(new CardSmallView());
			view.scaleX = .38;
			view.scaleY = .38;
			view.buttonMode = true;
			_id = id;
			_openCard = openCard;
			setCard();
			addListeners();
		}
		
		public function get id():int {
			return _id;
		}
		
		public function setPosition(point:Point):void {
			closedCard.x = point.x;
			closedCard.y = point.x;
			view.x = point.x;
			view.y = point.y;
		}
		
		public function open(cardsStage:DisplayObjectContainer):void {
			if (!_openCard){
				cardsStage.removeChild(cardView);
				_openCard = true;
				sinhronizeCoordinates();
				cardsStage.addChild(cardView);
			}
		}
		public function close(cardsStage:DisplayObjectContainer):void {
			if (_openCard) {
				cardsStage.removeChild(cardView);
				_openCard = false;
				sinhronizeCoordinates();
				cardsStage.addChild(cardView);
			}
		}
		
		public function get cardView():MovieClip {
			return (_openCard) ? view : closedCard;
		}
		
		private function animateCardShow():void{
			view.alpha = 0;
			TweenMax.to(view, SHOW_ANIMATION_SPEED, {alpha:1});
		}
		
		private function addListeners():void {
			view.addEventListener(MouseEvent.CLICK, clickHandler);
			view.addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
		}
		public function addHighlightListeners():void {
			view.addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
			view.addEventListener(MouseEvent.ROLL_OUT, mouseOutHandler);
		}
		private function removeListeners():void {
			view.removeEventListener(MouseEvent.CLICK, clickHandler);
		}
		public function removeHighlightListeners():void {
			view.removeEventListener(MouseEvent.ROLL_OUT, mouseOutHandler);
			view.removeEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
		}
		
		private function addToStageHandler(event:Event):void{
			animateCardShow();
		}
		
		private function clickHandler(event:MouseEvent):void {
			dispatchEvent(new CardViewEvent(CardViewEvent.CLICK, _id));
		}
		
		private function mouseOverHandler(event:MouseEvent):void {
			TweenMax.to(view, UPDOWN_SPEED, { alpha: .6 } );
		}
		private function mouseOutHandler(event:MouseEvent):void {
			TweenMax.to(view, UPDOWN_SPEED, { alpha: 1 } );
		}
		
		private function setCard():void {
			view.gotoAndStop(_id);
		}
		
		private function sinhronizeCoordinates():void {
			if (_openCard) {
				closedCard.x = view.x;
				closedCard.y = view.y;
			}else {
				view.x = closedCard.x;
				view.y = closedCard.y;
			}
		}
		
		public function remove():void {
			removeListeners();
		}

	}
}