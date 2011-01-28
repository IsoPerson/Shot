package Server {
	/**
	 * ...
	 * @author Chip
	 */
	public class AbilityPrice{
		private var _ability:String; //в дальнейшем класс Ability
		private var _price:int;
		
		public function AbilityPrice(abilityName:String, price:int) {
			_ability = abilityName;
			_price = price;
		}
		
		public function get ability():String {
			return _ability;
		}
		public function get price():int {
			return _price;
		}
		
		public function set ability(value:String):void {
			_ability = value;
		}
		public function set price(value:int):void {
			_price = price;
		}
		
	}

}