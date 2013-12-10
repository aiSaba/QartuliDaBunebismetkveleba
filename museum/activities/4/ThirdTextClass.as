package
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.utils.*;
	import flash.text.*;
	
	public class ThirdTextClass extends MovieClip
	{
		private var thirdText:MovieClip;
		private var fourthTextClass:FourthTextClass;
		private var wordsArray:Array;
		private var wrongwordsArray:Array;
		private var randomNumber:int;
		private var currectwordsArray:Array;
		private var textBG:MovieClip;
		private var wordsArray1:Array
		private var error:SoundControl;
		private var currScale:Number;
		private var currWidth:Number;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function ThirdTextClass(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, initHandler, false, 0, true)
			addEventListener(Event.REMOVED_FROM_STAGE, destroy)
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			TweenMax.killTweensOf(textBG);
			
			if (thirdText)
			{
				removeChild(thirdText);
				thirdText = null;
			}
			if (error)
			{
				removeChild(error)
				error = null;
			}
			for (var i:int = 0; i < wordsArray1.length; i++)
			{
				wordsArray1[i].removeEventListener(MouseEvent.MOUSE_DOWN, wrongTextHandler)
			}
			wordsArray[randomNumber].removeEventListener(MouseEvent.MOUSE_DOWN, textClickHandler)
		}
		
		private function initHandler(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initHandler);
			initThirdText();
		}
		
		private function initThirdText():void
		{
			thirdText = new ThirdText();
			thirdText.x = _stageWidth / 2;
			thirdText.y = _stageHeight / 2;
			
			addChild(thirdText);
			
			thirdText.height = _stageHeight / 4;
			thirdText.scaleX = thirdText.scaleY;
			
			wordsArray = [thirdText.muzeumi, thirdText.kidev, thirdText.dgas, thirdText.hyveba]
			
			randomNumber = Math.round(Math.random() * 3);
			
			wrongwordsArray = ["მუზეომში", "კიდე", "დგას", "ყვება"]
			
			wordsArray[randomNumber].text = wrongwordsArray[randomNumber];
			wordsArray[randomNumber].addEventListener(MouseEvent.MOUSE_DOWN, textClickHandler)
			
			currectwordsArray = ["მუზეუმში", "კიდევ", "დგას,", "ჰყვება"]
			
			wordsArray1 = [thirdText.muzeumi, thirdText.kidev, thirdText.dgas, thirdText.hyveba, thirdText.uzarmazari, thirdText.dzveleburi, thirdText.tvitmprinavi, thirdText.romelic, thirdText.yvelaze, thirdText.daujerebel, thirdText.ambebs]
			
			wordsArray1.splice(randomNumber, 1);
			
			for (var i:int = 0; i < wordsArray1.length; i++)
			{
				wordsArray1[i].addEventListener(MouseEvent.MOUSE_DOWN, wrongTextHandler);
			}
			
			//about textBackground
			textBG = new TextBack();
			
			thirdText.addChild(textBG);
			textBG.alpha = 0;
			textBG.parent.setChildIndex(textBG, 0);
		
			//////////////////////
		
		}
		
		private function wrongTextHandler(e:MouseEvent):void
		{
			error = new SoundControl();
			if (error.soundIsPlaying())
			{
				return
			}
			error.loadSound("error.mp3", .5);
			addChild(error);
			error.soundPlay();
		}
		
		private function textClickHandler(e:MouseEvent):void
		{
			if (error)
			{
				error.soundStop();
			}
			if (wordsArray[randomNumber].text != currectwordsArray[randomNumber])
			{
				wordsArray[randomNumber].text = currectwordsArray[randomNumber]
				wordsArray[randomNumber].textColor = 0xD9C0A2
				textBG.x = wordsArray[randomNumber].x + wordsArray[randomNumber].width / 2
				textBG.y = wordsArray[randomNumber].y + wordsArray[randomNumber].height / 2
				
				currWidth = wordsArray[randomNumber].width;
				currScale = currWidth / textBG.width;
				textBG.width = currWidth;
				TweenMax.fromTo(textBG, 0.5, {scaleX: 0}, {alpha: 1, scaleX: currScale})
				
			}
			
			setTimeout(fourthTextCall, 2000)
		
		}
		
		private function fourthTextCall():void
		{
			clearTimeout(1);
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "MovrchiMesames"))
			destroy(null);
		
		}
	
	}

}
