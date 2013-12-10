package  {
	import flash.display.MovieClip;
	import flash.utils.*;
	import flash.events.Event;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.events.DataEvent;
	
	
	public class  MeateEtapi extends MovieClip
	{
		
		private var soundControl:SoundControl;
		private var merveEtapiStart_mc:MovieClip;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		

		public function MeateEtapi(_stageWidth:Number = 1024, _stageHeight:Number = 768) 
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
			merveEtapiStart_mc = new MeateEtapi_mc();
			
			merveEtapiStart_mc.x = _stageWidth / 2;
			merveEtapiStart_mc.y = _stageHeight / 2;
			merveEtapiStart_mc.height = _stageHeight / 1.5;
			merveEtapiStart_mc.scaleX = merveEtapiStart_mc.scaleY;

			animZgarbi();
			merveEtapiStart_mc.textFrame.alpha = 0;
			merveEtapiStart_mc.zgarbi.alpha = 0;
			addChild(merveEtapiStart_mc);
			
		
		}
				private function animZgarbi():void
		{
			TweenMax.fromTo(merveEtapiStart_mc.zgarbi, 1, {x: merveEtapiStart_mc.zgarbi.x, y: (2 * stage.stageHeight)}, {x: merveEtapiStart_mc.zgarbi.x, y: merveEtapiStart_mc.zgarbi.y, alpha: 1, onComplete: addText});
		}
		
		private function addText():void
		{
			soundControl = new SoundControl();
			soundControl.loadSound("12.mp3", 1);
			soundControl.soundPlay();		
			
			TweenMax.to(merveEtapiStart_mc.textFrame, 0.5, {alpha: 1});
			setTimeout(merveetapicall, 6000)
		
		}
		
		private function merveetapicall():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchishemosvlas"));
			destroy();			
		}
		
		private function destroy():void
		{
			TweenMax.killTweensOf(merveEtapiStart_mc.zgarbi);
			TweenMax.killTweensOf(merveEtapiStart_mc.textFrame);
			
			if (merveEtapiStart_mc)
			{
				removeChild(merveEtapiStart_mc);
				merveEtapiStart_mc = null;
			}
			
		}
		
	}
	
}
