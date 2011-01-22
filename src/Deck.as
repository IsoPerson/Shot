package  {
	/**
	 * ...
	 * @author Chip
	 */
	public class Deck implements IDeck{
		private var _enabled:Boolean = false;
		
		private var allCards:Vector.<Card>;
		private var mainPack:Vector.<Card>;
		private var releasePack:Vector.<Card>;
		
		public function Deck():void {
			super();
			init();
		}
		
		public function init():void {
			_enabled = true;
		}
		
		public function get enabled():Boolean {
			return _enabled;
		}
		
		public function emptyMainPack():Boolean {
			return !(mainPack && (mainPack.length > 0));
		}
		
		public function getCard():Card {
			if (mainPack.length > 0) {
				return mainPack.pop();
			}
			return null;
		}
		
		public function resetMainPack():void {
			composeMainPackFromRelease();
			shuffleMainPack();
		}
		
		public function get topCard():Card {
			return mainPack[mainPack.length - 1];
		}
		
		
		private function composeMainPackFromRelease():void {
			if (releasePack){
				for each (var card:Card in releasePack) {
					mainPack.push(card);
				}
			}
		}
		
		private function shuffleMainPack():void {
			if (mainPack){
				mainPack =	mainPack.map(
											function(el:Card, index:int, vect:Vector.<Card>):Card {
												return vect[int(Math.random() * vect.length)];
											}
										);
			}
		}
		
	}

}