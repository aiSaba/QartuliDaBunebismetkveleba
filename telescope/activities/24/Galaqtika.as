package  {
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	
	public class Galaqtika extends MovieClip 
	{
		private var galaqtika:MovieClip;
		
		private var HitClass:HitClass1;
		private var HitClass11:HitClass1;
		private var HitClass2:HitClass1;
		private var HitClass3:HitForA;
		private var HitClass4:HitClass1;
		private var HitClass5:HitClass1;
		private var HitClass6:HitClass1;
		private var HitClass7:HitClass1;
		private var HitClass8:HitForA;
		private var HitClass9:HitClass1;	
		
		private var ClassArray:Array;
		
		
		private var count:int;
		private var sound:SoundControl;

		
		
		
		
		public function Galaqtika() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.REMOVED_FROM_STAGE, Destroy)
		}
		
		private function Destroy(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, Destroy);
			for (var i:int = 0; i < ClassArray.length; i++)
			{
				ClassArray[i].removeEventListener(DataEvent.DATA, ShowTexts);
			}
			if (galaqtika)
			{
				removeChild(galaqtika);
			}
			
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
			
		}
		
		private function initHandler():void 
		{
			galaqtika = new GalaqtikaMc;
			galaqtika.x = stage.stageWidth / 2;
			galaqtika.y = stage.stageHeight / 2;
			galaqtika.height = stage.stageHeight / 1.5;
			galaqtika.scaleX = galaqtika.scaleY;
			
			addChild(galaqtika);
			ClassArray = [HitClass = new HitClass1(galaqtika.hit1, galaqtika.g),
			HitClass11 = new HitClass1(galaqtika.hit2, galaqtika.a),			
			HitClass2 = new HitClass1(galaqtika.hit3, galaqtika.l),	
			
			HitClass4 = new HitClass1(galaqtika.hit5, galaqtika.q),
			HitClass5 = new HitClass1(galaqtika.hit6, galaqtika.T),
			HitClass6 = new HitClass1(galaqtika.hit7, galaqtika.i),
			HitClass7 = new HitClass1(galaqtika.hit8, galaqtika.k)]
			
			
			
			HitClass3 = new HitForA(galaqtika.hit4, galaqtika.a)
			HitClass3.addEventListener(DataEvent.DATA, ShowTextsE)
			
			HitClass8 = new HitForA(galaqtika.hit9, galaqtika.a)
			HitClass8.addEventListener(DataEvent.DATA, ShowTextsE)
			
			
			for (var i:int = 0; i < ClassArray.length; i++)
			{
				ClassArray[i].addEventListener(DataEvent.DATA, ShowTexts);
			}
			
			
			
		}
		private function ShowTextsE(e:DataEvent):void 
		{	
			if (e.data == "Showa2")
			{
				galaqtika.hit4.box4.text = "ა";
				HitClass3.removeEventListener(DataEvent.DATA, ShowTextsE);
				HitClass3 = null;
				count++;
				TheEnd();
			}
			if (e.data == "Showa3")
			{
				galaqtika.hit9.box9.text = "ა";
				HitClass8.removeEventListener(DataEvent.DATA, ShowTextsE);
				HitClass8 = null;
				count++;
				TheEnd();
			}
		}
		
		private function ShowTexts(e:DataEvent):void
		{
			
			switch (e.data)
			{
				case "Showtt": 
					galaqtika.hit1.box1.text = "გ";
					HitClass.removeEventListener(DataEvent.DATA, ShowTexts);
					HitClass = null;					
					count++;
					TheEnd();
					break;
				case "Showe": 
					galaqtika.hit2.box2.text = "ა";	
					HitClass11.removeEventListener(DataEvent.DATA, ShowTexts);
					HitClass11 = null;
					count++;
					TheEnd();
					break;
				case "Showl": 
					galaqtika.hit3.box3.text = "ლ";
					HitClass2.removeEventListener(DataEvent.DATA, ShowTexts);
					HitClass2 = null;
					count++;
					TheEnd();
					break;				
				case "Shows": 
					galaqtika.hit5.box5.text = "ქ";
					HitClass4.removeEventListener(DataEvent.DATA, ShowTexts);
					HitClass4 = null;
					count++;
					TheEnd();
					break;
				case "Showk": 
					galaqtika.hit6.box6.text = "ტ";
					HitClass5.removeEventListener(DataEvent.DATA, ShowTexts);
					HitClass5 = null;
					count++;
					TheEnd();
					break;
				case "Showo": 
					galaqtika.hit7.box7.text = "ი";					
					HitClass6.removeEventListener(DataEvent.DATA, ShowTexts);
					HitClass6 = null;
					count++;
					TheEnd();
					break;
				case "Showp": 
					galaqtika.hit8.box8.text = "კ";
					HitClass7.removeEventListener(DataEvent.DATA, ShowTexts);
					HitClass7 = null;
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
				setTimeout(next, 1000);				
			}
		}
		
		private function next():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "EndOfGame"));
				Destroy(null);
		}
	}
	
}
