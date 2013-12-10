package  {
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	
	public class FifthStageController extends MovieClip {
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var fifthStage:FifthStage;
		private var mexuteEtapiText:MexuteEtapiText;
		private var cardRotation:CardsRotation;
		private var timerC:TimerClass;
		private var qula:int;
		
		
		public function FifthStageController() 
		{
		
			addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		
		private function init(ev:Event):void
		{
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			removeEventListener(Event.ADDED_TO_STAGE, init)
			callGames();
		}
		
		private function callGames():void
		{
			_stageHeight = stage.stageHeight;
			_stageWidth = stage.stageWidth;
			fifthStage = new FifthStage(_stageWidth, _stageHeight );
			addChild(fifthStage);
			cardRotation = new CardsRotation(_stageWidth, _stageHeight);
			fifthStage.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
			//mexuteEtapiText = new MexuteEtapiText(_stageWidth, _stageHeight);
			//mexuteEtapiText.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
			cardRotation.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
		}
		
		
		private function beforeStage(ev:DataEvent):void
		{
			if (ev.data == "movrchi")
			{
				
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleTrue"));
				timerC = new TimerClass();
				addChild(timerC);
				timerC.x = _stageWidth - timerC.width;
				timerC.y =  timerC.height;
				addChild(cardRotation);
			}	
			
			
			if (ev.data == "endOfScene")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleFalse"));	
				qula = timerC.returnQula();
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString() ));
				removeChild(timerC);
			}
		}
		
		
		
		
		
	}
	
}
