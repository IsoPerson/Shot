package abilityes {
	import Controllers.ViewController;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import graphic.AbilityView;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class AbilityInShop extends ViewController {
		private var _pushedFilter:MovieClip;
		private var _priceTxt:TextField;
		private var _labelTxt:TextField;
		private var _vipIco:MovieClip;
		
		private var _isVip:Boolean;
		
		public function AbilityInShop(x:int, y:int, isVip:Boolean) {
			super(new AbilityView());
			view.x = x;
			view.y = y;
			view.mouseChildren = false;
			_isVip = isVip;
			initObjects();
			setObjectsMode();
			addListeners();
		}
		
		public function setPrice(priceText:String):void {
			_priceTxt.text = priceText;
		}
		public function setAbilityName(abilityName:String):void {
			_labelTxt.text = abilityName;
		}
		
		private function initObjects():void {
			_pushedFilter = getMovieClip("pushedFilter");
			_vipIco = getMovieClip("vipIco");
			_priceTxt = getTextField("priceTxt");
			_labelTxt = getTextField("labelTxt");
		}
		
		private function setObjectsMode():void {
			_pushedFilter.visible = false;
			_priceTxt.selectable = false;
			_labelTxt.selectable = false;
			if (!_isVip) { _vipIco.visible = false; }
		}
		
		private function addListeners():void {
		}
		
		
		
	}
}