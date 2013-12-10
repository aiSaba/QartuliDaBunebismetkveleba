package  {
	
	import com.greensock.BlitMask;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import flash.filters.GlowFilter;
	import flash.events.DataEvent;
	
	
	public class AddBuildings extends MovieClip {
		
		private var all:MovieClip;
		private var correctArray:Array;
		private var wrongArray:Array;
		private var answerArray:Array;
		private var otherArray:Array;
		private var correctIndex:Number;
		private var soundControl:SoundControl;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var thirdStage:ThirdStage;
		private var currentMovieClip:Object;	
		
		public function AddBuildings(_stageWidth:Number=1024, _stageHeight:Number=768) 
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init)
			initializationBuildings();
		}
		
		private function initializationBuildings():void
		{		
			all = new ThirdStageObjects () as MovieClip;
			
			all.x = _stageWidth / 2;
			all.y = _stageHeight / 2;
			all.height = _stageHeight/1.1;
			all.scaleX = all.scaleY;
			addChild(all);
			all.visible = false;
			
			correctArray = [all.museum];
			wrongArray = [all.circus, all.police];
			answerArray = [all.museumText];
			otherArray = [all.theatre, all.school, all.house, all.hospital, all.fire];
			correctIndex = 0;
			correctArray[0].buttonMode = true;
			wrongArray[0].buttonMode = true;
			wrongArray[1].buttonMode = true;
			for (var i:int = 0; i < otherArray.length; i++ )
			{
				otherArray[i].buttonMode = true;
				otherArray[i].visible = false;
			}
			answerArray[0].visible = false;
			thirdStage = new ThirdStage();

			addRandom();
		}

		
		private function addRandom():void
		{
			
			
			var rand = 0;
			var randomOther:Number = Math.random() * 2;
			var random1:RandomPlus = new RandomPlus(1);
			var randomOtherIndex:RandomPlus = new RandomPlus(4);
			
			
			for (var i:int; i < wrongArray.length; i++ )
			{
				var rand1:Number = random1.getNum();				
				swap(correctArray[rand], wrongArray [rand1]);
				
			}
		
			
			if (randomOther < 1)
			{
				
				var randIndex1:Number = randomOtherIndex.getNum();
				otherArray[randIndex1].x = wrongArray[0].x;
				otherArray[randIndex1].y = wrongArray[0].y;
				otherArray[randIndex1].visible = true;
				
			}
			
			if (randomOther > 1  && randomOther < 2)
			{
				var randIndex2:Number = randomOtherIndex.getNum();
				otherArray[randIndex2].x = wrongArray[1].x;
				otherArray[randIndex2].y = wrongArray[1].y;
				otherArray[randIndex2].visible = true;		
			}
			all.visible = true;
			
			addListeners();
			
		}/// end addRandom
		
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
		
		
		private function addListeners():void
		{
				
			for (var j:int = 0; j < correctArray.length; j++ )
			{
				
				correctArray[j].buttonMode = true;
				correctArray[j].addEventListener(MouseEvent.MOUSE_DOWN, correctFunc);	
			}
			
			for (var i:int = 0; i < wrongArray.length; i++ )
			{
				wrongArray[j].buttonMode = true;
				wrongArray[i].addEventListener(MouseEvent.MOUSE_DOWN, wrongFunc);
				
			}
			
			for (var k:int = 0; k < otherArray.length; k++ )
			{
				otherArray[k].buttonMode = true;
				otherArray[k].addEventListener(MouseEvent.MOUSE_DOWN, wrongFunc);
			}

		}/// end addListeners
		
		
		private function wrongFunc(ev:MouseEvent):void
		{
			currentMovieClip = ev.currentTarget;
			var glow:GlowFilter = new GlowFilter(); 
			glow.color = 0xFF0000; 
			glow.alpha = 1; 
			glow.blurX = 25; 
			glow.blurY = 25; 
			ev.currentTarget.filters = [glow];
			setTimeout(gaqroba, 1000);
			soundControl = new SoundControl;
			soundControl.loadSound("error.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
				
			
		}//end wrongFunc
		
			private function gaqroba():void
			{
				var glow:GlowFilter = new GlowFilter(); 
				glow.color = 0xFF0000; 
				glow.alpha = 0; 
				glow.blurX = 0; 
				glow.blurY = 0; 
				currentMovieClip.filters = [glow];
			}
		
		private function correctFunc(ev:MouseEvent):void
		{
			currentMovieClip = ev.currentTarget;
			
			soundControl = new SoundControl;
			soundControl.loadSound("correct.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
			
			correctIndex++;
			for (var i:int = 0; i < correctArray.length; i++ )
			{	
				if (ev.currentTarget == correctArray[i])
				{	
					answerArray[i].x = correctArray[i].x;
					answerArray[i].y = correctArray[i].y;
					answerArray[i].visible = true;
				}
			}
			if (correctIndex == 1)
			{
				setTimeout(next, 2500);
			}
			
		}///end correctFunc
		
	
		private function next():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
			destroy();
		}
		
		private function destroy():void
		{
			
			for (var j:int = 0; j < correctArray.length; j++ )
			{
				correctArray[j].removeEventListener(MouseEvent.MOUSE_DOWN, correctFunc);	
			}
			
			for (var i:int = 0; i < wrongArray.length; i++ )
			{
				wrongArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, wrongFunc);
				
			}
			
			for (var k:int = 0; k < otherArray.length; k++ )
			{
				otherArray[k].removeEventListener(MouseEvent.MOUSE_DOWN, wrongFunc);
			}
			
			removeChild(all);
			all = null;
		}
	}
	
}
