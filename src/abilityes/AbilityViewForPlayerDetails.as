package abilityes {
	import Controllers.ViewController;
	import graphic.AbilityView;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class AbilityViewForPlayerDetails extends ViewController{
		private var _nAbility:int;
		
		private const VIEW_X:Number = 10;
		private const VIEW_START_Y:Number = 10;
		private const VIEW_HEIGHT:Number = 25;
		
		public function AbilityViewForPlayerDetails(nAbility:int):void {
			super(new AbilityView());
			_nAbility = nAbility;
			setAbilityPlace();
		}
		
		private function setAbilityPlace():void {
			view.x = VIEW_X;
			view.y = VIEW_START_Y + _nAbility * VIEW_HEIGHT;
		}
		
	}
}