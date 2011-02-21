package inGameRoom.player {
	import abilityes.Ability;
	import graphic.AbilityInfoView;
	/**
	 * ...
	 * @author Chip
	 */
	public class PlayerGameInfo {
		private var _role:uint;
		private var _radius:uint;
		private var _isCreator:Boolean;
		private var _alive:Boolean;
		private var _hp:int;
		
		private var _abilityList:Vector.<Ability>;
		private var _privateCards:Vector.<Card>;
		private var _openCards:Vector.<Card>;
		
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
		public function set privateCards(value:Vector.<Card>):void {
			_privateCards = value;
		}
		public function set openCards(value:Vector.<Card>):void {
			_openCards = value;
		}
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
		public function get privateCards():Vector.<Card> {
			return _privateCards;
		}
		public function get openCards():Vector.<Card> {
			return _openCards;
		}
		public function get abilityList():Vector.<Ability> {
			return _abilityList;
		}
		
	}
}