package Events {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class VkFriendsEvent extends Event{
		
		public function VkFriendsEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
		
	}

}