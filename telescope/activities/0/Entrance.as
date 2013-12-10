package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	import flash.events.DataEvent;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	
	public class Entrance extends MovieClip {
		
		
		private var mainMov:MovieClip
		
		public function Entrance() 
		{
			
			addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true)	
		}
		
		private function init (ev:Event):void
		{
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			mainMov = main_mc;
			
			mainMov.stop();
			mainMov.height = stage.stageHeight / 1.1;
			mainMov.scaleX = mainMov.scaleY;
			mainMov.play();
			setTimeout(end,4000)
		}

		private function end():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"));
			
		}
		
		
	}
	
}
