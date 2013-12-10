package
{
	
	import flash.display.MovieClip;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.events.Event;
	
	public class DurbindiClass extends MovieClip
	{
		private var durbindiObjects:MovieClip;
		private var soundControl:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function DurbindiClass(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (durbindiObjects)
			{
				removeChild(durbindiObjects);
				durbindiObjects = null;
			}
			
		    TweenMax.killTweensOf(durbindiObjects);
		
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		private function addObjects():void
		{
			durbindiObjects = new Durbindi();
			
			durbindiObjects.x = _stageWidth / 2;
			durbindiObjects.y = _stageHeight / 2;
			
			durbindiObjects.height = _stageHeight / 1.2;
			durbindiObjects.scaleX = durbindiObjects.scaleY;
			
			durbindiObjects.alpha = 0;
			addChild(durbindiObjects);
			animDurbindi();
		}
		private function animDurbindi():void
		{
			soundControl = new SoundControl();
			addChild(soundControl);
			soundControl.addEventListener(DataEvent.DATA, soundListener);
			soundControl.loadSound("muzeumi_04_page_01.mp3", 1);
			soundControl.soundPlay();
			TweenMax.to(durbindiObjects, 1, { alpha:1, onComplete:sceneIsFinished } );
		}
		private function soundListener(e:DataEvent):void 
		{
			soundControl.removeEventListener(DataEvent.DATA, soundListener);
			removeChild(soundControl);
			soundControl = null;
			
			soundControl = new SoundControl();
			addChild(soundControl);
			soundControl.loadSound("muzeumi_04_page_02.mp3", 1);
			soundControl.soundPlay()
			
		}
		public function gasvla():void
		{
			soundControl.soundStop();
			TweenMax.to(durbindiObjects, 1, { alpha:0 } );
			destroy(null);
		}
		private function sceneIsFinished():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi scenas"));
		}
	}

}
