package ifaceBaseComponents {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import com.greensock.TweenMax;
	/**
	 * ...
	 * @author Chip
	 */
	public class BaseArrowBtn extends BaseBtn {
		private var _orientation:String;
		private var baseX:Number;
		private var offsetX:Number;
		
		public static const LEFT:String = "left";
		public static const RIGHT:String = "right";
		
		public function BaseArrowBtn(view:MovieClip, orientation:String) {
			super(view);
			_orientation = orientation;
			baseX = view.x;
			scaleOffset = .1;
			offsetX = (orientation == LEFT) ? -2 : 2;
		}
		
		protected function shiftTo():void {
			TweenMax.to(view, animationSpeed, { x: view.x + offsetX } );
		}
		
		override protected function mouseOverHandler(event:MouseEvent):void {
			super.mouseOverHandler(event);
			shiftTo();
		}
		
		override protected function unshift():void {
			super.unshift();
			TweenMax.to(view, animationSpeed, { x: baseX} );
		}
		
	}

}