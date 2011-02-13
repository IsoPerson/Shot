package managers {
	import flash.display.Sprite;
	import gameLayers.Layer;
	import managers.IManager;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class LayersManager implements IManager {
		private static var _layersContainer:Sprite = new Sprite;
		private static var _layersList:Vector.<Layer> = new Vector.<Layer>;
		
		public static const BASE:String = "baseLayer";
		public static const PLAYERS:String = "playersLayer";
		public static const CARDS:String = "cardsLayer";
		public static const MESSAGES:String = "messagesLayer";
		public static const WINDOWS:String = "windowsLayer";

		public function LayersManager() {
		}
		
		public static function getLayer(name:String):Layer {
			for each (var item:Layer in _layersList) {
				if (item.name == name) return item;
			}
			return null;
		}

		private static function registerLayers(layer:Sprite):void {
			addLayer(new Layer(BASE));
			addLayer(new Layer(PLAYERS));
			addLayer(new Layer(CARDS));
			addLayer(new Layer(MESSAGES));
			addLayer(new Layer(WINDOWS));
		}
		
		private static function addLayer(layer:Layer):void {
			_layersList.push(layer);
			_layersContainer.addChild(layer);
		}

	}
}