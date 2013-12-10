package
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextSnapshot;
	import flash.ui.Mouse;
	import flash.text.engine.TextLine;
	import com.greensock.*
	import com.greensock.easing.*
	import flash.utils.setTimeout;
	import flash.events.DataEvent;
	
	
	public class SentenceOne extends MovieClip
	{
		
		private var sentense_1:MovieClip;
		private var random:Number;
		private static var current:Object;
		
		private var currX:Number;
		private var currY:Number;

		///align
		private var test:Test;
		private var test2:Test;		
		
		///arrays
		private var textObj:Array;
		private var textBoxs:Array;
		private var textFields_1:Array;
		private var textFields_2:Array;
		private var textFields_3:Array;
		private var textFields_4:Array;
		private var corrArr:Array;
		private var mainSentence:Array;
		private var backGrounds:Array;
		private var testArray:Array;
		
		///old coordinates
		private var old_X_sk:Number;
		private var old_Y_sk:Number;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		
		
		public function SentenceOne(_stageWidth:Number = 1024, _stageHeight:Number = 768)
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
			
			sentense_1 = new Sentence_1() as MovieClip;	
			sentense_1.x = _stageWidth / 2;
			sentense_1.y = _stageHeight / 2;	
			sentense_1.height = _stageHeight / 2;
			sentense_1.scaleX = sentense_1.scaleY;

			backGrounds =  [sentense_1.back_1.backgr_1, sentense_1.back_2.backgr_2, sentense_1.back_3.backgr_3, sentense_1.back_4.backgr_4];
			textObj = [sentense_1.back_1, sentense_1.back_2, sentense_1.back_3, sentense_1.back_4];
			textBoxs = [sentense_1.back_1.textB, sentense_1.back_2.textB, sentense_1.back_3.textB, sentense_1.back_4.textB];
			textFields_1 = ["ახალი", "ძველებური", "უმნიშვნელო", "მოსაწყენი"];
			textFields_2 = ["ნივთი", "ფრინველი", "ცხოველი", "სახლი"];
			textFields_3 = ["იმალება", "ინახება", "იქნება", "იყიდება"];
			textFields_4 = ["სკოლაში", "საავადმყოფოში", "სხვენში", "მუზეუმში"];
			corrArr = ["მუზეუმში", "ძველებური", "ნივთი", "ინახება"];
			mainSentence = ["მუზეუმში ბევრი      ...        ნივთი და მექანიზმი ინახება.", "მუზეუმში ბევრი ძველებური     ...    და მექანიზმი ინახება.", "მუზეუმში ბევრი ძველებური ნივთი და მექანიზმი    ...", "      ...       ბევრი ძველებური ნივთი და მექანიზმი ინახება."];
			testArray = new Array();
			
			
			
			
			random = Math.random() * 4;
			
			if (random < 1)
			{
				currX = -155;
				currY = -193;
				
				sentense_1.sentence_1Text.text = mainSentence[0];
				addDrags(textFields_1);
				
				
			}
			if (random > 1 && random < 2)
			{
				currX =-3;
				currY = -188;
				
				sentense_1.sentence_1Text.text = mainSentence[1];
				addDrags(textFields_2);
				
			}
			if (random > 2 && random < 3)
			{
				currX = 267;
				currY = -185;
				
				sentense_1.sentence_1Text.text = mainSentence[2];
				addDrags(textFields_3);
			}
			if (random > 3)
			{
				currX = -367;
				currY = -187;
				
				sentense_1.sentence_1Text.text = mainSentence[3];
				addDrags(textFields_4);
			}
		
		}

		
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
				textObj[j].buttonMode = true;
				backGrounds[j].width = textBoxs[j].width + 20;
			}
			
			
				
				test = new Test(textObj, sentense_1.width);
				addChild(test);
				addChild(sentense_1);
				
			for (var i:int = 0; i < textBoxs.length; i++)
			{
				textObj[i].addEventListener(MouseEvent.MOUSE_DOWN, startDrag1);
				textObj[i].addEventListener(MouseEvent.MOUSE_UP, stopDrag_1);
			}
				
		
			
			
		}
		
		///startDrags
		private function startDrag1(ev:MouseEvent):void
		{
			current = ev.currentTarget;
			old_X_sk = current.x;
			old_Y_sk = current.y;
			ev.currentTarget.startDrag();
			hitTestFunc(null);
		}
		
		
		
		///stopDrags
		
		private function stopDrag_1(ev:MouseEvent):void
		{
			ev.currentTarget.stopDrag();
			hitTestFunc_1(null);
		}
		
		//hitTest
		private function hitTestFunc_1(event:MouseEvent):void
		{
			if (current.hitTestObject(sentense_1.sentence_1Text))
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
			
			if (!current.hitTestObject(sentense_1.sentence_1Text))
			{
				TweenMax.to(current, 0.2, {x: old_X_sk, y: old_Y_sk, onComplete: com});
			}
		
		}
		
		private function com():void
		{
			current.stopDrag();
			current.addEventListener(MouseEvent.MOUSE_DOWN, startDrag1);
		}
		
		private function hitTestFunc(event:MouseEvent):void
		{
		
		}
		private function next():void
		{
			destroy();
		}
		
		public function destroy():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "movrchi1"));
			TweenMax.killTweensOf(current);
			
			if (sentense_1)
			{
			{
				for (var i:int = 0; i < textBoxs.length; i++)
				{
					textObj[i].removeEventListener(MouseEvent.MOUSE_DOWN, startDrag1);
					textObj[i].removeEventListener(MouseEvent.MOUSE_UP, stopDrag_1);
				}
			}
			removeChild(sentense_1);
			sentense_1 = null;
			}
			
		}
	
	}

}
