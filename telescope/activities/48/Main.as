package  {
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	
	public class Main extends MovieClip {
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var zgarbi:Zgarbi_Class;
		private var fazebi:Fazebi;
		
		private var qula:int;
		
		public function Main() 
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
			zgarbi = new Zgarbi_Class(_stageWidth, _stageHeight );
			fazebi = new Fazebi(_stageWidth, _stageHeight);
			addChild(zgarbi);
			
			zgarbi.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
			fazebi.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
		}
		
		private function beforeStage(ev:DataEvent):void
		{
			if (ev.data == "movrchi")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleTrue"));
			
				
				addChild(fazebi);
			}
			
			if (ev.data == "endOfScene")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleFalse"));
			
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"  ));
				
				
			}
			
			
		}
	
	
	}
	
}
