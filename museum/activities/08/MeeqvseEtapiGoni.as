package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.*;
	import flash.events.DataEvent;
	import flash.events.MouseEvent;
	
	public class MeeqvseEtapiGoni extends MovieClip
	{
		private var goni:MovieClip;
		
		private var Draging:StartStopHit4;
		private var Draging1:StartStopHit3;
		private var Draging3:StartStopHit3;
		
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
		
		public function MeeqvseEtapiGoni(_stageWidth:Number = 1024, _stageHeight:Number = 768)
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
			goni = new GoniMc();
			addChild(goni);
			goni.x = _stageWidth / 2;
			goni.y = _stageHeight / 2;
			
			goni.height = _stageHeight / 1.5;
			goni.scaleX = goni.scaleY;
			
			wrongArray = [goni.me, goni.u, goni.ga, goni.da, goni.ur, goni.es, goni.man, goni.osan, goni.ovan, goni.ier, goni.ul, goni.ian, goni.sae, goni.sao, goni.sie, goni.moo, goni.ues, goni.gaul]
			
			for (var i:int; i < wrongArray.length; i++)
			{
				wrongArray[i].buttonMode = true;
				wrongArray[i].addEventListener(MouseEvent.MOUSE_DOWN, wrongFunckHandler);
			}
			
			goni.gamo.buttonMode = true;
			goni.i.buttonMode = true;
			goni.mel.buttonMode = true;
			goni.eb.buttonMode = true;
			goni.mo.buttonMode = true;
			
			goni.gamocopy2.visible = false;
			goni.ebcopy2.visible = false;
			goni.mcopy.visible = false;
			goni.elcopy.visible = false;
			goni.icopy.visible = false;
			
			goni.mocopy.visible = false;
			goni.ebcopy3.visible = false;
			goni.acopy2.visible = false;
			
			goni.ebcopy.visible = false;
			goni.gamocopy.visible = false;
			goni.acopy.visible = false;
			
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
			Draging = new StartStopHit4(goni.gamo, goni.mel, goni.eb, goni.i, goni.textBack);
			Draging.addEventListener(DataEvent.DATA, dispaCheventHandler, false, 0, true)
		}
		
		private function secont():void
		{
			trace("2");
			Draging1 = new StartStopHit3(goni.mo, goni.eb, goni.a, goni.textBack);
			Draging1.addEventListener(DataEvent.DATA, dispaCheventHandler1, false, 0, true)
		}
		
		private function first():void
		{
			trace("3");
			Draging3 = new StartStopHit3(goni.gamo, goni.eb, goni.a, goni.textBack);
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
			
			if (e.data == "gamo")
			{
				goni.gamocopy.visible = true;
			}
			if (e.data == "eb")
			{
				goni.ebcopy.visible = true;
			}
			if (e.data == "a")
			{
				goni.acopy.visible = true;
			}
			goni.textBack.mainTextBox.text = "გონ";
			
			if (e.data == "ShecvaleTexti")
			{
				soundControl2 = new SoundControl;
				soundControl2.loadSound("correct.mp3", 1);
				addChild(soundControl2);
				soundControl2.soundPlay();
				bool1 = true;
				setTimeout(nextText, 2000);
			}
		}
		
		private function dispaCheventHandler1(e:DataEvent):void
		{
			
			goni.textBack.mainTextBox.text = "გონ";
			if (e.data == "mo")
			{
				goni.mocopy.visible = true;
			}
			if (e.data == "eb")
			{
				goni.ebcopy3.visible = true;
			}
			if (e.data == "a")
			{
				goni.acopy2.visible = true;
			}
			if (e.data == "ShecvaleTexti")
			{
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
			
			goni.textBack.mainTextBox.text = "გონ";
			
			if (e.data == "gamo")
			{
				goni.gamocopy2.visible = true;
			}
			if (e.data == "eb")
			{
				goni.ebcopy2.visible = true;
			}
			if (e.data == "mel")
			{
				goni.mcopy.visible = true;
				goni.elcopy.visible = true;
			}
			if (e.data == "i")
			{
				goni.icopy.visible = true;
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
			
			if (goni)
			{
				removeChild(goni);
				goni = null;
			}
		
		}
	
	}

}
