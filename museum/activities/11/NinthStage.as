package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import flash.events.DataEvent;
	
	
	public class NinthStage extends MovieClip {
		
		private var ninthStageMc:MovieClip;
		private var zgarbi:MovieClip;
		private var textFrame:MovieClip;
		private var soundControl1:SoundControl;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		
		
		public function NinthStage(_stageWidth:Number=1024, _stageHeight:Number=768) 
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init)
			addNinthStage();
		}
		
		private function addNinthStage():void
		{
			ninthStageMc = new StageNinth();	
			ninthStageMc.x =  _stageWidth / 2;
			ninthStageMc.y = _stageHeight / 2;
			ninthStageMc.height = _stageHeight/1.5;
			ninthStageMc.scaleX = ninthStageMc.scaleY;
			
			
			zgarbi = ninthStageMc.zgarbi;
		    textFrame = ninthStageMc.textFrame;
			
			zgarbi.alpha = 0;
			textFrame.alpha = 0;
			
			addChild(ninthStageMc);
			firstStageMcAnimation();
		}
		
		private function firstStageMcAnimation():void
		{
			
			TweenMax.fromTo(zgarbi, 1, {x:zgarbi.x, y:(2 * _stageHeight)}, {x:zgarbi.x, y:zgarbi.y, alpha:1,  onComplete:addText});
			
		}
		
		private function addText():void
		{
			soundControl1 = new SoundControl();
			addChild(soundControl1);
			soundControl1.loadSound("11.mp3", 1);
			soundControl1.soundPlay();
			TweenMax.to(textFrame, 0.5, { alpha:1, onComplete:waitFunc } );			
		}
		
		private function waitFunc():void
		{
			setTimeout(next, 9000)
		}
		private function next ():void
		{	
			destroy();
		}
		
		private function destroy():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi"));
			TweenMax.killTweensOf(zgarbi);
			TweenMax.killTweensOf(textFrame);
			removeChild(soundControl1)
			soundControl1 = null;
	
			removeChild(ninthStageMc);
			ninthStageMc = null;
		}
	}
	
}
