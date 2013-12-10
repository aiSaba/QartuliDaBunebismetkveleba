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
		private var stage_44:Stage_44;
		
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
			stage_44 = new Stage_44(_stageWidth, _stageHeight);
			addChild(zgarbi);
			
			zgarbi.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
			stage_44.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
		}
		
		private function beforeStage(ev:DataEvent):void
		{
			if (ev.data == "movrchi")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleTrue"));
				
				
				addChild(stage_44);
			}
			
			if (ev.data == "endOfScene")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleFalse"));
				
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame" ));
				
				
			}
			
			
		}
		
	
	}
	
}
