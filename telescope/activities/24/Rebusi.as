package
{
	
	import adobe.utils.ProductManager;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.DataEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.setTimeout;
	
	public class Rebusi extends MovieClip
	{
		
		private var rebusi_Mc:MovieClip;
		
		private var hitClass:HitClass;
		private var hitClass1:HitClass;
		private var hitClass2:HitClass;
		private var hitClass3:HitForE;
		private var hitClass4:HitClass;
		private var hitClass5:HitClass;
		private var hitClass6:HitClass;
		private var hitClass7:HitClass;
		private var hitClass8:HitClass;
		private var hitClass9:HitClass;		
			
		private var ClassArray:Array;
		
		private var point:Point;
		private var count:int;
		private var sound:SoundControl;
		
		public function Rebusi()
		{
			addEventListener(Event.ADDED_TO_STAGE, init)
			addEventListener(Event.REMOVED_FROM_STAGE, Destroy)
		}
		
		private function Destroy(e:Event):void
		{
			try{
			removeEventListener(Event.REMOVED_FROM_STAGE, Destroy);
			for (var i:int = 0; i < ClassArray.length; i++)
			{
				ClassArray[i].removeEventListener(DataEvent.DATA, ShowTexts);
			}
			if (rebusi_Mc)
			{
				removeChild(rebusi_Mc);
			}
			}
			catch (e:Error)
			{
				
			}
			
		
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		
		}
		
		private function initHandler():void
		{
			rebusi_Mc = new Rebusi_Mc;
			rebusi_Mc.x = stage.stageWidth / 2;
			rebusi_Mc.y = stage.stageHeight / 2;
			rebusi_Mc.height = stage.stageHeight / 1.5;
			rebusi_Mc.scaleX = rebusi_Mc.scaleY;
			addChild(rebusi_Mc);		
			

			ClassArray = [hitClass = new HitClass(rebusi_Mc.hit1, rebusi_Mc.T),
			hitClass1 = new HitClass(rebusi_Mc.hit2, rebusi_Mc.e),			
			hitClass2 = new HitClass(rebusi_Mc.hit3, rebusi_Mc.l),	
			
			hitClass4 = new HitClass(rebusi_Mc.hit5, rebusi_Mc.s),
			hitClass5 = new HitClass(rebusi_Mc.hit6, rebusi_Mc.k),
			hitClass6 = new HitClass(rebusi_Mc.hit7, rebusi_Mc.o),
			hitClass7 = new HitClass(rebusi_Mc.hit8, rebusi_Mc.p),
			hitClass8 = new HitClass(rebusi_Mc.hit9, rebusi_Mc.i)]
			hitClass3 = new HitForE(rebusi_Mc.hit4, rebusi_Mc.e),
			hitClass3.addEventListener(DataEvent.DATA, ShowTextsE)
			for (var i:int = 0; i < ClassArray.length; i++)
			{
				ClassArray[i].addEventListener(DataEvent.DATA, ShowTexts);
			}			
		}		
		
		private function ShowTextsE(e:DataEvent):void 
		{			
			rebusi_Mc.hit4.box4.text = "ე";
			hitClass3.removeEventListener(DataEvent.DATA, ShowTextsE);
			hitClass3 = null;					
			count++;
			TheEnd();
		}
		
		private function ShowTexts(e:DataEvent):void
		{
			switch (e.data)
			{
				case "Showtt": 
					rebusi_Mc.hit1.box1.text = "ტ";
					hitClass.removeEventListener(DataEvent.DATA, ShowTexts);
					hitClass = null;					
					count++;
					TheEnd();
					break;
				case "Showe": 
					rebusi_Mc.hit2.box2.text = "ე";
					hitClass1.removeEventListener(DataEvent.DATA, ShowTexts);
					hitClass1 = null;					
					count++;
					TheEnd();
					break;
				case "Showl": 
					rebusi_Mc.hit3.box3.text = "ლ";
					hitClass2.removeEventListener(DataEvent.DATA, ShowTexts);
					hitClass2 = null;					
					count++;
					TheEnd();
					break;				
				case "Shows": 
					rebusi_Mc.hit5.box5.text = "ს";
					hitClass4.removeEventListener(DataEvent.DATA, ShowTexts);
					hitClass4 = null;					
					count++;
					TheEnd();
					break;
				case "Showk": 
					rebusi_Mc.hit6.box6.text = "კ";
					hitClass5.removeEventListener(DataEvent.DATA, ShowTexts);
					hitClass5 = null;					
					count++;
					TheEnd();
					break;
				case "Showo": 
					rebusi_Mc.hit7.box7.text = "ო";
					hitClass6.removeEventListener(DataEvent.DATA, ShowTexts);
					hitClass6 = null;					
					count++;
					TheEnd();
					break;
				case "Showp": 
					rebusi_Mc.hit8.box8.text = "პ";
					hitClass7.removeEventListener(DataEvent.DATA, ShowTexts);
					hitClass7 = null;					
					count++;
					TheEnd();
					break;
				case "Showi": 
					rebusi_Mc.hit9.box9.text = "ი";
					hitClass8.removeEventListener(DataEvent.DATA, ShowTexts);
					hitClass8 = null;					
					count++;
					TheEnd();
					break;
				
			}
		
		}
		private function TheEnd():void
		{
			if (count == 9)
			{
				sound = new SoundControl()
				sound.loadSound("correct.mp3", 1);
				sound.soundPlay();
				setTimeout(next, 1000)				
			}
		}
		
		private function next():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "EndOfGame"));
				
				Destroy(null);
		}
	}

}
