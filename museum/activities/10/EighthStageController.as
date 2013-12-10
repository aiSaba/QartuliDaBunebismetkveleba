package
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.DataEvent;
	import flash.net.URLRequest;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class EighthStageController extends MovieClip
	{
		private var merveEtapiStart:MerveEtapiStart;
		private var merveEtapiClass:MerveEtapiClass;
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		private var timerC:TimerClass;
		private var qula:int;
		
		public function EighthStageController()
		{
			
			addEventListener(Event.ADDED_TO_STAGE, initHandler)
		}
		
		private function initHandler(e:Event):void
		{
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			removeEventListener(Event.ADDED_TO_STAGE, initHandler);
			initMain();
		}
		
		private function initMain():void
		{
			_stageHeight = stage.stageHeight;
			_stageWidth = stage.stageWidth;
			
			merveEtapiStart = new MerveEtapiStart(_stageWidth, _stageHeight);
			addChild(merveEtapiStart);
			dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "ButtonVisibleFalse"));
			merveEtapiStart.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
		
		}
		
		private function beforeStage(ev:DataEvent):void
		{
			if (ev.data == "movrchishemosvlas")
			{
				timerC = new TimerClass();
				addChild(timerC);
				dispatchEvent(new DataEvent(DataEvent.DATA , false , false, "ButtonVisibleTrue"));
				timerC.x = _stageWidth - timerC.width;
				timerC.y =  timerC.height;
				merveEtapiClass = new MerveEtapiClass(_stageWidth, _stageHeight);
				addChild(merveEtapiClass);
				merveEtapiClass.addEventListener(DataEvent.DATA, endOfGame, false, 0, true);
			}
		
		}
		
		private function endOfGame(e:DataEvent):void
		{
			if (e.data == "EndOFClass")
			{
				qula = timerC.returnQula();
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString() ));
				removeChild(timerC);
			}
		}
	}

}
