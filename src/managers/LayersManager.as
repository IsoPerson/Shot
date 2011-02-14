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
		public static const ROOMS:String = "roomsLayer";
		public static const PLAYERS:String = "playersLayer";
		public static const CARDS:String = "cardsLayer";
		public static const MESSAGES:String = "messagesLayer";
		public static const WINDOWS:String = "windowsLayer";

		public function LayersManager() {
		}
		
		public static function getLayer(layerName:String):Layer {
			for each (var item:Layer in _layersList) {
				if (item.layerName == layerName) return item;
			}
			return null;
		}
		
		public static function set layersContainer(value:Sprite):void {
			_layersContainer = value;
		}

		public static function registerLayers():void {
			addLayer(new Layer(BASE));
			addLayer(new Layer(ROOMS));
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