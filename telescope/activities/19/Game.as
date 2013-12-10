package  {
	
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.setTimeout;
	
	
	public class Game extends MovieClip 
	{
		private var crossWord:MovieClip;
		
		private var AnbaniArr:Array;
		private var AnbaniArrText:Array;	

		private var _Width:Number;
		private var _Height:Number;
		
		private var MtvareArr:Array;		
		private var MtvareArrText:Array;
		
		private var GalaqtikaArr:Array;
		private var GalaqtikaArrText:Array;
		
		private var ObservatoriaArr:Array;
		private var ObservatoriaArrText:Array;
		
		private var AstronomiaArr:Array;
		private var AstronomiaArrText:Array;
		
		private var AstronomiArr:Array;
		private var AstronomiArrText:Array;
		private var KometaArr:Array;
		private var KometaArrText:Array;
		private var KosmosiArr:Array;
		private var KosmosiArrText:Array;
		private var PlanetaArr:Array;
		private var PlanetaArrText:Array;
		private var NisleuliArr:Array;
		private var NisleuliArrText:Array;
		private var index:int;
		private var count:int;
		private var soundControl1:SoundControl;
		
		private var point:Point
		
		
		public function Game(_Width:Number =1024, _Height:Number = 768) 
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
			initHandler()
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
			
			
			AstronomiaArr = [crossWord.a1, crossWord.s1, crossWord.r1, crossWord.o1, crossWord.n1, crossWord.o2, crossWord.m1, crossWord.i1, crossWord.a2]
			AstronomiaArrText = [crossWord.a1.a1, crossWord.s1.s1, crossWord.r1.r1, crossWord.o1.o1, crossWord.n1.n1, crossWord.o2.o2, crossWord.m1.m1, crossWord.i1.i1, crossWord.a2.a2]
			
			MtvareArr = [crossWord.m2, crossWord.t1, crossWord.v1, crossWord.a3, crossWord.r2]
			MtvareArrText = [crossWord.m2.m2, crossWord.t1.t1, crossWord.v1.v1, crossWord.a3.a3, crossWord.r2.r2]
			
			GalaqtikaArr = [crossWord.g1, crossWord.a4, crossWord.a5, crossWord.q1, crossWord.t2, crossWord.i2, crossWord.k1, crossWord.a6]
			GalaqtikaArrText = [crossWord.g1.g1, crossWord.a4.a4, crossWord.a5.a5, crossWord.q1.q1, crossWord.t2.t2, crossWord.i2.i2, crossWord.k1.k1, crossWord.a6.a6]
			
			ObservatoriaArr = [crossWord.o3, crossWord.b1, crossWord.s2, crossWord.r3, crossWord.v2, crossWord.a7, crossWord.t3, crossWord.o4, crossWord.r4, crossWord.i3, crossWord.a8]			
			ObservatoriaArrText = [crossWord.o3.o3, crossWord.b1.b1, crossWord.s2.s2, crossWord.r3.r3, crossWord.v2.v2, crossWord.a7.a7, crossWord.t3.t3, crossWord.o4.o4, crossWord.r4.r4, crossWord.i3.i3, crossWord.a8.a8]			
			
			AstronomiArr =  [crossWord.a9, crossWord.t4, crossWord.r5, crossWord.o5, crossWord.n2, crossWord.o6, crossWord.m3, crossWord.i4]
			AstronomiArrText =  [crossWord.a9.a9, crossWord.t4.t4, crossWord.r5.r5, crossWord.o5.o5, crossWord.n2.n2, crossWord.o6.o6, crossWord.m3.m3, crossWord.i4.i4]
			
			KometaArr = [crossWord.o7, crossWord.m4, crossWord.e1, crossWord.t5, crossWord.a10];
			KometaArrText = [crossWord.o7.o7, crossWord.m4.m4, crossWord.e1.e1, crossWord.t5.t5, crossWord.a10.a10];
			
			
			KosmosiArr = [crossWord.k2, crossWord.s3, crossWord.m5, crossWord.o8, crossWord.s4, crossWord.i5]
			KosmosiArrText = [crossWord.k2.k2, crossWord.s3.s3, crossWord.m5.m5, crossWord.o8.o8, crossWord.s4.s4, crossWord.i5.i5]
			
			PlanetaArr = [crossWord.l1, crossWord.a11, crossWord.n3, crossWord.e2, crossWord.t6, crossWord.a12]
			PlanetaArrText = [crossWord.l1.l1, crossWord.a11.a11, crossWord.n3.n3, crossWord.e2.e2, crossWord.t6.t6, crossWord.a12.a12]
			
			NisleuliArr = [crossWord.n4, crossWord.i6, crossWord.s5, crossWord.l2, crossWord.e3, crossWord.u1, crossWord.l3]
			NisleuliArrText = [crossWord.n4.n4, crossWord.i6.i6, crossWord.s5.s5, crossWord.l2.l2, crossWord.e3.e3, crossWord.u1.u1, crossWord.l3.l3]
			
			for (var i:int = 0; i < AnbaniArr.length; i++)
			{
				AnbaniArr[i].buttonMode = true; 
				AnbaniArr[i].addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
				AnbaniArr[i].addEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
			}
			
			AlphaNull(AstronomiaArrText)
			AlphaNull(MtvareArrText);
			AlphaNull(GalaqtikaArrText);
			AlphaNull(ObservatoriaArrText)
			AlphaNull(AstronomiArrText);
			AlphaNull(KometaArrText);
			AlphaNull(KosmosiArrText);
			AlphaNull(PlanetaArrText);
			AlphaNull(NisleuliArrText);
			for (var j:int = 1; j <= 9; j++) 
			{
				crossWord['h' + j + 'text'].visible = false;
				crossWord['h'+j].addEventListener(MouseEvent.MOUSE_DOWN, ShowHelp)
			}
			
			crossWord.help.addEventListener(MouseEvent.MOUSE_DOWN, helpLetter)
			
		
		}
		
		private function helpLetter(e:MouseEvent):void 
		{
			shonwrandLett(AstronomiaArrText, Math.round(Math.random()*(AstronomiaArrText.length -1)))
			shonwrandLett(MtvareArrText, Math.round(Math.random()*(MtvareArrText.length -1)));
			shonwrandLett(GalaqtikaArrText, Math.round(Math.random()*(GalaqtikaArrText.length -1)));
			shonwrandLett(ObservatoriaArrText, Math.round(Math.random()*(ObservatoriaArrText.length -1)))
			shonwrandLett(AstronomiArrText, Math.round(Math.random()*(AstronomiArrText.length -1)));
			shonwrandLett(KometaArrText, Math.round(Math.random()*(KometaArrText.length -1)));
			shonwrandLett(KosmosiArrText, Math.round(Math.random()*(KosmosiArrText.length -1)));
			shonwrandLett(PlanetaArrText, Math.round(Math.random()*(PlanetaArrText.length -1)));
			shonwrandLett(NisleuliArrText, Math.round(Math.random()*(NisleuliArrText.length -1)));
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
			
			for (var i:int = 1; i <= 9; i++) 
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
			FuncHandler(e.currentTarget as MovieClip, AstronomiaArr, AstronomiaArrText)
			FuncHandler(e.currentTarget as MovieClip, MtvareArr, MtvareArrText)
			FuncHandler(e.currentTarget as MovieClip, AstronomiArr, AstronomiArrText)
			FuncHandler(e.currentTarget as MovieClip, GalaqtikaArr, GalaqtikaArrText)
			FuncHandler(e.currentTarget as MovieClip, ObservatoriaArr, ObservatoriaArrText)
			FuncHandler(e.currentTarget as MovieClip, KometaArr, KometaArrText)
			FuncHandler(e.currentTarget as MovieClip, NisleuliArr, NisleuliArrText)
			FuncHandler(e.currentTarget as MovieClip, KosmosiArr, KosmosiArrText)
			FuncHandler(e.currentTarget as MovieClip, PlanetaArr, PlanetaArrText)
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
						setTimeout(oldCordinats, 5, e)
						
					}
					else
					{
						setTimeout(oldCordinats, 5, e)
					}
				}
				
			}
			
			
		}
		
		private function TheEnd():void 
		{
			if (count == 65)
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
