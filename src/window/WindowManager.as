package window {
	/**
	 * ...
	 * @author Chip
	 */
	public class WindowManager{
		private var windowQueue:Vector.<IWindow>;
		
		public function WindowManager() {
			super();
		}
		
		public function addWindow(window:IWindow):void {
			for (var i:int = 0; i < windowQueue.length; ++i) {
				if (windowQueue[i].priority > window.priority) {
					windowQueue.splice(i, 0, window);
				}
			}
		}
		
	}

}