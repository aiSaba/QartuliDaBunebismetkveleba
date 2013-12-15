package
{
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.*;
	
	public class Stage_44 extends MovieClip
	{
		
		private var flags:MovieClip;
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var k:Number = 1;
		private var virtualFlag:MovieClip;
		private var screenShot:ScreenShot;
		private var soundControl:SoundControl;
		private var PosX:int;
		private var PosY:int;
		private var newFlag:MovieClip;
		
		private var flagArray:Array = new Array();
		private var i:int = new int();
		
		public function Stage_44(_stageWidth:Number = 1024, _stageHeight:Number = 768)
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
			addStage();
			flags.MoonAndFlags.flag_mc.buttonMode = true
			flags.camera_mc.buttonMode = true
			
			flags.MoonAndFlags.flag_mc.addEventListener(MouseEvent.MOUSE_DOWN, flagCopyFunc);
			flags.MoonAndFlags.flag_mc.addEventListener(MouseEvent.MOUSE_UP, StopDragFunc);
			flags.camera_mc.addEventListener(MouseEvent.CLICK, takePhotoFunc);
		
		}
		
		private function flagCopyFunc(e:MouseEvent):void
		{
			
			newFlag = new CopyFlag();
			addChild(newFlag)
			newFlag.name = ("flag" + i.toString());
			
			i++;
			
			flagArray.push(newFlag);
			
			
			
			newFlag.x = mouseX;
			
			newFlag.y = mouseY;
			TweenLite.to(newFlag, 0, {x: mouseX, y: mouseY + 15, scaleX: 0.5, scaleY: 0.5});
			
			newFlag.addEventListener(MouseEvent.MOUSE_OVER, DragFunc);
			newFlag.addEventListener(MouseEvent.MOUSE_UP, StopDragFunc);
			flags.krater.text = k
			k++
		}
		
		private function DragFunc(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
			e.currentTarget.removeEventListener(MouseEvent.MOUSE_OVER, DragFunc);
			e.currentTarget.addEventListener(MouseEvent.MOUSE_DOWN, DragFunc);
		}
		
		private function StopDragFunc(e:MouseEvent):void
		{
			e.currentTarget.stopDrag();
			CorrectSound();
		}
		
		private function destroy()
		{
			
			TweenMax.killAll();
			
			if (flags)
			{
				flags.MoonAndFlags.flag_mc.removeEventListener(MouseEvent.MOUSE_DOWN, flagCopyFunc);
				flags.MoonAndFlags.flag_mc.removeEventListener(MouseEvent.MOUSE_UP, StopDragFunc);
				flags.camera_mc.removeEventListener(MouseEvent.CLICK, takePhotoFunc);
				removeChild(flags);
				flags = null;
			}
			
			//for (var i:int = 0; i < flagArray.length; i++)
			//{
				//removeChild(flagArray[i]);
				//flagArray[i] = null;
		//	}
			
			exit(null)
		
		}
		
		private function takePhotoFunc(e:MouseEvent):void
		{
			screenShot = new ScreenShot(stage);
			SnapSound();
		}
		
		private function addStage():void
		{
			flags = new Flags();
			addChild(flags);
			flags.nxt.buttonMode= true
			flags.nxt.addEventListener(MouseEvent.MOUSE_DOWN, exit);
			
			flags.x = _stageWidth / 2;
			flags.y = _stageHeight / 2;
			flags.height = _stageHeight / 1.5;
			flags.scaleX = flags.scaleY;
		}
		
		private function exit(e:*):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
		}
		
		private function SnapSound()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("snapshot.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
			setTimeout(destroy, 1500)
		
		}
		
		private function CorrectSound()
		{
			soundControl = new SoundControl();
			soundControl.loadSound("correct.mp3", 1);
			addChild(soundControl);
			soundControl.soundPlay();
		
		}
	
	}
}