package
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.DataEvent;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class SixthStrageController extends MovieClip
	{
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		private var meeqvseetapistart:MeeqvseEtapiStart;
		private var meeqvseEtapiText:MeeqvseEtapiText;
		private var meeqvseEtapiSwrafi:MeeqvseEtapiSwrafi;
		private var meeqvseEtapiBrazi:MeeqvseEtapiBrazi;
		private var meeqvseEtapiGoni:MeeqvseEtapiGoni;
		private var meeqvseEtapiDzveli:MeeqvseEtapiDzveli;
		
		private var timerC:TimerClass;
		private var qula:int;
		private var classArray:Array;
		
		public function SixthStrageController(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			addEventListener(Event.ADDED_TO_STAGE, initHandler, false, 0, true)
		}
		
		private function initHandler(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initHandler);
			initMain();
		}
		
		private function initMain():void
		{
			_stageHeight = stage.stageHeight;
			_stageWidth = stage.stageWidth;
			
			meeqvseEtapiSwrafi = new MeeqvseEtapiSwrafi(_stageWidth, _stageHeight);
			meeqvseEtapiBrazi = new MeeqvseEtapiBrazi(_stageWidth, _stageHeight);
			meeqvseEtapiDzveli = new MeeqvseEtapiDzveli(_stageWidth, _stageHeight);
			meeqvseEtapiGoni = new MeeqvseEtapiGoni(_stageWidth, _stageHeight);
			
			
			
			//classArray = [meeqvseEtapiSwrafi, meeqvseEtapiBrazi, meeqvseEtapiDzveli, meeqvseEtapiGoni];
			
			meeqvseetapistart = new MeeqvseEtapiStart(_stageWidth, _stageHeight);
			addChild(meeqvseetapistart);
			meeqvseetapistart.addEventListener(DataEvent.DATA, beforeStage, false, 0, true);
		
		}
		
		private function beforeStage(ev:DataEvent):void
		{
			if (ev.data == "movrchishemosvlas")
			{
				meeqvseEtapiText = new MeeqvseEtapiText(_stageWidth, _stageHeight);
				addChild(meeqvseEtapiText);
				meeqvseEtapiText.addEventListener(DataEvent.DATA, beforText, false, 0, true);
			}
		
		}
		
		private function beforText(e:DataEvent):void
		{
			if (e.data == "movrchitext")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleTrue"));
				timerC = new TimerClass();
				addChild(timerC);
				timerC.x = _stageWidth - timerC.width;
				timerC.y =  timerC.height;				
				addChild(meeqvseEtapiGoni);
				meeqvseEtapiGoni.addEventListener(DataEvent.DATA, endOfGoni, false, 0, true);
			}
		
		}
		
		private function endOfGoni(e:DataEvent):void 
		{
			if (e.data == "EndOFClass")
			{
				addChild(meeqvseEtapiDzveli)
				meeqvseEtapiDzveli.addEventListener(DataEvent.DATA, endOfDzveli, false, 0, true);				
			}
			
		}
		
		private function endOfDzveli(e:DataEvent):void 
		{
			if (e.data == "EndOFClass")
			{
				addChild(meeqvseEtapiBrazi);
				meeqvseEtapiBrazi.addEventListener(DataEvent.DATA, endOfBrazi, false, 0, true);				
			}
		}
		
		private function endOfBrazi(e:DataEvent):void 
		{
			if (e.data == "EndOFClass")
			{
				addChild(meeqvseEtapiSwrafi);
				meeqvseEtapiSwrafi.addEventListener(DataEvent.DATA, endOfGame, false, 0, true);
			}
		}
		
		private function endOfGame(e:DataEvent):void
		{
			if (e.data == "EndOFClass")
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false , "ButtonVisibleFalse"));
				qula = timerC.returnQula();
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame|" + qula.toString() ));
				removeChild(timerC);
			}
		}
		public function TimerStop():void
		{			
			timerC.pauseTimer();				
		}
		public function TimerResume():void
		{			
			timerC.resumeTimer();				
		}
	}

}
