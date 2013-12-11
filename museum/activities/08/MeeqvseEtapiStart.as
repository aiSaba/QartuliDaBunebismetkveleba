package
{
	import flash.display.MovieClip;
	import flash.media.Sound;
	import flash.utils.*;
	import flash.events.Event;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.events.DataEvent;
	
	public class MeeqvseEtapiStart extends MovieClip
	{
		private var meeqvseetapistart_mc:MovieClip;
		private var swrafiDispach:MeeqvseEtapiSwrafi;
		private var meesvseetapiText:MeeqvseEtapiText;
		private var soundcontrol:SoundControl;
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function MeeqvseEtapiStart(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, initHandler)
		}
		
		private function initHandler(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initHandler);
			initMeeqvseEtapi();
		}
		
		private function initMeeqvseEtapi():void
		{
			
			meeqvseetapistart_mc = new MeeqvseEtapiStart_mc();
			
			meeqvseetapistart_mc.x = _stageWidth / 2;
			meeqvseetapistart_mc.y = _stageHeight / 2;
			meeqvseetapistart_mc.height = _stageHeight / 1.5;
			meeqvseetapistart_mc.scaleX = meeqvseetapistart_mc.scaleY;
			
			addChild(meeqvseetapistart_mc);
			meeqvseetapistart_mc.zgarbi.alpha = 0;
			meeqvseetapistart_mc.textFrame.alpha = 0;
			animZgarbi();
		
		}
		
		private function animZgarbi():void
		{
			TweenMax.fromTo(meeqvseetapistart_mc.zgarbi, 1, {x: meeqvseetapistart_mc.zgarbi.x, y: (2 * stage.stageHeight)}, {x: meeqvseetapistart_mc.zgarbi.x, y: meeqvseetapistart_mc.zgarbi.y, alpha: 1,  onComplete: addText});
		}
		
		private function addText():void
		{
			soundcontrol = new SoundControl()
			addChild(soundcontrol)
			soundcontrol.loadSound("8.mp3", 1);
			soundcontrol.soundPlay();
			TweenMax.to(meeqvseetapistart_mc.textFrame, 0.5, {alpha: 1});
			setTimeout(merveetapicall, 5000)
		
		}
		
		private function merveetapicall():void
		{		
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchishemosvlas"));
			destroy();
		}		
		private function destroy():void
		{
			TweenMax.killTweensOf(meeqvseetapistart_mc.zgarbi);
			TweenMax.killTweensOf(meeqvseetapistart_mc.textFrame);
			
			removeChild(meeqvseetapistart_mc);
			meeqvseetapistart_mc = null;
		}
	
		
	
	}

}
