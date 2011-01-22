package  {
	/**
	 * ...
	 * @author Chip
	 */
	public class Card {
		private var _id:int;
		private var _type:int;
		private var _cardFunction:int;
		private var _suit:int;
		private var _value:int;
		private var _radius:int;
		
		
		//TODO: возможно стоит сделать отдельный класс для каждой карты
		public function Card(id:int, type:int, cardFunction:int, suit:int, value:int, radius:int) {
			_id = id;
			_type = type;
			_cardFunction = cardFunction;
			_suit = suit;
			_value = value;
			_radius = radius;
		}
		
		public function get id():int {
			return _id;
		}
		
		public function get type():int {
			return _type;
		}
				
	}
}