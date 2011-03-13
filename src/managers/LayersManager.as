package managers {
	import flash.display.Sprite;
	import gameLayers.Layer;
	import managers.IManager;
	
	/**
	 * ...
	 * @author Chip
	 */
	public class LayersManager implements IManager {
		private static var _instance:LayersManager;
		private var _layersContainer:Sprite = new Sprite;
		private var _layersList:Vector.<Layer> = new Vector.<Layer>;
		
		public static const BASE:String = "baseLayer";
		public static const ROOMS:String = "roomsLayer";
		public static const PLAYERS:String = "playersLayer";
		public static const CARDS:String = "cardsLayer";
		public static const MESSAGES:String = "messagesLayer";
		public static const WINDOWS:String = "windowsLayer";
		public static const TOOLTIP:String = "tooltipLayer";

		public function LayersManager() {
		}
		
		public static function getInstance():LayersManager {
			if (!_instance) { _instance = new LayersManager; }
			return _instance;
		}
		
		public function getLayer(layerName:String):Layer {
			for each (var item:Layer in _layersList) {
				if (item.layerName == layerName) return item;
			}
			return null;
		}
		
		public function set layersContainer(value:Sprite):void {
			_layersContainer = value;
		}

		public function registerLayers():void {
			addLayer(new Layer(BASE));
			addLayer(new Layer(ROOMS));
			addLayer(new Layer(PLAYERS));
			addLayer(new Layer(CARDS));
			addLayer(new Layer(MESSAGES));
			addLayer(new Layer(WINDOWS));
			addLayer(new Layer(TOOLTIP));
		}
		
		private function addLayer(layer:Layer):void {
			_layersList.push(layer);
			if (_layersContainer){
				_layersContainer.addChild(layer);
			}
		}

	}
}