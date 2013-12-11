package
{
	import flash.display.MovieClip;
	//import flash.display3D.IndexBuffer3D;
	import flash.events.Event;
	import flash.utils.*;
	import flash.events.DataEvent;
	
	public class MeshvideEtapiClass extends MovieClip
	{
		private var mecxreEtapi:MovieClip;
		
		private var Drugging3:StartStopHitClass;
		
		private var textDrag:StartStopHitClass;
		
		private var ImageDragigng:ImageDrag;
		private var forDispach:ImageDrag;
		
		///arrays
		private var hitArray:Array;
		private var imageArray:Array;
		private var textArray:Array;
		private var textBoxArray:Array;
		private var Xarray:Array;
		private var Yarray:Array;
		
		private var textXarray:Array;
		private var textYarray:Array;
		
		private var ganmartebaXArray:Array;
		private var ganmartebaText:Array;
		
		private var imageHitArray:Array;
		
		private var Numb:Number;
		private var Numb1:Number;
		
		private var Hmm:Boolean;
		private var Omg:Boolean;
		
		public static var movrchi:String;
		private var soundControl2:SoundControl;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
	
		
		public function MeshvideEtapiClass(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, initHandler, false, 0, true)
		}
		
		private function initHandler(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initMecxreEtapi();
		}
		
		private function initMecxreEtapi():void
		{
			
			mecxreEtapi = new MeshvideEtapi();
			//
			mecxreEtapi.x = _stageWidth / 2;
			mecxreEtapi.y = _stageHeight / 2;
			
			mecxreEtapi.height = _stageHeight / 1.3;
			mecxreEtapi.scaleX = mecxreEtapi.scaleY;
			
			mecxreEtapi.first.alpha = 0;
			mecxreEtapi.second.alpha = 0;
			mecxreEtapi.third.alpha = 0;
			mecxreEtapi.fourth.alpha = 0;
			
			//suratebis array
			imageArray = [mecxreEtapi.saati, mecxreEtapi.plane, mecxreEtapi.durbindi, mecxreEtapi.teleponi];
			
			//ganmartebebis fonis array
			textArray = [mecxreEtapi.firstImageText, mecxreEtapi.secondImageText, mecxreEtapi.thirdImageText, mecxreEtapi.fourthImageText];
			
			//koordinatebis array sadac suratebi jdeba
			Xarray = [-389, -37, 143, 274];
			Yarray = [-283, -283, -275, -267];
			
			//ganmartebebi textboxebi
			ganmartebaText = [mecxreEtapi.firstText, mecxreEtapi.secondText, mecxreEtapi.thirdText, mecxreEtapi.fourthText];
			
			//is adgili sadac surati unda chajdes
			imageHitArray = [mecxreEtapi.first, mecxreEtapi.second, mecxreEtapi.third, mecxreEtapi.fourth];
			
			//adgili sadac texsti unda chajdes			
			hitArray = [mecxreEtapi.hit1, mecxreEtapi.hit2, mecxreEtapi.hit3, mecxreEtapi.hit4];
			
			//sityvebis array
			textBoxArray = [mecxreEtapi.saatiText, mecxreEtapi.planeText, mecxreEtapi.durbindiText, mecxreEtapi.teleponiText]
			
			textXarray = [-224, -224, 426, 426];
			textYarray = [-291, -230, -291, -230];
			
			addChild(mecxreEtapi);
			
			First();
			Hmm = false;
			Omg = false;
		
		}
		
		private function First():void
		{
			///random nambers
			var random1:RandomPlus = new RandomPlus(3);
			var random2:RandomPlus = new RandomPlus(3);
			for (var i:int = 0; i < 4; i++)
			{
				imageArray[i].buttonMode = true;
				Numb = random1.getNum();
				Numb1 = random2.getNum();
				imageArray[Numb1].x = Xarray[i];
				imageArray[Numb1].y = Yarray[i];
				
				ganmartebaText[i].x = textArray[Numb].x - textArray[Numb].width / 2 + 5;
				ganmartebaText[i].y = 204.6 - textArray[i].height / 2;
				
				textBoxArray[Numb].x = textXarray[i];
				textBoxArray[Numb].y = textYarray[i];
				
				textDrag = new StartStopHitClass(textBoxArray[i], hitArray[Numb]);
				
				ImageDragigng = new ImageDrag(imageArray[i], imageHitArray[Numb], textArray[Numb]);
				textDrag.addEventListener(DataEvent.DATA, dataEventListener);
				ImageDragigng.addEventListener(DataEvent.DATA, dataEventListener1);
			}
		
		}
		
		private function dataEventListener1(e:DataEvent):void
		{
			if (e.data == "Movrchi Suratebs")
			{
				
				Hmm = true;
				fornextStage();
			}
		}
		
		private function fornextStage():void
		{
			if (Omg && Hmm)
			{
				soundControl2 = new SoundControl;
				soundControl2.loadSound("correct.mp3", 1);
				addChild(soundControl2);
				soundControl2.soundPlay();
				
				setTimeout(nextStage, 2000);
				
			}
		}
		
		private function dataEventListener(e:DataEvent):void
		{
			
			if (e.data == "movrchi scenas")
			{
				Omg = true
				fornextStage();
			}
		}
		
		private function nextStage():void
		{
			
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "EndOFClass"));
			destroy();
		
		}
		
		private function destroy():void
		{
			
			if (mecxreEtapi)
			{
				removeChild(mecxreEtapi);
				mecxreEtapi = null;
			}
			
			//ImageDragigng = null;
			//textDrag = null;
		}
	
	}

}
