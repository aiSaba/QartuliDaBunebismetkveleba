package
{
	
	import flash.display.MovieClip;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	import flash.events.Event;
	
	public class TelefoniClass extends MovieClip
	{
		private var telefoniObjects:MovieClip;
		private var soundControl:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function TelefoniClass(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (telefoniObjects)
			{
				removeChild(telefoniObjects);
				telefoniObjects = null;
			}
			
		    TweenMax.killTweensOf(telefoniObjects);
		
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addObjects();
		}
		private function addObjects():void
		{
			telefoniObjects = new Telefoni();
			
			telefoniObjects.x = _stageWidth / 2;
			telefoniObjects.y = _stageHeight / 2;
			
			telefoniObjects.height = _stageHeight / 1.2;
			telefoniObjects.scaleX = telefoniObjects.scaleY;
			
			telefoniObjects.alpha = 0;
			addChild(telefoniObjects);
			animTelefoni();
		}
		private function animTelefoni():void
		{
			soundControl = new SoundControl();
			addChild(soundControl);
			soundControl.loadSound("muzeumi_01_page_02.mp3", 1);
			soundControl.soundPlay();
			TweenMax.to(telefoniObjects, 1, { alpha:1, onComplete:sceneIsFinished } );
		}
		public function gasvla():void
		{
			soundControl.soundStop();
			TweenMax.to(telefoniObjects, 1, { alpha:0 } );
			destroy(null);
		}
		private function sceneIsFinished():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi scenas"));
		}
	}

}
