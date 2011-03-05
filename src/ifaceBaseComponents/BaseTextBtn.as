package ifaceBaseComponents {
	import flash.display.MovieClip;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Chip
	 */
	public class BaseTextBtn extends BaseBtn {
		private var _txt:TextField;
		
		public function BaseTextBtn(view:MovieClip, label:String) {
			super(view);
			getTextField("txt").text = label;
		}
		
	}

}