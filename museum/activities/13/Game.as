package
{
	
	import flash.automation.MouseAutomationAction;
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.setTimeout;
	
	public class Game extends MovieClip
	{
		
		private var AnbaniArr:Array;
		private var WordArr:Array;
		private var crossWord:MovieClip;
		private var _Width:Number;
		private var _Height:Number;
		private var AnbaniArrText:Array;
		private var MeqanizmiArr:Array;
		private var MeqanizmiArrText:Array;
		private var DurbindiArr:Array;
		
		private var point:Point;
		private var DurbindiArrText:Array;
		private var DazgaArr:Array;
		private var DazgaArrText:Array;
		private var AerodromiArr:Array;
		private var AerodromiArrText:Array;
		private var DaujerebeliArr:Array;
		private var DaujerebeliArrText:Array;
		private var GamomgonebeliArr:Array;
		private var GamomgonebeliArrText:Array;
		private var GeneraliArr:Array;
		private var GeneraliArrText:Array;
		private var count:int = 0;
		private var soundControl1:SoundControl;
		private var index:int = 0;
		
		public function Game(_Width:Number = 1024, _Height:Number = 768)
		{
			this._Height = _Height;
			this._Width = _Width;
			addEventListener(Event.ADDED_TO_STAGE, init)
			addEventListener(Event.REMOVED_FROM_STAGE, Destroy)
		}
		
		private function Destroy(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, Destroy);
			for (var i:int = 0; i < AnbaniArr.length; i++)
			{
				AnbaniArr[i].removeEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
				AnbaniArr[i].removeEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
			}
			if (crossWord)
			{
				removeChild(crossWord)
				crossWord = null
			}
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initHandler();
		}
		
		private function initHandler():void
		{
			crossWord = new CrossWord();
			crossWord.x = _Width / 2;
			crossWord.y = _Height / 2;
			crossWord.height = _Height / 1.2;
			crossWord.scaleX = crossWord.scaleY;
			addChild(crossWord);
			
			AnbaniArr = [crossWord.a, crossWord.b, crossWord.g, crossWord.d, crossWord.e, crossWord.v, crossWord.zz, crossWord.tt, crossWord.i, crossWord.k, crossWord.l, crossWord.m, crossWord.n, crossWord.o, crossWord.p, crossWord.jj, crossWord.r, crossWord.s, crossWord.t, crossWord.u, crossWord.f, crossWord.q, crossWord.rr, crossWord.yy, crossWord.ss, crossWord.cc, crossWord.c, crossWord.zzz, crossWord.w, crossWord.ww, crossWord.xx, crossWord.j, crossWord.h];
			
			AnbaniArrText = [crossWord.a.a, crossWord.b.b, crossWord.g.g, crossWord.d.d, crossWord.e.e, crossWord.v.v, crossWord.zz.zz, crossWord.tt.tt, crossWord.i.i, crossWord.k.k, crossWord.l.l, crossWord.m.m, crossWord.n.n, crossWord.o.o, crossWord.p.p, crossWord.jj.jj, crossWord.r.r, crossWord.s.s, crossWord.t.t, crossWord.u.u, crossWord.f.f, crossWord.q.q, crossWord.rr.rr, crossWord.yy.yy, crossWord.ss.ss, crossWord.cc.cc, crossWord.c.c, crossWord.zzz.zzz, crossWord.w.w, crossWord.ww.ww, crossWord.xx.xx, crossWord.j.j, crossWord.h.h];
			
			MeqanizmiArr = [crossWord.e1, crossWord.q1, crossWord.a1, crossWord.n1, crossWord.i1, crossWord.z1, crossWord.m1, crossWord.i2]
			MeqanizmiArrText = [crossWord.e1.e1, crossWord.q1.q1, crossWord.a1.a1, crossWord.n1.n1, crossWord.i1.i1, crossWord.z1.z1, crossWord.m1.m1, crossWord.i2.i2];
			
			DurbindiArr = [crossWord.d1, crossWord.r1, crossWord.b1, crossWord.i3, crossWord.n2, crossWord.d2, crossWord.i4]
			DurbindiArrText = [crossWord.d1.d1, crossWord.r1.r1, crossWord.b1.b1, crossWord.i3.i3, crossWord.n2.n2, crossWord.d2.d2, crossWord.i4.i4]
			
			DazgaArr = [crossWord.d3, crossWord.a2, crossWord.g1, crossWord.a3]
			DazgaArrText = [crossWord.d3.d3, crossWord.a2.a2, crossWord.g1.g1, crossWord.a3.a3]
			
			AerodromiArr = [crossWord.a4, crossWord.r2, crossWord.o1, crossWord.d4, crossWord.r3, crossWord.o2, crossWord.m2, crossWord.i5]
			AerodromiArrText = [crossWord.a4.a4, crossWord.r2.r2, crossWord.o1.o1, crossWord.d4.d4, crossWord.r3.r3, crossWord.o2.o2, crossWord.m2.m2, crossWord.i5.i5]
			
			DaujerebeliArr = [crossWord.d5, crossWord.a5, crossWord.j1, crossWord.e2, crossWord.r4, crossWord.e3, crossWord.b2, crossWord.e4, crossWord.l1, crossWord.i6]
			DaujerebeliArrText = [crossWord.d5.d5, crossWord.a5.a5, crossWord.j1.j1, crossWord.e2.e2, crossWord.r4.r4, crossWord.e3.e3, crossWord.b2.b2, crossWord.e4.e4, crossWord.l1.l1, crossWord.i6.i6]
			
			GamomgonebeliArr = [crossWord.g2, crossWord.a6, crossWord.m3, crossWord.o3, crossWord.g3, crossWord.o4, crossWord.n3, crossWord.e5, crossWord.b3, crossWord.e6, crossWord.l2, crossWord.i7]
			GamomgonebeliArrText = [crossWord.g2.g2, crossWord.a6.a6, crossWord.m3.m3, crossWord.o3.o3, crossWord.g3.g3, crossWord.o4.o4, crossWord.n3.n3, crossWord.e5.e5, crossWord.b3.b3, crossWord.e6.e6, crossWord.l2.l2, crossWord.i7.i7];
			
			GeneraliArr = [crossWord.g4, crossWord.e7, crossWord.n4, crossWord.e8, crossWord.r5, crossWord.a7, crossWord.l3];
			GeneraliArrText = [crossWord.g4.g4, crossWord.e7.e7, crossWord.n4.n4, crossWord.e8.e8, crossWord.r5.r5, crossWord.a7.a7, crossWord.l3.l3];
			
			for (var i:int = 0; i < AnbaniArr.length; i++)
			{
				AnbaniArr[i].buttonMode = true; 
				AnbaniArr[i].addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
				AnbaniArr[i].addEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
			}
			
			AlphaNull(DurbindiArrText)
			AlphaNull(MeqanizmiArrText);
			AlphaNull(AerodromiArrText);
			AlphaNull(DazgaArrText)
			AlphaNull(DaujerebeliArrText);
			AlphaNull(GamomgonebeliArrText);
			AlphaNull(GeneraliArrText);
			
			for (var j:int = 1; j <= 7; j++) 
			{
				crossWord['h' + j + 'text'].visible = false;
				crossWord['h'+j].addEventListener(MouseEvent.MOUSE_DOWN, ShowHelp)
			}
			crossWord.help.addEventListener(MouseEvent.MOUSE_DOWN, helpLetter)
			
		
		}
		
		private function helpLetter(e:MouseEvent):void 
		{
			shonwrandLett(DurbindiArrText, Math.round(Math.random()*(DurbindiArrText.length -1)))
			shonwrandLett(MeqanizmiArrText, Math.round(Math.random()*(MeqanizmiArrText.length -1)));
			shonwrandLett(AerodromiArrText, Math.round(Math.random()*(AerodromiArrText.length -1)));
			shonwrandLett(DazgaArrText, Math.round(Math.random()*(DazgaArrText.length -1)))
			shonwrandLett(DaujerebeliArrText, Math.round(Math.random()*(DaujerebeliArrText.length -1)));
			shonwrandLett(GamomgonebeliArrText, Math.round(Math.random()*(GamomgonebeliArrText.length -1)));
			shonwrandLett(GeneraliArrText, Math.round(Math.random()*(GeneraliArrText.length -1)));
		}
		private function shonwrandLett(textBox:Array, randNum:Number):void
		{
			if (textBox[randNum].alpha == 1)
			{
				return;
			}
			
			
			textBox[randNum].alpha = 1;
			count ++;
			TheEnd()
		}
		
		private function ShowHelp(e:MouseEvent):void 
		{
			
			for (var i:int = 1; i <= 7; i++) 
			{
				if (e.currentTarget.name == ['h' + i] )
				{
					if (index == 0)
					{
						index++
						crossWord['h' + i + 'text'].visible = true;
					}
					else if (index == 1)
					{
						crossWord['h' + i + 'text'].visible = false;
						index -- 
					}
				}
			}
		}
		
		private function AlphaNull(Arr:Array):void
		{
			for (var i:int = 0; i < Arr.length; i++)
			{
				Arr[i].alpha = 0;
			}
		}
		
		private function stopDragHandler(e:MouseEvent):void
		{
			FuncHandler(e.currentTarget as MovieClip, DurbindiArr, DurbindiArrText)
			FuncHandler(e.currentTarget as MovieClip, MeqanizmiArr, MeqanizmiArrText)
			FuncHandler(e.currentTarget as MovieClip, AerodromiArr, AerodromiArrText)
			FuncHandler(e.currentTarget as MovieClip, DazgaArr, DazgaArrText)
			FuncHandler(e.currentTarget as MovieClip, DaujerebeliArr, DaujerebeliArrText)
			FuncHandler(e.currentTarget as MovieClip, GamomgonebeliArr, GamomgonebeliArrText)
			FuncHandler(e.currentTarget as MovieClip, GeneraliArr, GeneraliArrText)
		}
		
		private function FuncHandler(e:MovieClip, MainArr:Array, MainArrTex:Array)
		{
			for (var i:int = 0; i < AnbaniArr.length; i++)
			{
				for (var j:int = 0; j < MainArr.length; j++)
				{
					if (AnbaniArr[i].hitTestObject(MainArr[j]) && AnbaniArrText[i].text == MainArrTex[j].text)
					{
						if (MainArrTex[j].alpha == 1)
						{
							return;
							
						}
						MainArrTex[j].alpha = 1;
						count++
						TheEnd()
						setTimeout(oldCordinats, 10, e)
						
					}
					else
					{
						setTimeout(oldCordinats, 10, e)
					}
				}
				
			}
		
			
		}
		
		private function TheEnd():void 
		{
			
			if (count == 56)
			{
				soundControl1 = new SoundControl();
				addChild(soundControl1);
				soundControl1.loadSound("correct.mp3", 1);
				soundControl1.soundPlay();
				setTimeout(sendDispach, 3000)
			}
		}
		
		private function sendDispach():void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfStage"));
			Destroy(null);
		}
		
		private function oldCordinats(e:MovieClip):void
		{
			e.x = point.x;
			e.y = point.y;
			e.stopDrag();
		}
		
		private function startDragHandler(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
			point = new Point();
			point.x = e.currentTarget.x;
			point.y = e.currentTarget.y;
		}
	
	}

}
