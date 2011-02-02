package window {
	/**
	 * ...
	 * @author Chip
	 */
	public class Window implements IWindow{
		public static const INFO:uint = 0;
		public static const INTERACTIVE:uint = 1;
		
		private var _type:uint;
		private var _priority:uint;
		
		public function Window() {
			super();
		}
		
		public function type():uint {
			return _type;
		}
		
		public function priority():uint {
			return _priority;
		}
		
	}

}