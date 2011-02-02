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
			(window.type == Window.INFO) ? windowQueue.push(window) : windowQueue.unshift(window);
		}
		
	}

}