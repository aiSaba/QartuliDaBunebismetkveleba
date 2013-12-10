package
{
	import flash.display.MovieClip;
	import flash.utils.*;
	import flash.events.Event;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.events.DataEvent;
	
	public class Zgarbi extends MovieClip
	{
		private var meshvideetapistart_mc:MovieClip;	
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		private var soundControl1:SoundControl;
		
		
		
		public function Zgarbi(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, initHandler)
		}
		
		private function initHandler(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initHandler);
			initMerveEtapiStart();
		}
		
		private function initMerveEtapiStart():void
		{
			meshvideetapistart_mc = new Meshvideetapistart_mc();
			
			meshvideetapistart_mc.x = _stageWidth / 2;
			meshvideetapistart_mc.y = _stageHeight / 2;
			meshvideetapistart_mc.height = _stageHeight / 1.5;
			meshvideetapistart_mc.scaleX = meshvideetapistart_mc.scaleY;
			
			animZgarbi();
			meshvideetapistart_mc.textFrame.alpha = 0;
			meshvideetapistart_mc.zgarbi.alpha = 0;
			addChild(meshvideetapistart_mc);
		
		}
		
		private function animZgarbi():void
		{
			TweenMax.fromTo(meshvideetapistart_mc.zgarbi, 1, {x: meshvideetapistart_mc.zgarbi.x, y: (2 * stage.stageHeight)}, {x: meshvideetapistart_mc.zgarbi.x, y: meshvideetapistart_mc.zgarbi.y, alpha: 1, onComplete: addText});
		}
		
		private function addText():void
		{
			soundControl1 = new SoundControl();
			addChild(soundControl1);
			soundControl1.loadSound("33.mp3", 1);
			soundControl1.soundPlay();
			TweenMax.to(meshvideetapistart_mc.textFrame, 0.5, {alpha: 1, onComplete: next});
		}
		
		private function next():void
		{
			setTimeout(merveetapicall, 3000)
		}
		
		private function merveetapicall():void
		{			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchishemosvlas"));
			destroy();
		}
		
		private function destroy():void
		{
			
			TweenMax.killTweensOf(meshvideetapistart_mc.zgarbi);
			TweenMax.killTweensOf(meshvideetapistart_mc.textFrame);
			if (meshvideetapistart_mc)
			{
				removeChild(meshvideetapistart_mc);
				meshvideetapistart_mc = null;
			}			
		
		}
	
	}

}
