package  {
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	
	public class FirstStageController extends MovieClip {
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var firstStage:FirstStage;
		private var sentenceOne:SentenceOne;
		private var sentenceTwo:SentenceTwo;
		private var sentenceThree:SentenceThree;
		private var sentenceFour:SentenceFour;
		private var timerC:TimerClass;
		private var qula:int;
		
		public function FirstStageController()
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
			timerC = new TimerClass();
			sentenceOne = new SentenceOne(_stageWidth, _stageHeight );
			sentenceTwo = new SentenceTwo(_stageWidth, _stageHeight);
			sentenceThree = new SentenceThree(_stageWidth, _stageHeight);
			sentenceFour = new SentenceFour(_stageWidth, _stageHeight);
			firstStage = new FirstStage(_stageWidth, _stageHeight );
			addChild(firstStage);
			firstStage.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
			sentenceOne.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
			sentenceTwo.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
			sentenceThree.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
			sentenceFour.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
		}
		
		private function beforeStage(ev:DataEvent):void
		{
			if (ev.data == "movrchi")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "ButtonVisibleTrue"));
				addChild(timerC);
				timerC.x = _stageWidth - timerC.width;
				timerC.y =  timerC.height;
				addChild(sentenceOne);
			}
			
			if (ev.data == "movrchi1")
			{
				addChild(sentenceTwo);
			}
			
			if (ev.data == "movrchi2")
			{
				addChild(sentenceThree);
			}
			
			if (ev.data == "movrchi3")
			{
				addChild(sentenceFour);
			}	
			
			if (ev.data == "endOfScene")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "ButtonVisibleFalse"));
				qula = timerC.returnQula();
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString() ));
				removeChild(timerC);
			}
		}
		
		
		
		
		
	}
	
}
