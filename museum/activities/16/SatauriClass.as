package
{
	
	import flash.display.MovieClip;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.events.Event;
	
	public class SatauriClass extends MovieClip
	{
		private var satauri:MovieClip;
		private var soundControl:SoundControl;
		/////
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function SatauriClass(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{			
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (satauri)
			{
				removeChild(satauri);
				satauri = null;
			}
			if (soundControl)
			{
				removeChild(soundControl);
				soundControl = null;
			}
		    TweenMax.killTweensOf(satauri);
		
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		private function addObjects():void
		{
			satauri = new Satauri();
			
			satauri.x = _stageWidth / 2;
			satauri.y = _stageHeight / 2;
			
			satauri.height = _stageHeight / 1.5;
			satauri.scaleX = satauri.scaleY;
			
			satauri.alpha = 0;
			addChild(satauri);
			animSatauri();
		}
		private function animSatauri():void
		{
			TweenMax.to(satauri, 1, { alpha:1, onComplete:sceneIsFinished } );
			
			//soundControl = new SoundControl();
			//addChild(soundControl);
			//soundControl.loadSound("00_satauri.mp3", 1);
			//soundControl.soundPlay();
		}
		public function gasvla():void
		{
			//soundControl.soundStop();
			
			TweenMax.to(satauri, 1, { alpha:0 } );
			destroy(null);
		}
		private function sceneIsFinished():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi scenas"));
		}
	}

}
