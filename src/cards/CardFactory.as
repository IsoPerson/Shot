package cards {

[Factory]
public final class CardFactory {
	public function CardFactory(){}
	
	public function createShotCard(id:int, suit:int, numberValue:int):Card{
		var result:Card = new CardShot(id);
		setBaseParameters(result, numberValue, suit);
		result.state = Card.HAND;
		return result;
	}
	
	public function createRadiusGunCard(id:int, suit:int, numberValue:int):Card{
		var result:Card = new CardSchofield(id);
		setBaseParameters(result, numberValue, suit);
		return result;
	}
	
	private function setBaseParameters(card:Card, numberValue:int, suit:int):void{
		card.numberValue = numberValue;
		card.suit = numberValue;
	}
	
}
}