package abilityes {
	import Controllers.ViewController;
	import graphic.AbilityView;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class AbilityViewForPlayerDetails extends ViewController{
		private var _ability:Ability;
		private var _numAbility:uint;
		
		private const VIEW_X:Number = 10;
		private const VIEW_START_Y:Number = 10;
		private const VIEW_HEIGHT:Number = 25;
		
		public function AbilityViewForPlayerDetails(ability:Ability, numAbility:uint):void {
			super(new AbilityView());
			_ability = ability;
			_numAbility = numAbility;
			setAbilityPlace();
		}
		
		private function setAbilityPlace():void {
			view.x = VIEW_X;
			view.y = VIEW_START_Y + _numAbility * VIEW_HEIGHT;
		}
		
	}
}