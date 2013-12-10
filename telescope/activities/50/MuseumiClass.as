package
{
	
	import flash.display.MovieClip;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.events.Event;
	
	public class MuseumiClass extends MovieClip
	{
		private var museumObjects:MovieClip;
		private var soundControl:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function MuseumiClass(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (museumObjects)
			{
				removeChild(museumObjects);
				museumObjects = null;
			}
			
		    TweenMax.killTweensOf(museumObjects);
		
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		private function addObjects():void
		{
			museumObjects = new Museum();
			
			museumObjects.x = _stageWidth / 2;
			museumObjects.y = _stageHeight / 2;
			
			museumObjects.height = _stageHeight / 1.2;
			museumObjects.scaleX = museumObjects.scaleY;
			
			museumObjects.alpha = 0;
			addChild(museumObjects);
			animMuseum();
		}
		private function animMuseum():void
		{
			soundControl = new SoundControl();
			addChild(soundControl);
			soundControl.addEventListener(DataEvent.DATA, soundListener);
			soundControl.loadSound("muzeumi_01_page_00.mp3", 1);
			soundControl.soundPlay();
			TweenMax.to(museumObjects, 1, { alpha:1, onComplete:sceneIsFinished } );
		}
		private function soundListener(e:DataEvent):void 
		{
			soundControl.removeEventListener(DataEvent.DATA, soundListener);
			removeChild(soundControl);
			soundControl = null;
			
			soundControl = new SoundControl();
			addChild(soundControl);
			soundControl.loadSound("muzeumi_01_page_01.mp3", 1);
			soundControl.soundPlay()
			
		}
		public function gasvla():void
		{
			soundControl.soundStop();
			TweenMax.to(museumObjects, 1, { alpha:0 } );
			destroy(null);
		}
		private function sceneIsFinished():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi scenas"));
		}
	}

}
