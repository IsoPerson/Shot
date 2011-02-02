package window {
	/**
	 * ...
	 * @author Chip
	 */
	public class Window implements IWindow{
		public static const INFO:uint = 0;
		public static const INTERACTIVE:uint = 0;
		
		private var _type:uint;
		
		public function Window() {
			super();
		}
		
		public function type():uint {
			return _type;
		}
		
	}

}