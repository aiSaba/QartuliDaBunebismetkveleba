package
{
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.utils.setTimeout;
	import com.greensock.*
	import com.greensock.easing.*
	
	public class MainTask extends MovieClip
	{
		
		private var zgarbiObjects:MovieClip;
		private var zgarbi:MovieClip;
		private var textFrame:MovieClip;
		
		private var mainObjects:MovieClip;
		
		private var varsk0:MovieClip;
		private var varsk1:MovieClip;
		private var varsk2:MovieClip;
		private var varsk3:MovieClip;
		private var varsk4:MovieClip;
		private var varsk5:MovieClip;
		private var varsk6:MovieClip;
		private var varsk7:MovieClip;
		
		private var varsk0a:MovieClip;
		private var varsk1a:MovieClip;
		private var varsk2a:MovieClip;
		private var varsk3a:MovieClip;
		private var varsk4a:MovieClip;
		private var varsk5a:MovieClip;
		private var varsk6a:MovieClip;
		private var varsk7a:MovieClip;
		
		private var varskArray:Array;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function MainTask(_stageHeight, _stageWidth)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		private function destroy(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
			TweenMax.killTweensOf(zgarbi);
			TweenMax.killTweensOf(textFrame);
			
			if (zgarbiObjects)
			{
				removeChild(zgarbiObjects);
				zgarbiObjects = null;
			}
			//if (mainObjects)
			//{
			//removeChild(mainObjects);
			//mainObjects = null;
			//}
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addZgarbi();
		}
		
		private function addZgarbi():void
		{
			setTimeout(sendData, 50);
			
			zgarbiObjects = new Level2Objects();
			
			zgarbiObjects.x = _stageWidth / 2;
			zgarbiObjects.y = _stageHeight / 2;
			
			zgarbiObjects.height = _stageHeight / 1.5;
			zgarbiObjects.scaleX = zgarbiObjects.scaleY;
			
			addChild(zgarbiObjects);
			zgarbi = zgarbiObjects.zgarbi;
			textFrame = zgarbiObjects.textFrame;
			
			zgarbi.alpha = 0;
			textFrame.alpha = 0;
			
			animZgarbi();
		}
		
		private function sendData():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
		}
		
		private function animZgarbi():void
		{
			TweenMax.fromTo(zgarbi, 1, {x: zgarbi.x, y: (2 * _stageHeight)}, {x: zgarbi.x, y: zgarbi.y, alpha: 1, onComplete: addText});
		}
		
		private function addText():void
		{
			//soundControl1 = new SoundControl();
			//addChild(soundControl1);
			//soundControl1.loadSound("02_aqtivoba.mp3", 1);
			//soundControl1.soundPlay();
			var zgarbiSound:Sound = new Sound(new URLRequest("sounds/23.mp3")); 
			zgarbiSound.play();
			TweenMax.to(textFrame, 0.5, {alpha: 1, onComplete: timerFunc});
		}
		
		private function timerFunc():void
		{
			setTimeout(startLevel, 2000);
		}
		
		private function startLevel():void
		{
			removeChild(zgarbiObjects);
			zgarbiObjects = null;
			
			mainObjects = new MainObjects();
			mainObjects.x = _stageWidth / 2;
			mainObjects.y = _stageHeight / 2;
			mainObjects.alpha = 0;
			addChild(mainObjects);
			TweenMax.to(mainObjects, 1, {alpha: 1});
			mainObjects.height = _stageHeight / 1.5;
			mainObjects.scaleX = mainObjects.scaleY;
			
			mainObjects.takePhoto.addEventListener(MouseEvent.MOUSE_DOWN, takePhotoFunc);
			mainObjects.nextExam.addEventListener(MouseEvent.MOUSE_DOWN, nextExamF);
			
			
			//////////////////
			varsk0 = mainObjects.varsk0;
			varsk1 = mainObjects.varsk1;
			varsk2 = mainObjects.varsk2;
			varsk3 = mainObjects.varsk3;
			varsk4 = mainObjects.varsk4;
			varsk5 = mainObjects.varsk5;
			varsk6 = mainObjects.varsk6;
			varsk7 = mainObjects.varsk7;
		
			
			varskArray = [varsk0, varsk1, varsk2, varsk3, varsk4, varsk5, varsk6, varsk7];
			
			for (var i:int = 0; i < varskArray.length; i++)
			{
				varskArray[i].buttonMode = true;
				varskArray[i].addEventListener(MouseEvent.MOUSE_DOWN, addStar);
			}
		}
		
		private function nextExamF(e:MouseEvent):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"));
		}
		
		private function takePhotoFunc(e:MouseEvent):void 
		{
			var scr:Raghats = new Raghats(stage);
			//addChild(scr);
		}
		
		private function addStar(e:MouseEvent):void
		{
			switch (e.currentTarget)
			{
				case varsk0: 
					varsk0a = new Varsk0();
					addChild(varsk0a);
					coordinateMc(varsk0a);
					
					varsk0a.addEventListener(MouseEvent.MOUSE_DOWN, startDragFunc);
					varsk0a.addEventListener(MouseEvent.MOUSE_UP, stopDragFunc);
					break;
				case varsk1: 
					varsk1a = new Varsk1();
					addChild(varsk1a);
					coordinateMc(varsk1a);
					
					varsk1a.addEventListener(MouseEvent.MOUSE_DOWN, startDragFunc);
					varsk1a.addEventListener(MouseEvent.MOUSE_UP, stopDragFunc);
					break;
				case varsk2: 
					varsk2a = new Varsk2();
					addChild(varsk2a);
					coordinateMc(varsk2a);
					
					varsk2a.addEventListener(MouseEvent.MOUSE_DOWN, startDragFunc);
					varsk2a.addEventListener(MouseEvent.MOUSE_UP, stopDragFunc);
					break;
				case varsk3: 
					varsk3a = new Varsk3();
					addChild(varsk3a);
					coordinateMc(varsk3a);
					
					varsk3a.addEventListener(MouseEvent.MOUSE_DOWN, startDragFunc);
					varsk3a.addEventListener(MouseEvent.MOUSE_UP, stopDragFunc);
					break;
				case varsk4: 
					varsk4a = new Varsk4();
					addChild(varsk4a);
					coordinateMc(varsk4a);
					
					varsk4a.addEventListener(MouseEvent.MOUSE_DOWN, startDragFunc);
					varsk4a.addEventListener(MouseEvent.MOUSE_UP, stopDragFunc);
					break;
				case varsk5: 
					varsk5a = new Varsk5();
					addChild(varsk5a);
					coordinateMc(varsk5a);
					
					varsk5a.addEventListener(MouseEvent.MOUSE_DOWN, startDragFunc);
					varsk5a.addEventListener(MouseEvent.MOUSE_UP, stopDragFunc);
					break;
				case varsk6: 
					varsk6a = new Varsk6();
					addChild(varsk6a);
					coordinateMc(varsk6a);
					
					varsk6a.addEventListener(MouseEvent.MOUSE_DOWN, startDragFunc);
					varsk6a.addEventListener(MouseEvent.MOUSE_UP, stopDragFunc);
					break;
				case varsk7: 
					varsk7a = new Varsk7();
					addChild(varsk7a);
					coordinateMc(varsk7a);
					
					varsk7a.addEventListener(MouseEvent.MOUSE_DOWN, startDragFunc);
					varsk7a.addEventListener(MouseEvent.MOUSE_UP, stopDragFunc);
					break;
			
			}
		}
		
		private function coordinateMc(mc:MovieClip):void
		{
			mc.x = mouseX;
			mc.y = mouseY;
			
			//mc.height = _stageHeight / 15;
			//mc.scaleX = mc.scaleY;
		}
		
		private function startDragFunc(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
		}
		
		private function stopDragFunc(e:MouseEvent):void
		{
			e.currentTarget.stopDrag();
		}
	}

}
