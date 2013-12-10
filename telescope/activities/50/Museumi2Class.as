package
{
	
	import flash.display.MovieClip;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.events.Event;
	
	public class Museumi2Class extends MovieClip
	{
		private var museum2Objects:MovieClip;
		private var soundControl:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function Museumi2Class(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (museum2Objects)
			{
				removeChild(museum2Objects);
				museum2Objects = null;
			}
			
		    TweenMax.killTweensOf(museum2Objects);
		
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		private function addObjects():void
		{
			museum2Objects = new Museum2();
			
			museum2Objects.x = _stageWidth / 2;
			museum2Objects.y = _stageHeight / 2;
			
			museum2Objects.height = _stageHeight / 1.2;
			museum2Objects.scaleX = museum2Objects.scaleY;
			
			museum2Objects.alpha = 0;
			addChild(museum2Objects);
			animMuseum2();
		}
		private function animMuseum2():void
		{
			soundControl = new SoundControl();
			addChild(soundControl);
			soundControl.addEventListener(DataEvent.DATA, soundListener);
			soundControl.loadSound("muzeumi_09_page_01.mp3", 1);
			soundControl.soundPlay();
			TweenMax.to(museum2Objects, 1, { alpha:1, onComplete:sceneIsFinished } );
		}
		private function soundListener(e:DataEvent):void 
		{
			soundControl.removeEventListener(DataEvent.DATA, soundListener);
			removeChild(soundControl);
			soundControl = null;
			
			soundControl = new SoundControl();
			addChild(soundControl);
			soundControl.loadSound("muzeumi_09_page_02.mp3", 1);
			soundControl.soundPlay()
			
		}
		public function gasvla():void
		{
			soundControl.soundStop();
			TweenMax.to(museum2Objects, 1, { alpha:0 } );
			destroy(null);
		}
		private function sceneIsFinished():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi scenas"));
		}
	}

}
