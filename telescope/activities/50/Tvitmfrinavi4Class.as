package
{
	
	import flash.display.MovieClip;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.events.Event;
	
	public class Tvitmfrinavi4Class extends MovieClip
	{
		private var tvitmfrinavi4Objects:MovieClip;
		private var soundControl:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function Tvitmfrinavi4Class(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (tvitmfrinavi4Objects)
			{
				removeChild(tvitmfrinavi4Objects);
				tvitmfrinavi4Objects = null;
			}
			
		    TweenMax.killTweensOf(tvitmfrinavi4Objects);
		
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		private function addObjects():void
		{
			tvitmfrinavi4Objects = new Tvitmfrinavi4();
			
			tvitmfrinavi4Objects.x = _stageWidth / 2;
			tvitmfrinavi4Objects.y = _stageHeight / 2;
			
			tvitmfrinavi4Objects.height = _stageHeight / 1.2;
			tvitmfrinavi4Objects.scaleX = tvitmfrinavi4Objects.scaleY;
			
			tvitmfrinavi4Objects.alpha = 0;
			addChild(tvitmfrinavi4Objects);
			animTvitmfrinavi4();
		}
		private function animTvitmfrinavi4():void
		{
			soundControl = new SoundControl();
			addChild(soundControl);
			soundControl.addEventListener(DataEvent.DATA, soundListener);
			soundControl.loadSound("muzeumi_08_page_01.mp3", 1);
			soundControl.soundPlay();
			TweenMax.to(tvitmfrinavi4Objects, 1, { alpha:1, onComplete:sceneIsFinished } );
		}
		private function soundListener(e:DataEvent):void 
		{
			soundControl.removeEventListener(DataEvent.DATA, soundListener);
			removeChild(soundControl);
			soundControl = null;
			
			soundControl = new SoundControl();
			addChild(soundControl);
			soundControl.loadSound("muzeumi_08_page_02.mp3", 1);
			soundControl.soundPlay()
			
		}
		public function gasvla():void
		{
			soundControl.soundStop();
			TweenMax.to(tvitmfrinavi4Objects, 1, { alpha:0 } );
			destroy(null);
		}
		private function sceneIsFinished():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi scenas"));
		}
	}

}
