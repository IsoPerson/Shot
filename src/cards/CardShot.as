package cards {
import inGameRoom.player.PlayerInfo;

public class CardShot extends Card {
	public function CardShot(id:int){
		super(id);
		playingType = Card.ACTIVE;
		cardFunction = Card.SHOT;
	}
	
	override public function play(player:PlayerInfo = null):void{
	}
	
}
}