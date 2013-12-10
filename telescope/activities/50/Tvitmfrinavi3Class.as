package
{
	
	import flash.display.MovieClip;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.events.Event;
	
	public class Tvitmfrinavi3Class extends MovieClip
	{
		private var tvitmfrinavi3Objects:MovieClip;
		private var soundControl:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function Tvitmfrinavi3Class(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (tvitmfrinavi3Objects)
			{
				removeChild(tvitmfrinavi3Objects);
				tvitmfrinavi3Objects = null;
			}
			
		    TweenMax.killTweensOf(tvitmfrinavi3Objects);
		
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		private function addObjects():void
		{
			tvitmfrinavi3Objects = new Tvitmfrinavi3();
			
			tvitmfrinavi3Objects.x = _stageWidth / 2;
			tvitmfrinavi3Objects.y = _stageHeight / 2;
			
			tvitmfrinavi3Objects.height = _stageHeight / 1.2;
			tvitmfrinavi3Objects.scaleX = tvitmfrinavi3Objects.scaleY;
			
			tvitmfrinavi3Objects.alpha = 0;
			addChild(tvitmfrinavi3Objects);
			animTvitmfrinavi3();
		}
		private function animTvitmfrinavi3():void
		{
			soundControl = new SoundControl();
			addChild(soundControl);
			soundControl.loadSound("muzeumi_07_page.mp3", 1);
			soundControl.soundPlay();
			TweenMax.to(tvitmfrinavi3Objects, 1, { alpha:1, onComplete:sceneIsFinished } );
		}
		public function gasvla():void
		{
			soundControl.soundStop();
			TweenMax.to(tvitmfrinavi3Objects, 1, { alpha:0 } );
			destroy(null);
		}
		private function sceneIsFinished():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi scenas"));
		}
	}

}
