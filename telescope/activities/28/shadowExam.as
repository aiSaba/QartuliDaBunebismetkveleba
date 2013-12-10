/*
human : human_MC
	figure : humanFigure_MC
	shadows : humanShadows_MC
		shadow0 : humanShadow0_MC 
		shadow1 : humanShadow1_MC
		shadow2 : humanShadow2_MC
		shadow3 : humanShadow3_MC
		shadow4 : humanShadow4_MC


house : house_MC
	figure : houseFigure_MC
	shadows : houseShadows_MC
		shadow0 : houseShadow0_MC 
		shadow1 : houseShadow1_MC
		shadow2 : houseShadow2_MC
		shadow3 : houseShadow3_MC
		shadow4 : houseShadow4_MC

*/

package  {

	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.utils.setTimeout;
	
	import com.greensock.*; 
	import com.greensock.easing.*;

	public class shadowExam extends ResponsiveScene {
		
		private var m_sunPlaces:Array;
		private var m_sunPosition:int;
		private var m_things:Array;
		private const STEP_TIME:Number = 0.5;

		public function shadowExam(){
			m_scene = zgarbi;
			
		}
		
		override public function onReady():void {
			stop();
			var zgarbiSound:Sound = new Sound(new URLRequest("sounds/28.mp3")); 
			zgarbiSound.play();
			
			resizeHandler(null);
			setTimeout(onReady2, 2800);
		}
		
		 public function onReady2():void {
			 dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleTrue"));
			   nextFrame();
			 m_scene = scene;
			resizeHandler(null);
			trace("onReady");
			setSunPlaces();
			setThings();
			setSunAtPosition(m_sunPosition);
 			setActiveThings();
			m_scene.prev.addEventListener(MouseEvent.CLICK, onPrevNextClickListener);
			m_scene.next.addEventListener(MouseEvent.CLICK, onPrevNextClickListener);
			m_scene.nextExam.addEventListener(MouseEvent.CLICK, nextExamClickListener);
		}
		
		private function nextExamClickListener(e:MouseEvent):void 
		{
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "ButtonVisibleFalse"));
			dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfGame"));
		}
		
		private function setActiveThings():void{
			for(var i:int = 0; i <m_things.length ; i++){
				m_things[i].hide();
				m_things[i].show(m_sunPosition);
				m_things[i].shadowAt(m_sunPosition).alpha =100;
				TweenMax.to(m_things[i].shadowAt(m_sunPosition),0.01,{autoAlpha:1}); 
			}
		}
		
		private function setSunPlaces():void{
			m_sunPosition = 0;
			m_sunPlaces = [ m_scene.sunPlaces.place0, 
							m_scene.sunPlaces.place1, 
							m_scene.sunPlaces.place2, 
							m_scene.sunPlaces.place3, 
							m_scene.sunPlaces.place4];
			for(var  i = 0; i < m_sunPlaces.length; i++ )
				m_sunPlaces[i].addEventListener(MouseEvent.CLICK, onSunPlaceClickListener)			
		}

		private function setThings():void{
			m_things = [new Thing(m_scene.human),
						new Thing(m_scene.house),
						new Thing(m_scene.dog),
						new Thing(m_scene.tree),
						new Thing(m_scene.cat),
						new Thing(m_scene.chair)];
		}
 
		private function onPrevNextClickListener(event:Event):void {
			var direction:int = (event.currentTarget.name == "prev") ? -1 : 1;
			setSunAtPosition(m_sunPosition + direction);
		}

		private function onSunPlaceClickListener(event:Event):void {
			var position:int;
			switch(event.currentTarget.name){
				case "place0": position = 0; break;
				case "place1": position = 1; break;
				case "place2": position = 2; break;
				case "place3": position = 3; break;
				case "place4": position = 4; break;
			}
			setSunAtPosition(position);
		}

		private function traceObject(o:Object,indent:String ="    "):void{
			for(var val:* in o){
				if( typeof(o[val]) == "object" || typeof(o[val]) == "array"){
					trace(indent+'[' + typeof(o[val]) + '] ' + val + ' => ');
					traceObject(o[val],indent+indent);
				}else
					trace(indent+'[' + typeof(o[val]) + '] ' + val + ' => '+o[val]);
			}
		}

		private function setSunAtPosition(position:int):void{
			if(TweenMax.isTweening(m_scene.sun)) return;
			m_scene.prev.visible = (position > 0) ? true: false;
			m_scene.next.visible = (position < m_sunPlaces.length-1) ? true: false; 
			var steps:int = Math.abs(position - m_sunPosition);
			if( steps == 0 ) {
				//m_shadows[m_thingIndex][m_sunPosition].alpha = 100;
				trace("AAAAAAAAAAAAAAAAAAAAAAAAA");
				return;
			}

			var direction:int = (position - m_sunPosition)/steps;
			var bezierPoints:Array = [];

			trace("direction"+direction);
			for( var i = 0; i < steps; i++ ){
				var shadows:Array = new Array();
				for( var j = 0; j < m_things.length; j++ )
					shadows[j] = m_things[j].shadowAt(m_sunPosition);
				TweenMax.allTo(shadows,STEP_TIME,{autoAlpha:0,delay:i*STEP_TIME}); 
				m_sunPosition += direction;

				shadows.splice(0);
				for( var j = 0; j < m_things.length; j++ )
					shadows[j] = m_things[j].shadowAt(m_sunPosition);
				TweenMax.allTo(shadows,STEP_TIME/2,{autoAlpha:1,delay:(i+0.5)*STEP_TIME});
				var targetPosition = {};
				
				targetPosition.x = m_sunPlaces[m_sunPosition].x + m_scene.sunPlaces.x;
				targetPosition.y = m_sunPlaces[m_sunPosition].y + m_scene.sunPlaces.y;
				bezierPoints[i] = targetPosition;
			}

			
			traceObject(bezierPoints);
			TweenMax.to(m_scene.sun, steps*STEP_TIME, {bezierThrough:bezierPoints, ease:Linear.easeNone});

		}
	}
	
}
