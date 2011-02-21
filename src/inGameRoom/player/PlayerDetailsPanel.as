package inGameRoom.player {
	import abilityes.AbilityViewForPlayerDetails;
	import Controllers.ViewController;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class PlayerDetailsPanel extends ViewController{
		
		public function PlayerDetailsPanel(view:MovieClip) {
			super(view);
		}
		
		public function addAbility(ability:AbilityViewForPlayerDetails):void {
			view.addChild(ability.view);
		}
		
	}

}