package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.ui.Mouse;
	import flash.text.engine.TextLine;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.utils.setTimeout;
	import flash.events.DataEvent;
	
	public class SentenceThree extends MovieClip {
		
		private var sentense_3:MovieClip;
		private var random:Number;
		private var current:Object;
		private var test:Test;
		
		private var currX:Number;
		private var currY:Number;
		
		private var textObj:Array;
		private var textBoxs:Array;
		private var textFields_1:Array;
		private var textFields_2:Array;
		private var textFields_3:Array;
		private var textFields_4:Array;
		private var corrArr:Array;
		private var mainSentence:Array;
		private var backGrounds:Array;
		
		private var old_X_sk:Number;
		private var old_Y_sk:Number;
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		
		public function SentenceThree(_stageWidth:Number = 1024, _stageHeight:Number = 768) 
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
		}
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init)
			addSentences();
		}
		
		
		private function addSentences():void	
		{
			sentense_3 = new Sentence_3() as MovieClip;
			addChild(sentense_3);
			sentense_3.x = _stageWidth / 2;
			sentense_3.y = _stageHeight / 2;
			
			sentense_3.height = _stageHeight/2;
			sentense_3.scaleX = sentense_3.scaleY;
		
			backGrounds =  [sentense_3.back_1.backgr_1, sentense_3.back_2.backgr_2, sentense_3.back_3.backgr_3, sentense_3.back_4.backgr_4];
			textObj = [sentense_3.back_1, sentense_3.back_2, sentense_3.back_3, sentense_3.back_4];
			textBoxs = [sentense_3.back_1.textB, sentense_3.back_2.textB, sentense_3.back_3.textB, sentense_3.back_4.textB];
			textFields_1 = ["თვითმფრინავს", "ტელეფონს", "დურბინდს", "ზარდახშას"];
			textFields_2 = ["დუმს", "ლაქლაქებს", "ჭორაობს", "საუბრობს"];
			textFields_3 = ["აქვს", "ჰქონდა", "ექნება", "ექნებოდა"];
			textFields_4 = ["სულ", "ისევ", "აღარ", "კიდევ"];
			corrArr = ["ტელეფონს", "დუმს", "აქვს", "სულ"];
			mainSentence = ["    ...     თავის დროზე იმდენი სისულელე აქვს<br> ნათქვამი და მოსმენილი, რომ ახლა სულ დუმს.", "ტელეფონს თავის დროზე იმდენი სისულელე აქვს<br> ნათქვამი და მოსმენილი, რომახლა სულ     ...    .",
			"ტელეფონს თავის დროზე იმდენი სისულელე    ...     <br>ნათქვამი და მოსმენილი, რომ ახლა სულ დუმს.", "ტელეფონს თავის დროზე იმდენი სისულელე აქვს<br> ნათქვამი და მოსმენილი, რომ ახლა      ...     დუმს."];
			
			
			random = Math.random() * 4;
			
		
			if (random < 1)
			{
				currX = -457;
				currY = -188;
				
				sentense_3.sentence_3Text.htmlText = mainSentence[0];
				addDrags(textFields_1);
				
			}
			if (random > 1 && random < 2)
				{
					currX = 177;
					currY = -123;
				
				sentense_3.sentence_3Text.htmlText = mainSentence[1];
				addDrags(textFields_2);
			}
			if (random > 2 && random < 3)
			{
				currX = 218	;
				currY = -183;
				
				sentense_3.sentence_3Text.htmlText = mainSentence[2];
				addDrags(textFields_3);
			}
			if (random > 3)
			{
				currX = 137;
				currY = -118;
				
				sentense_3.sentence_3Text.htmlText = mainSentence[3];
				addDrags(textFields_4);
			}
		
		 	
		}///end function
		
		private function swap(first:MovieClip, second:MovieClip):void
		{	
			
			var thirdX:Number;
			var thirdY:Number;
			thirdX = first.x;
			first.x = second.x;
			second.x = thirdX;
			
			thirdY = first.y;
			first.y = second.y;
			second.y = thirdY;
		}	// end swap
		
		///startDrags
		private function addDrags(arr:Array):void
		{
			var random1:RandomPlus = new RandomPlus(1);
			
			for (var k:int = 0; k < 2; k++ )
			{
				var rand = random1.getNum();
				swap(textObj[rand], textObj[rand + 2]);
			}
			
			for (var j:int = 0; j < arr.length; j++)
			{
				var textBox:TextField = textBoxs[j];
				textBox.autoSize = TextFieldAutoSize.LEFT;
				textBoxs[j].text = arr[j];
				backGrounds[j].width = textBoxs[j].width + 20;
				textObj[j].buttonMode = true;
				
			}
			
			test = new Test(textObj, sentense_3.width);
			addChild(test);
			addChild(sentense_3);
			
			
			for (var i:int = 0; i < textBoxs.length; i++)
			{
				textObj[i].addEventListener(MouseEvent.MOUSE_DOWN, startDrag1);
				textObj[i].addEventListener(MouseEvent.MOUSE_UP, stopDrag_1);
			}
		}
		
		private function startDrag1(ev:MouseEvent):void
		{
			current = ev.currentTarget;
			old_X_sk = current.x;
			old_Y_sk = current.y;
			ev.currentTarget.startDrag();
			hitTestFunc(null);
		}
		
		private function stopDrag_1(ev:MouseEvent):void
		{
			ev.currentTarget.stopDrag();
			hitTestFunc_1(null);
		}
		
		
		private function hitTestFunc(event:MouseEvent):void
		{
		
		}
		///stopDrags
		
		
			
		private function hitTestFunc_1(event:MouseEvent):void
		{
			if (current.hitTestObject(sentense_3.sentence_3Text))
			{
					if (current.textB.text == corrArr[0] || current.textB.text == corrArr[1] || current.textB.text == corrArr[2] || current.textB.text == corrArr[3])
					{
						current.x = currX;
						current.y = currY;
						current.stopDrag();
						setTimeout(next, 1000)
					}
					else
					{
						TweenMax.to(current, 0.2, {x: old_X_sk, y: old_Y_sk, onComplete: com});
					}	
			}
			
			if (!current.hitTestObject(sentense_3.sentence_3Text))
			{
				TweenMax.to(current, 0.2, {x: old_X_sk, y: old_Y_sk, onComplete: com});
			}
		
		}
		private function com():void
		{
			current.stopDrag();
			current.addEventListener(MouseEvent.MOUSE_DOWN, startDrag1);
		}

		
		private function next():void
		{
			
			destroy();
		}
		
		private function destroy():void
		{
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi3"));
			TweenMax.killTweensOf(current);
			for (var i:int; i < textBoxs.length; i++ )
			{
				textBoxs[i].removeEventListener(MouseEvent.MOUSE_DOWN, startDrag1);
				textBoxs[i].removeEventListener(MouseEvent.MOUSE_UP, stopDrag_1);
			}
			
			removeChild(sentense_3);
			sentense_3 = null;
		}
		
		
	}
	
}
