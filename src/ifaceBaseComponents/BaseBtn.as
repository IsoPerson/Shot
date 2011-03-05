package ifaceBaseComponents {
	import Controllers.ViewController;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	
	import com.greensock.TweenMax;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class BaseBtn extends ViewController{		
		private var baseScale:Number;
		
		private var scaleOffset:Number = .06;
		private var animationSpeed:Number = .4;
		
		public function BaseBtn(view:MovieClip) {
			super(view);
			view.buttonMode = true;
			view.mouseChildren = false;
			baseScale = view.scaleY;
			
			addListeners();
		}
		
		private function addListeners():void {
			view.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			view.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
		}
		
		private function scaleTo():void {
			TweenMax.to(view, animationSpeed, { scaleX: baseScale + scaleOffset, scaleY: baseScale + scaleOffset } );
		}
		
		private function unshift():void {
			TweenMax.to(view, animationSpeed, { scaleX: baseScale, scaleY: baseScale } );
		}
		
		private function mouseOverHandler(event:MouseEvent):void {
			scaleTo();
		}
		private function mouseOutHandler(event:MouseEvent):void {
			unshift();
		}
		
	}
}