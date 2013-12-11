package
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.*;
	import com.greensock.*;
	import com.greensock.easing.*;
	
	public class MeoreEtapiClass extends MovieClip
	{
		private var meoreEtepi:MovieClip;
		private var firstTextClass:FirstTextClass;
		
		private var soundControl1:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function MeoreEtapiClass(_stageWidth:Number = 1024, _stageHeight = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, initHandler, false, 0, true)
		}
		
		private function initHandler(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initHandler);
			
			initMeoreEtapiClass();
		}
		
		private function initMeoreEtapiClass():void
		{
			meoreEtepi = new MeoreEtapi();
			
			meoreEtepi.x = _stageWidth / 2;
			meoreEtepi.y = _stageHeight / 2;
			meoreEtepi.height = _stageHeight / 1.5;
			meoreEtepi.scaleX = meoreEtepi.scaleY;
			animZgarbi();
			meoreEtepi.textFrame.alpha = 0;
			addChild(meoreEtepi);
			
			meoreEtepi.zgarbi.alpha = 0;
		}
		
		private function firsTextCall():void
		{
			clearTimeout(1);
			dispatchEvent(new DataEvent(DataEvent.DATA ,false, false, "MovrchiShesvlas"))
			destroy();
		
		}
		
		private function animZgarbi():void
		{
			TweenMax.fromTo(meoreEtepi.zgarbi, 1, {x: meoreEtepi.zgarbi.x, y: (2 * stage.stageHeight)}, {x: meoreEtepi.zgarbi.x, y: meoreEtepi.zgarbi.y, alpha: 1, onComplete: addText});
		}
		
		private function addText():void
		{
			soundControl1 = new SoundControl();
			addChild(soundControl1);
			soundControl1.loadSound("4.mp3", 1);
			soundControl1.soundPlay();
			
			TweenMax.to(meoreEtepi.textFrame, 0.5, {alpha: 1, onComplete: next});
		
		}
		
		private function next():void
		{
			setTimeout(firsTextCall, 7000)
		}
		private function destroy():void
		{
			TweenMax.killTweensOf(meoreEtepi.zgarbi);
			TweenMax.killTweensOf(meoreEtepi.textFrame);
			
			if (meoreEtepi)
			{
				removeChild(meoreEtepi);
				meoreEtepi = null;
			}
			if (soundControl1)
			{
				removeChild(soundControl1)
				soundControl1 = null;
			}
		}
		
	
	
	}
}
