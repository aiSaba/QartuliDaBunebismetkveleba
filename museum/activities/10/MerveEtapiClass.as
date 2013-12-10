package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.*;
	import flash.events.DataEvent;

	
	public class MerveEtapiClass extends MovieClip
	{
		private var mecxreEtapi:MovieClip;
		private var imageArray:Array;
		private var imageTextArray:Array;
		private var randomPlus:RandomPlus;
		private var randomNumb:Number;
		private var imageYarray:Array;
		private var imageXarray:Array;
		private var iamgetextXarray:Array;
		private var imagetextYarray:Array;
		
		
		
		
		public static var count:int;
		
		private var dragging:StartStopHitClass1;
		private var soundControl2:SoundControl;
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		public function MerveEtapiClass(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, initHandler)
		}
		
		private function initHandler(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initHandler)
			initMecxreEtapi();
		}
		
		private function initMecxreEtapi():void
		{
			
			
			mecxreEtapi = new MerverEtapi();
			mecxreEtapi.x = _stageWidth / 2;
			mecxreEtapi.y = _stageHeight / 2;
			mecxreEtapi.height = _stageHeight / 1.3;
			mecxreEtapi.scaleX = mecxreEtapi.scaleY;
			
			
			
			imageArray = [mecxreEtapi.plane, mecxreEtapi.phone, mecxreEtapi.clock, mecxreEtapi.durbindi]
			imageTextArray = [mecxreEtapi.planetext, mecxreEtapi.phonetext, mecxreEtapi.clocktext, mecxreEtapi.durbinditext]
			
			imageXarray = [mecxreEtapi.plane.x, mecxreEtapi.phone.x, mecxreEtapi.clock.x, mecxreEtapi.durbindi.x]
			imageYarray = [mecxreEtapi.plane.y, mecxreEtapi.phone.y, mecxreEtapi.clock.y, mecxreEtapi.durbindi.y]
			
			imagetextYarray = [mecxreEtapi.planetext.y, mecxreEtapi.phonetext.y, mecxreEtapi.clocktext.y, mecxreEtapi.durbinditext.y];
			iamgetextXarray = [mecxreEtapi.planetext.x, mecxreEtapi.phonetext.x, mecxreEtapi.clocktext.x, mecxreEtapi.durbinditext.x];
			
			addChild(mecxreEtapi);
			
			
			randomPlus = new RandomPlus(3);
			
			for (var i:int = 0; i < 4; i++)
			{
				randomNumb = randomPlus.getNum();
				imageArray[i].buttonMode = true;
				imageArray[randomNumb].x = imageXarray[i];
				imageArray[randomNumb].y = imageYarray[i];
				
				imageTextArray[randomNumb].x = iamgetextXarray[i];
				imageTextArray[randomNumb].y = imagetextYarray[i];
				
				dragging = new StartStopHitClass1(imageArray[i], imageTextArray[i]);
				
				
				
				dragging.addEventListener(DataEvent.DATA, dataEventListener, false, 0, true);
				
			}
		
		}
		
		private function dataEventListener(e:DataEvent):void
		{
			if (e.data == "movrchiscenas")
			{
				soundControl2 = new SoundControl;
				soundControl2.loadSound("correct.mp3", 1);
				addChild(soundControl2);
				soundControl2.soundPlay();
				
				setTimeout(nextStage, 2000);
			}
		}
		
		private function nextStage():void
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "EndOFClass" ));
			destroy()			
		}
		
		private function destroy():void
		{			
			removeChild(mecxreEtapi);
			mecxreEtapi = null;
			dragging = null;
		}
	
	}

}
