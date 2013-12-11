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
	
	
	public class SentenceFour extends MovieClip {
		
		private var sentense_4:MovieClip;
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
		private var corrArr:Array;
		private var mainSentence:Array;
		private var backGrounds:Array;
		
		private var old_X_sk:Number;
		private var old_Y_sk:Number;
		
	
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		
		///old coordinates
	
		
		public function SentenceFour(_stageWidth:Number = 1024, _stageHeight:Number = 768) 
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
			sentense_4 = new Sentence_4() as MovieClip;
			addChild(sentense_4);
			
			sentense_4.x = _stageWidth / 2;
			sentense_4.y = _stageHeight / 2;
			
			sentense_4.height = _stageHeight/2;
			sentense_4.scaleX = sentense_4.scaleY;
			
			backGrounds =  [sentense_4.back_1.backgr_1, sentense_4.back_2.backgr_2, sentense_4.back_3.backgr_3, sentense_4.back_4.backgr_4];
			textObj = [sentense_4.back_1, sentense_4.back_2, sentense_4.back_3, sentense_4.back_4];
			textBoxs = [sentense_4.back_1.textB, sentense_4.back_2.textB, sentense_4.back_3.textB, sentense_4.back_4.textB];
			textFields_1 = ["მატყუარა", "ზარმაცი", "გულუბრყვილო", "გულმავიწყი"];
			textFields_2 = ["მანქანა", "ხალიჩა", "კომპასი", "საათი"];
			textFields_3 = ["მოიწყინა", "დაბერდა", "დაიმსხვრა", "გაჩერდა"];
			corrArr = ["გულმავიწყი", "საათი", "დაბერდა"];
			mainSentence = ["დიდი ძველებური საათი დაბერდა და       ...       გახდა,<br> ჩამორჩენა დაიწყო.", "დიდი ძველებური      ...      დაბერდა და გულმავიწყი გახდა,<br> ჩამორჩენა დაიწყო.",
			"დიდი ძველებური საათი      ...      და გულმავიწყი გახდა,<br> ჩამორჩენა დაიწყო."];
			
			
			random = Math.random() * 3;
			
			
			if (random < 1)
			{
				currX = 105;
				currY = -185;
				
				sentense_4.sentence_4Text.htmlText = mainSentence[0];
				addDrags(textFields_1);
				
			}
			if (random > 1 && random < 2)
				{
					currX = -132;
					currY = -185;
				
				sentense_4.sentence_4Text.htmlText = mainSentence[1];
				addDrags(textFields_2);
			}
			if (random > 2)
			{
				currX = -70;
				currY = -185;
				
				sentense_4.sentence_4Text.htmlText = mainSentence[2];
				addDrags(textFields_3);
			}
			
			
		}//end function
		
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
			
			test = new Test(textObj, sentense_4.width);
			addChild(test);
			addChild(sentense_4);
			
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
		
		
			private function hitTestFunc_1(event:MouseEvent):void
		{
			if (current.hitTestObject(sentense_4.sentence_4Text))
			{
					if (current.textB.text == corrArr[0] || current.textB.text == corrArr[1] || current.textB.text == corrArr[2])
					{
						current.x = currX;
						current.y = currY;
						current.stopDrag();
						setTimeout(next, 2000)
					}
					else
					{
						TweenMax.to(current, 0.2, {x: old_X_sk, y: old_Y_sk, onComplete: com});
					}	
			}
			
			if (!current.hitTestObject(sentense_4.sentence_4Text))
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
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
			destroy();
		}
		
		private function destroy():void
		{
			
			TweenMax.killTweensOf(current);
			
			for (var i:int = 0; i < textBoxs.length; i++ )
			{
				textBoxs[i].removeEventListener(MouseEvent.MOUSE_DOWN, startDrag1);
				textBoxs[i].removeEventListener(MouseEvent.MOUSE_UP, stopDrag_1);
			}
			removeChild(sentense_4);
			sentense_4 = null;
			
		}
	
	}
	
}
