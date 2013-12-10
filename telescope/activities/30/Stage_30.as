package {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.utils.*;
	import flash.events.DataEvent;
	import flash.display.StageScaleMode;
	
	public class Stage_30 extends MovieClip 
	{
		private var litter:MovieClip;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var blurX:Number;
		private var blurY:Number;
		private var soundControl:SoundControl;
		private var randomPlus:RandomPlus;
		private var randomText:int;
		private var currentTarget:Array;
		private	var trashArray:Array;
		private var scoreCounter:int
		private var startPosX:Number;
		private var startPosY:Number;
		private var qula:int
		
		public function Stage_30 (_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			YvelaferiFunc();
		}
		private function YvelaferiFunc():void
		{
			litter = new Litter();
			addChild(litter);
			litter.x = _stageWidth / 2;
			litter.y = _stageHeight / 2;
			litter.height = _stageHeight/1.5;
			litter.scaleX = litter.scaleY;
			
			trashArray = [litter.Wheel, litter.Ball, litter.Coke, litter.Apple, litter.Bottle, litter.Bag, litter.Shoes, litter.NewsPaper, litter.Banana]
			
			for (var i:int = 0; i < trashArray.length; i++)
			{
				trashArray[i].addEventListener(MouseEvent.MOUSE_DOWN, dragObject);
				trashArray[i].addEventListener(MouseEvent.MOUSE_UP, touch);
			}	
		}
		private function dragObject(e:MouseEvent):void
		{
			startPosX = e.currentTarget.x;
			startPosY = e.currentTarget.y;
			e.currentTarget.startDrag();
		}
		private function touch(e:MouseEvent):void 
		{
			if (e.currentTarget.hitTestObject(litter.Bin.bin_top)) 
			{
			TweenMax.to(e.currentTarget, 1, { x:litter.Bin.x, y:litter.Bin.y, scaleX:0.5, scaleY:0.5, rotation:360, alpha:2.6 } );
			TweenMax.to(e.currentTarget, 1, {alpha:0});
			e.currentTarget.stopDrag();
			CorrecteFunc();
			}
			else
			{
				TweenMax.to(e.currentTarget, 0.5, {glowFilter:{color:0xff0000, alpha:1, blurX:15, blurY:15, remove:true}});
				TweenLite.to(e.currentTarget, 0.5, {x:startPosX, y:startPosY});
				e.currentTarget.stopDrag();
				IncorrectSound();
				
			}
		}
		private function CorrecteFunc()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("trash.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			scoreCounter++;
			if (scoreCounter == 9)
			{
				ClapSound();
				setTimeout(destroyCaller, 1500)
			}
		}
		private function ClapSound()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("clap.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
			
		}
				private function IncorrectSound()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("error.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
		}
		private function destroyCaller()
		{
			destroy();
		}
		
		private function destroy ()
		{
			
			if (litter)
			{
				removeChild(litter);
				litter = null;
			}
			clearTimeout(1);
			TweenMax.killAll();
			
			for (var i:int = 0; i < trashArray.length; i++)
			{
				trashArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, dragObject);
				trashArray[i].removeEventListener(MouseEvent.MOUSE_UP, touch);
			}
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
			
			
		}
	}
}

