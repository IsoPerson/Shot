package inGameRoom.player {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Chip
	 */
	public class PlayerCoordinates extends EventDispatcher{
		public var crd_openCards:Point;
		public var crd_privateCards:Point;
		public var crd_ava:Point;
		public var crd_sheriff:Point;
		
		public function PlayerCoordinates() {
			super();
		}
		
		public function set_crds(position:uint):void
		{
			switch (position)
			{
				case 0: 
							crd_openCards = new Point(290, 370);
							crd_privateCards = new Point(127, 516);
							crd_ava = new Point(296, 453);
							break;
				case 1: 
							crd_openCards = new Point(220, 325);
							crd_privateCards = new Point(31, 291);
							crd_ava = new Point(135, 351);
							break;
				case 2: 
							crd_openCards = new Point(209, 226);
							crd_privateCards = new Point(31, 214);
							crd_ava = new Point(166, 131);
							break;
				case 3: 
							crd_openCards = new Point(321, 172);
							crd_privateCards = new Point(195, 41);
							crd_ava = new Point(359, 67);
							break;
				case 4: 
							crd_openCards = new Point(470, 212);
							crd_privateCards = new Point(620, 198);
							crd_ava = new Point(569, 111);
							break;
				case 5: 
							crd_openCards = new Point(502, 323);
							crd_privateCards = new Point(585, 430);
							crd_ava = new Point(647, 322);
							break;
				case 6: 
							crd_openCards = new Point(444, 404);
							crd_privateCards = new Point(565, 530);
							crd_ava = new Point(468, 455);
							break;
			}
			crd_sheriff = new Point(crd_ava.x, crd_ava.y);
			dispatchEvent(new Event(Event.CHANGE));
		}
		
	}
}