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
		public function Card() {
			
		}
		
		public function get id():int {
			return _id;
		}
		
		public function get type():int {
			return _type;
		}
		
		
	}
}