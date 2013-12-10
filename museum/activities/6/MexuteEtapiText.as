package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.*;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.events.DataEvent;
	
	public class MexuteEtapiText extends MovieClip 
	{
		private var fifthStage:FifthStage;
		private var allText:MovieClip;
		private var soundControl1:SoundControl;
		private var soundControl2:SoundControl;
		private var soundControl3:SoundControl;
		private var soundControl4:SoundControl;
		private var soundControl5:SoundControl;	
		private var cardRotation:CardsRotation;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		
		
		
		
		public function MexuteEtapiText(_stageWidth:Number = 1024, _stageHeight:Number = 768 )
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, initHandler);
		}
		
		private function initHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, initHandler);
			initText();
		}
		
		private function initText():void 
		{
			
			soundControl1 = new SoundControl();
			addChild(soundControl1);
			
			TweenMax.to(allText.text1, 1, {tint:0xff0000});
			soundControl1.loadSound("6.mp3", 1);
			soundControl1.soundPlay();
			setTimeout(nextText, 7000);
			
		}
		
		
		private function nextText():void 
		{
			TweenMax.to(allText.text1, 0.1, {tint:null});
			TweenMax.to(allText.text2, 1, {tint:0xff0000});
			soundControl2 = new SoundControl();
			addChild(soundControl2);
			soundControl2.loadSound("muzeumi_04_page_02.mp3", 1);
			soundControl2.soundPlay();
			setTimeout(nextText1, 6000);
		}
		
		private function nextText1():void 
		{
			TweenMax.to(allText.text2, 1, {tint:null});
			TweenMax.to(allText.text3, 1, {tint:0xff0000});
			soundControl3 = new SoundControl();
			addChild(soundControl3);
			soundControl3.loadSound("muzeumi_05_page.mp3", 1);
			soundControl3.soundPlay();
			setTimeout(nextText2, 7000);
		}
		
		private function nextText2():void 
		{
			TweenMax.to(allText.text3, 1, {tint:null});
			TweenMax.to(allText.text4, 1, {tint:0xff0000});
			soundControl4 = new SoundControl();
			addChild(soundControl4);
			soundControl4.loadSound("muzeumi_06_page.mp3", 1);
			soundControl4.soundPlay();
			setTimeout(nextText3, 7000);
		}
		
		private function nextText3():void 
		{
			TweenMax.to(allText.text4, 1, {tint:null});
			TweenMax.to(allText.text5, 1, {tint:0xff0000});
			soundControl5 = new SoundControl();
			addChild(soundControl5);
			soundControl5.loadSound("muzeumi_07_page.mp3", 1);
			soundControl5.soundPlay();
			setTimeout(next, 8000);
		}
		
		private function next():void
		{
			TweenMax.to(allText.text5, 1, { tint:null } );
			destroy();			
		}
		private function destroy():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi1"));
			TweenMax.killTweensOf(allText.text1);
			TweenMax.killTweensOf(allText.text2);
			TweenMax.killTweensOf(allText.text3);
			TweenMax.killTweensOf(allText.text4);
			TweenMax.killTweensOf(allText.text5);
			
			removeChild(allText);
			allText = null;
			removeChild(soundControl1);
			soundControl1 = null;
			removeChild(soundControl2)
			soundControl2 = null;
			removeChild(soundControl3)
			soundControl3 = null;
			removeChild(soundControl4)
			soundControl4 = null;
			removeChild(soundControl5)
			soundControl5 = null;
		}
	}
	
}
