package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.*;
	import flash.events.DataEvent;
	import flash.events.MouseEvent;
	
	public class MeeqvseEtapiBrazi extends MovieClip
	{
		private var brazi:MovieClip;
		
		private var Draging:StartStopHit3;
		private var Draging1:StartStopHitClass4;
		private var Draging3:StartStopHitClass2;
		
		private var wrongArray:Array;
		private var wrong:SoundControl;
		
		private var bool1:Boolean;
		private var bool2:Boolean;
		private var bool3:Boolean;
		
		private var _stageHeight:Number;
		private var _stageWidth:Number;
		
		private var randFuncArray:Array;
		
		private var soundControl2:SoundControl;
		
		private var randNumb:Number;
		
		public function MeeqvseEtapiBrazi(_stageWidth:Number = 1024, _stageHeight:Number = 768)
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, initHandler)
		}
		
		private function initHandler(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initHandler);
			initMeeqvseetapi();
		}
		
		private function initMeeqvseetapi():void
		{
			brazi = new BraziMc();
			addChild(brazi);
			brazi.x = _stageWidth / 2;
			brazi.y = _stageHeight / 2;
			
			brazi.height = _stageHeight / 1.5;
			brazi.scaleX = brazi.scaleY;
			
			wrongArray = [brazi.me, brazi.u, brazi.ga, brazi.gamo, brazi.da, brazi.mo, brazi.ur, brazi.es, brazi.man, brazi.osan, brazi.ovan, brazi.ier, brazi.ul, brazi.ian, brazi.a, brazi.sae, brazi.sao, brazi.moo, brazi.mel, brazi.ues]
			
			for (var i:int; i < wrongArray.length; i++)
			{
				wrongArray[i].buttonMode = true;
				wrongArray[i].addEventListener(MouseEvent.MOUSE_DOWN, wrongFunckHandler);
			}
			
			brazi.ian.buttonMode = true;
			brazi.i.buttonMode = true;
			brazi.gaul.buttonMode = true;
			brazi.eb.buttonMode = true;
			brazi.sie.buttonMode = true;
			
			brazi.gacopy.visible = false;
			brazi.ebcopy.visible = false;
			brazi.ulcopy.visible = false;
			brazi.icopy.visible = false;
			
			brazi.iancopy.visible = false;
			brazi.icopy2.visible = false;
			
			brazi.si.visible = false;
			brazi.e.visible = false;
			
			bool1 = false;
			bool2 = false;
			bool3 = false;
			
			randNumb = Math.round(Math.random() * 2);
			
			switch (randNumb)
			{
				case 0: 
					first();
					break;
				case 1: 
					secont();
					break
				case 2: 
					third();
					break;
			}
		}
		
		private function third():void
		{
			trace("1");
			Draging = new StartStopHit3(brazi.eb, brazi.gaul, brazi.i, brazi.textBack);
			Draging.addEventListener(DataEvent.DATA, dispaCheventHandler, false, 0, true)
		}
		
		private function secont():void
		{
			trace("2");
			Draging1 = new StartStopHitClass4(brazi.sie, brazi.textBack);
			Draging1.addEventListener(DataEvent.DATA, dispaCheventHandler1, false, 0, true)
		}
		
		private function first():void
		{
			trace("3");
			Draging3 = new StartStopHitClass2(brazi.ian, brazi.i, brazi.textBack);
			Draging3.addEventListener(DataEvent.DATA, dispaCheventHandler2, false, 0, true)
		}
		
		private function wrongFunckHandler(e:MouseEvent):void
		{
			wrong = new SoundControl();
			addChild(wrong);
			if (wrong.soundIsPlaying())
			{
				return;
			}
			wrong.loadSound("error.mp3", 1)
			wrong.soundPlay();
		}
		
		private function dispaCheventHandler2(e:DataEvent):void
		{
			
			brazi.textBack.mainTextBox.text = "ბრაზ";
			if (e.data == "showian")
			{
				brazi.iancopy.visible = true;
			}
			if (e.data == "showi")
			{
				brazi.icopy2.visible = true;
			}
			if (e.data == "ShecvaleTexti")
			{
				bool1 = true;
				soundControl2 = new SoundControl;
				soundControl2.loadSound("correct.mp3", 1);
				addChild(soundControl2);
				soundControl2.soundPlay();
				setTimeout(nextText, 2000);
			}
		}
		
		private function dispaCheventHandler1(e:DataEvent):void
		{
			if (e.data == "ShecvaleTexti")
			{
				brazi.si.visible = true;
				brazi.textBack.mainTextBox.text = "ბრაზ";
				brazi.e.visible = true;
				bool2 = true;
				soundControl2 = new SoundControl;
				soundControl2.loadSound("correct.mp3", 1);
				addChild(soundControl2);
				soundControl2.soundPlay();
				setTimeout(nextText, 2000);
			}
		}
		
		private function dispaCheventHandler(e:DataEvent):void
		{
			brazi.textBack.mainTextBox.text = "ბრაზ";
			
			if (e.data == "showeb")
			{
				brazi.ebcopy.visible = true;
			}
			if (e.data == "gaul")
			{
				brazi.gacopy.visible = true;
				brazi.ulcopy.visible = true;
			}
			if (e.data == "i")
			{
				brazi.icopy.visible = true;
			}
			
			if (e.data == "ShecvaleTexti")
			{
				bool3 = true;
				soundControl2 = new SoundControl;
				soundControl2.loadSound("correct.mp3", 1);
				addChild(soundControl2);
				soundControl2.soundPlay();
				setTimeout(nextText, 2000);
			}
		
		}
		
		private function nextText():void
		{
			if (bool1 || bool2 || bool3)
			{
				
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "EndOFClass"));
				//setTimeout(destroy, 1000);
				destroy();
			}
		}
		
		private function destroy():void
		{
			
			if (brazi)
			{
				removeChild(brazi);
				brazi = null;
			}
		
		}
	
	}

}

