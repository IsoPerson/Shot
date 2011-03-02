package cards {
	/**
	 * ...
	 * @author Chip
	 */
	public class CardViewController {
		private var img_normal_path:String;
		private var img_big_path:String;
		
		public function CardView(id:int) {
			img_normal_path = ServerPaths.SERVER_URL + ServerPaths.IMG_NORMAL_SIZE_PATH + (id + 1).toString() + ServerPaths.IMG_NORMAL_ENDING;
			img_path_big = ServerPaths.SERVER_URL + ServerPaths.IMG_BIG_SIZE_PATH + (id+1).toString() + ServerPaths.IMG_BIG_ENDING;
		}
		
	}

}