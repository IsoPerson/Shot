package inGameRoom.player {
	import abilityes.Ability;
	import Events.CardEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import graphic.AbilityInfoView;
	import cards.Card;
	/**
	 * ...
	 * @author Chip
	 */
	public class PlayerGameInfo extends EventDispatcher{
		private var _role:uint;
		private var _radius:uint;
		private var _isCreator:Boolean;
		private var _alive:Boolean;
		private var _hp:int;
		
		private var _abilityList:Vector.<Ability>;
		//[Bindable(event="privateCardsUpdate")]
		private var _cards:Vector.<Card>;
		
		public static const PRIVATE_CARDS_UPDATE:String = "privateCardsUpdate";
		public static const OPEN_CARDS_UPDATE:String = "openCardsUpdate";
		
		public function PlayerGameInfo(role:uint, isCreator:Boolean) {
			super();
			_role = role;
			_hp = (role == 0) ? 4 : 5;
			_isCreator = isCreator;
		}
		
		public function set role(value:uint):void {
			_role = role;
		}
		public function set radius(value:uint):void {
			_radius = value;
		}
		public function set isCreator(value:Boolean):void {
			_isCreator = value;
		}
		public function set alive(value:Boolean):void {
			_alive = value;
		}
		public function set hp(value:int):void {
			_hp = value;
		}
		
		//public function set cards(value)
		/*
		public function set privateCards(value:Vector.<Card>):void {
			_privateCards = value;
		}
		public function set openCards(value:Vector.<Card>):void {
			_openCards = value;
		}
		*/
		public function set abilityList(value:Vector.<Ability>):void {
			_abilityList = value;
		}
		
		public function get role():uint {
			return _role;
		}
		public function get radius():uint {
			return _radius;
		}
		public function get isCreator():Boolean {
			return _isCreator;
		}
		public function get alive():Boolean {
			return _alive;
		}
		public function get hp():int {
			return _hp;
		}
		public function get cards():Vector.<Card> {
			return _cards;
		}
		public function get abilityList():Vector.<Ability> {
			return _abilityList;
		}
		
		public function addCard(value:Card):void {
			if (!_cards) { _cards = new Vector.<Card>(); }
			_cards.push(value);
			addCardListeners(value);
			dispatchEvent(new CardEvent(CardEvent.CARDS_UPDATE));
		}
		public function getCard(id:int):Card {
			for each (var card:Card in _cards) {
				if (card.id == id) { return card; }
			}
			return null;
		}
		
		public function existsCard(cardId:int):Boolean {
			for each (var card:Card in _cards) {
				if (card.id == cardId) { return true; }
			}
			return false;
		}
		
		public function removeCards():void {
			while (_cards.length > 0) {
				removeCardListeners(_cards.shift());
				dispatchEvent(new CardEvent(CardEvent.CARDS_UPDATE));
			}
		}
		
		private function addCardListeners(card:Card):void {
			card.addEventListener(CardEvent.OPEN_CARD_ON_TABLE, openOnTableHandler);
		}
		private function removeCardListeners(card:cards.Card):void {
			card.removeEventListener(CardEvent.OPEN_CARD_ON_TABLE, openOnTableHandler);
		}
		
		private function openOnTableHandler(event:CardEvent):void {
			dispatchEvent(new CardEvent(CardEvent.OPEN_CARD_ON_TABLE));
		}
	}
}