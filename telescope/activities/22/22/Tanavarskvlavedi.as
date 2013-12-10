package  {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.utils.setTimeout;
	import flash.events.DataEvent;
	
	
	public class Tanavarskvlavedi extends MovieClip 
	{
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var all:MovieClip;
		
		private var ansArr:Array;
		private var firstArr:Array;
		private var secondArr:Array;
		private var randomNum:Number;
		private var currentMovieClip:Object;
		private var soundControl:SoundControl;
		private var counter:int = 0;
		
		
		
		public function Tanavarskvlavedi(_stageWidth:Number=1024, _stageHeight:Number=768) 
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init)
			initObjects();
		}
		
		private function initObjects():void
		{
			all = new All();
			all.x = _stageWidth / 2;
			all.y = _stageHeight / 2;
			all.height = _stageHeight/0.7;
			all.scaleX = all.scaleY;
			addChild(all);
			//all.visible = false;
			
			//arrays
			second();
			
		}
		
		private function second():void
		{
			firstArr = [all.kasiopea_1, all.big_1, all.little_1, all.orioni_1, all.herkulesi_1, all.qnari_1];
			secondArr = [all.kasiopea_2, all.big_2, all.little_2, all.orioni_2, all.herkulesi_2, all.qnari_2];
			ansArr = [ all.kasiopea_ans, all.big_ans, all.little_ans, all.orioni_ans, all.herkules_ans, all.qnari_ans ];
			
			for (var i:int = 0; i < ansArr.length; i++ )
			{
				ansArr[i].addEventListener(MouseEvent.MOUSE_DOWN, answerFunc);
				ansArr[i].buttonMode = true;
				firstArr[i].visible = false;
				secondArr[i].visible = false;
			}
			
			var randomObj:RandomPlus = new RandomPlus(5);
			randomNum = randomObj.getNum();
			firstArr[randomNum].x = 0;
			firstArr[randomNum].y = -80;
			firstArr[randomNum].visible = true;
		}
		
		
		
		private function answerFunc(ev:MouseEvent):void
		{
			if (ev.currentTarget == ansArr[randomNum])
			{
				trace("counter  "+counter)
				secondArr[randomNum].x = 0;
				secondArr[randomNum].y = -80;
				firstArr[randomNum].visible = false;
				secondArr[randomNum].visible = true;
				currentMovieClip = ev.currentTarget;
				soundControl = new SoundControl;
				soundControl.loadSound("correct.mp3", 1);
				addChild(soundControl);
				soundControl.soundPlay();
				if (counter == 2)
				{
					setTimeout(next, 2000);
				}
				else
				{
					setTimeout(second, 1000);
					counter ++;
				}
			}	
			else
			{
				currentMovieClip = ev.currentTarget;
				var glow:GlowFilter = new GlowFilter(); 
				glow.color = 0xFF0000; 
				glow.alpha = 1; 
				glow.blurX = 25; 
				glow.blurY = 25; 
				ev.currentTarget.filters = [glow];
				setTimeout(gaqroba, 100);
				soundControl = new SoundControl;
				soundControl.loadSound("error.mp3", 1);
				addChild(soundControl);
				soundControl.soundPlay();	
			}
		}

		private function gaqroba():void
			{
				var glow:GlowFilter = new GlowFilter(); 
				glow.color = 0xFF0000; 
				glow.alpha = 0; 
				glow.blurX = 0; 
				glow.blurY = 0; 
				currentMovieClip.filters = [glow];
			}
		
		private function next():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
			destroy();
		} //end next
		
		private function destroy():void
		{
			removeChild(all);
			all = null;
		}
		
		
	}
	
}
