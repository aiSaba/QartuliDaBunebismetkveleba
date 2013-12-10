package
{
	
	import flash.display.MovieClip;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.events.Event;
	
	public class Tvitmfrinavi2Class extends MovieClip
	{
		private var tvitmfrinavi2Objects:MovieClip;
		private var soundControl:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function Tvitmfrinavi2Class(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (tvitmfrinavi2Objects)
			{
				removeChild(tvitmfrinavi2Objects);
				tvitmfrinavi2Objects = null;
			}
			
		    TweenMax.killTweensOf(tvitmfrinavi2Objects);
		
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		private function addObjects():void
		{
			tvitmfrinavi2Objects = new Tvitmfrinavi2();
			
			tvitmfrinavi2Objects.x = _stageWidth / 2;
			tvitmfrinavi2Objects.y = _stageHeight / 2;
			
			tvitmfrinavi2Objects.height = _stageHeight / 1.2;
			tvitmfrinavi2Objects.scaleX = tvitmfrinavi2Objects.scaleY;
			
			tvitmfrinavi2Objects.alpha = 0;
			addChild(tvitmfrinavi2Objects);
			animTvitmfrinavi2();
		}
		private function animTvitmfrinavi2():void
		{
			soundControl = new SoundControl();
			addChild(soundControl);
			soundControl.loadSound("muzeumi_06_page.mp3", 1);
			soundControl.soundPlay();
			TweenMax.to(tvitmfrinavi2Objects, 1, { alpha:1, onComplete:sceneIsFinished } );
		}
		public function gasvla():void
		{
			soundControl.soundStop();
			TweenMax.to(tvitmfrinavi2Objects, 1, { alpha:0 } );
			destroy(null);
		}
		private function sceneIsFinished():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi scenas"));
		}
	}

}
