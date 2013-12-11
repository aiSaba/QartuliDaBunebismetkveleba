package
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.*
	import flash.utils.*;
	
	//import com.greensock.easing;
	
	public class SecondTextClass extends MovieClip
	{
		
		private var secondText:MovieClip;
		private var thirdTextClass:ThirdTextClass;
		
		private var wrongwordsArray:Array;
		
		private var wordsArray:Array;
		
		private var randomNumber:int;
		
		private var currectwordsArray:Array;
		
		private var textBG:MovieClip;
		private var currScale:Number;
		private var currWidth:Number;
		private var wordsArray1:Array
		
		private var error:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function SecondTextClass(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, initHandler, false, 0, true)
			addEventListener(Event.REMOVED_FROM_STAGE, destroy)
		
		}
		
		private function destroy(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			if (secondText)
			{
				removeChild(secondText);
				secondText = null;
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
			TweenMax.killTweensOf(textBG);
		}
		
		private function initHandler(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initHandler);
			initSecondText();
		}
		
		private function initSecondText():void
		{
			try
			{
				secondText = new SecondText();
				addChild(secondText);
				
				secondText.x = _stageWidth / 2;
				secondText.y = _stageHeight / 2;
				secondText.height = _stageHeight / 6;
				secondText.scaleX = secondText.scaleY;
				
				//Arrays
				wordsArray = [secondText.axla, secondText.siamayit, secondText.hyveba, secondText.istoriebs];
				///
				randomNumber = Math.round(Math.random() * 3);
				////
				wrongwordsArray = ["ეხლა", "სიამაყიდ", "ყვება", "ისტორებს"];
				///
				trace("words", wordsArray, "random", randomNumber, "wrongs", wrongwordsArray)
				wordsArray[randomNumber].text = wrongwordsArray[randomNumber];
				///
				
				wordsArray[randomNumber].addEventListener(MouseEvent.MOUSE_DOWN, textClickHandler)
				////
				
				currectwordsArray = ["ახლა", "სიამაყით", "ჰყვება", "ისტორიებს"]
				///
				
				wordsArray1 = [secondText.axla, secondText.siamayit, secondText.hyveba, secondText.istoriebs, secondText.ki, secondText.tavisi, secondText.simamacis];
				
				wordsArray1.splice(randomNumber, 1);
				
				for (var i:int = 0; i < wordsArray1.length; i++)
				{
					wordsArray1[i].addEventListener(MouseEvent.MOUSE_DOWN, wrongTextHandler);
				}
				
				////////////
				//background
				////////////
				textBG = new Text2Back();
				
				secondText.addChild(textBG);
				textBG.alpha = 0;
				textBG.parent.setChildIndex(textBG, 0);
			}
			catch (e:Error)
			{
				trace("წინადადებებში ერორია");
			}
		
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
			
			setTimeout(ThirdTectCall, 2000)
		
		}
		
		private function ThirdTectCall():void
		{
			clearTimeout(1);
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "MovrchiMeores"))
			destroy(null);
		
		}
	
	}

}
