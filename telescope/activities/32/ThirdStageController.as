package  {
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	
	public class ThirdStageController extends MovieClip {
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var thirdStage:ThirdStage;
		private var tanavarskvlavedi:Tanavarskvlavedi;
		
		private var qula:int;
		
		public function ThirdStageController() 
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
			thirdStage = new ThirdStage(_stageWidth, _stageHeight );
			tanavarskvlavedi = new Tanavarskvlavedi(_stageWidth, _stageHeight);
			addChild(thirdStage);
			
			thirdStage.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
			tanavarskvlavedi.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
		}
		
		private function beforeStage(ev:DataEvent):void
		{
			if (ev.data == "movrchi")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleTrue"));
			
				addChild(tanavarskvlavedi);
			}
			
			if (ev.data == "endOfScene")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleFalse"));
				
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + "5" ));
	
			}

		}
	
	}
	
}
