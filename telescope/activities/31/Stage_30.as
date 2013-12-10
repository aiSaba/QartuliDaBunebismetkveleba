package
{
	import flash.utils.getDefinitionByName;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.events.DataEvent;
	import flash.display.DisplayObject;
	
	public class Stage_30 extends MovieClip
	{
		
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var park_mc:MovieClip;
		private var signsArray:Array;
		private var scoreCounter:int;
		private var startPosX:Number;
		private var startPosY:Number;
		private var soundControl:SoundControl;
		private var qula:int;
		
		public function Stage_30(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			allFunc();
		}
		
		private function allFunc():void
		{
			park_mc = new Park_mc();
			addChild(park_mc);
			
			park_mc.x = _stageWidth / 2;
			park_mc.y = _stageHeight / 2;
			park_mc.height = _stageHeight / 1.5;
			park_mc.scaleX = park_mc.scaleY;
			
			signsArray = [park_mc.NoSwimming_mc, park_mc.NoFishing_mc, park_mc.NoParking_mc, park_mc.NoPoluting_mc, park_mc.NoFiring_mc, park_mc.NoWatering_mc, park_mc.NoDog_mc, park_mc.NoFeeding_mc, park_mc.NoWalking_mc];
			
			for (var i:int = 0; i < signsArray.length; i++)
			{
				signsArray[i].addEventListener(MouseEvent.MOUSE_DOWN, DragFunc)
				signsArray[i].addEventListener(MouseEvent.MOUSE_UP, DropFunc)
			}
		}
		
		private function DragFunc(event:MouseEvent):void
		{
			event.target.parent.addChild(event.target);
			startPosX = event.currentTarget.x;
			startPosY = event.currentTarget.y;
			event.currentTarget.startDrag();
		}
		
		private function DropFunc(event:MouseEvent):void
		{
			trace(event.target.name)
			var myTargetName:String = "Target_" + event.target.name;
			var targetBox:MovieClip = park_mc.getChildByName(myTargetName) as MovieClip
			
			if (event.currentTarget.hitTestObject(targetBox) && event.target.dropTarget != null )
			{
				TweenMax.to(event.currentTarget, 1, {glowFilter:{color:0x91e600, alpha:1, blurX:15, blurY:15, remove:true}});
				event.target.buttonMode = false;
				
				event.target.x = targetBox.x;
				event.target.y = targetBox.y;
				event.target.stopDrag();
				event.target.MouseEnablet = false
				CorrectSound();
				
			}
			else
			{
				TweenMax.to(event.currentTarget, 1, {glowFilter:{color:0xff0000, alpha:1, blurX:15, blurY:15, remove:true}});
				//event.currentTarget.x = startPosX;
				//event.currentTarget.y = startPosY;
				TweenLite.to(event.currentTarget, 1, {x:startPosX, y:startPosY});
				event.currentTarget.stopDrag();
				IncorrectSound();
				
			}
			
			
		}
		private function CorrectSound()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 0.5);
			addChild(soundControl);
			soundControl.soundPlay();
			scoreCounter++
			if (scoreCounter == 9)
			{
				ClapSound();
				setTimeout(destroy, 1500)
				
			}
			trace(scoreCounter)
		}
		
		private function IncorrectSound()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("error.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
		}
			private function ClapSound()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("clap.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
		}
		
		private function destroy ():void
		{
			for (var i:int = 0; i < signsArray.length; i++)
			{
				signsArray[i].removeEventListener(MouseEvent.MOUSE_DOWN, DragFunc)
				signsArray[i].removeEventListener(MouseEvent.MOUSE_UP, DropFunc)
			}
						if (park_mc)
			{
				removeChild(park_mc);
				park_mc = null;
			}
			
			TweenMax.killAll();
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false,"endOfScene" ));
		}
	
	}
}