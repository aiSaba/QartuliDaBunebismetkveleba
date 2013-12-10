package  {
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	
	
	public class ThirdStageController extends MovieClip 
	{
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var thirdStage:ThirdStage;
		//private var tanavarskvlavedi:Tanavarskvlavedi;
		private var qula:int;
		public static var _stage:*;
		
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
			_stage = stage;
			_stageHeight = stage.stageHeight;
			_stageWidth = stage.stageWidth;
			thirdStage = new ThirdStage(_stageWidth, _stageHeight );
			addChild(thirdStage)
			all.height = _stageHeight / 1.1;
			all.scaleX = all.scaleY;
			
			all.x = (_stageWidth -all.width)/2;
			all.y = (_stageHeight-all.height) / 2;
			
			all.visible = false;
			thirdStage.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
			all.next.addEventListener(MouseEvent.MOUSE_DOWN, nextFunc);
		//	tanavarskvlavedi.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
		}
		
		private function nextFunc(e:MouseEvent):void 
		{
			all.visible = false;
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleFalse"));
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + "5" ));
		}
		
		private function beforeStage(ev:DataEvent):void
		{
			if (ev.data == "movrchi")
			{
				var draw:Draw = new Draw(all);
				addChild(draw)
				all.visible = true;
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleTrue"));
			}
			
		}
	}
}
