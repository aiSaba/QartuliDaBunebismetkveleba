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
	
	public class FifthTextClass extends MovieClip
	{
		private var fifthText:MovieClip;
		private var textBG:MovieClip;
		
		private var sixTextClass:SixTextClass;
		
		private var wordsArray:Array;
		private var wrongwordsArray:Array;
		private var currectwordsArray:Array;
		private var wordsArray1:Array
		
		private var currWidth:Number;
		private var currScale:Number
		
		private var randomNumber:int;
		
		private var error:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function FifthTextClass(_stageWidth:Number = 1024, _stageHeight:Number = 768)
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
			
			if (fifthText)
			{
				removeChild(fifthText);
				fifthText = null;
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
			initFifthText();
		}
		
		private function initFifthText():void
		{
			fifthText = new FifthText();
			
			addChild(fifthText);
			
			fifthText.x = _stageWidth / 2;
			fifthText.y = _stageHeight / 2;
			
			fifthText.height = _stageHeight / 6;
			fifthText.scaleX = fifthText.scaleY;
			
			//////Arrays
			wordsArray = [fifthText.gamomgoneblebma, fifthText.axali, fifthText.swrafi, fifthText.tvitmfrinavebi, fifthText.gamoigones]
			
			//
			
			randomNumber = Math.round(Math.random() * 4);
			
			wrongwordsArray = ["გამოგონებლებმა ", "აძალი ", "სშრაფი ", "თვითფრინავები ", "გამოიგონა"]
			
			//
			//MouseEvent
			wordsArray[randomNumber].text = wrongwordsArray[randomNumber];
			wordsArray[randomNumber].addEventListener(MouseEvent.MOUSE_DOWN, textClickHandler)
			
			//
			currectwordsArray = ["გამომგონებლებმა ", "ახალი ", "სწრაფი  ", "თვითმფრინავები  ", "გამოიგონეს."]
			
			//
			
			wordsArray1 = [fifthText.gamomgoneblebma, fifthText.axali, fifthText.swrafi, fifthText.tvitmfrinavebi, fifthText.gamoigones, fifthText.mere, fifthText.ufro]
			
			//
			
			wordsArray1.splice(randomNumber, 1);
			
			for (var i:int = 0; i < wordsArray1.length; i++)
			{
				wordsArray1[i].addEventListener(MouseEvent.MOUSE_DOWN, wrongTextHandler);
			}
			
			//about textBackground
			textBG = new Text5Back();
			
			fifthText.addChild(textBG);
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
				currWidth = wordsArray[randomNumber].width;
				
				wordsArray[randomNumber].textColor = 0xD9C0A2
				currScale = currWidth / textBG.width;
				textBG.width = currWidth;
				textBG.x = wordsArray[randomNumber].x + wordsArray[randomNumber].width / 2
				textBG.y = wordsArray[randomNumber].y + wordsArray[randomNumber].height / 2
				
				//TextBgMove();
				TweenMax.fromTo(textBG, 0.5, {scaleX: 0}, {alpha: 1, scaleX: currScale})
				
			}
			
			setTimeout(sixTextCall, 2000)
		
		}
		
		private function sixTextCall():void
		{
			clearTimeout(1);
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "MovrchiMexutes"))
			destroy(null);
		
		}
	
	}

}