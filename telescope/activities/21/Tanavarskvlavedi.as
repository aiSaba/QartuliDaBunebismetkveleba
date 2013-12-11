package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import flash.events.DataEvent;
	
	
	public class Tanavarskvlavedi extends MovieClip 
	{
		private var _stageWidth:Number;
		private var _stageHeight:Number;
		private var all:MovieClip;
		private var tj:TwoPointJoiner;
		

		private var INDEX:Number = 0;
		
		private var OrionLineJoin:Array;
		private var bigBearLineJoin:Array;
		private var littleBearLineJoin:Array;
		private var kasiopeaLineJoin:Array;
		private var herkulesiLineJoin:Array;
		private var qnariLineJoin:Array;

		
		//moveiClips before
		private var orioni:MovieClip;
		private var bigBear:MovieClip;
		private var littleBear:MovieClip;
		private var kasiopea:MovieClip;
		private var herkulesi:MovieClip;
		private var qnari:MovieClip;
		
		//MovieClips after
		private var orioni_a:MovieClip;
		private var bigBear_a:MovieClip;
		private var littleBear_a:MovieClip;
		private var kasiopea_a:MovieClip;
		private var herkulesi_a:MovieClip;
		private var qnari_a:MovieClip;
		
		//MovieClipsPoint
		private var orioniPoint:MovieClip;
		private var bigBearPoint:MovieClip;
		private var littleBearPoint:MovieClip;
		private var kasiopeaPoint:MovieClip;
		private var herkulesiPoint:MovieClip;
		private var qnariPoint:MovieClip;
		
		
		//points array
		private var orioniPointsArr:Array;
		private var bigBearPointsArr:Array;
		private var littleBearPointsArr:Array;
		private var kasiopeaPointArr:Array;
		private var herkulesiPointArr:Array;
		private var qnariPointArr:Array;
		
		//brpoints arrays
		private var textBoxArr:Array;
		private var beforeArr:Array;
		private var afterArr:Array;
		private var pointArr:Array;
		
		private var AllPointsArr:Array;
		private var AllJoinArr:Array;
	

		public function Tanavarskvlavedi(_stageWidth:Number=1024, _stageHeight:Number=768) 
		{
			this._stageHeight = _stageHeight;
			this._stageWidth = _stageWidth;
			addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		
		private function init(ev:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init)
			initObjects();
		}
		
		private function initObjects():void
		{
			all = new All();
			all.x = _stageWidth / 2;
			all.y = _stageHeight / 2;
			all.height = _stageHeight/1.2;
			all.scaleX = all.scaleY;
			addChild(all);
			
			//beforeArray
			orioni = new Orioni();
			bigBear = new BigBear();
			littleBear = new LittleBear();
			kasiopea = new Kasiopea();
			herkulesi = new Herkulesi();
			qnari = new Qnari();
			
			//PointArray
			orioniPoint = new OrioniPoints();
			bigBearPoint = new BigBearPonts();
			littleBearPoint = new LittleBearPoints();
			kasiopeaPoint = new KasiopeaPoints();
			herkulesiPoint = new HerkulesiPoints();
			qnariPoint = new QnariPoints();
			
			//afterArray
			orioni_a = new Orioni_a();
			bigBear_a = new BigBear_a();
			littleBear_a = new LittleBear_a();
			kasiopea_a = new Kasiopea_a();
			herkulesi_a = new Herkulesi_a();
			qnari_a = new Qnari_a();
			asd();
		}
		
		private function asd():void
		{
			if (INDEX == 6)
			{
				dispatchEvent(new DataEvent(DataEvent.DATA, false, false, "endOfScene"));
				return;
			}
			textBoxArr = ["ორიონი", "დიდი დათვი", "პატარა დათვი", "კასიოპეა", "ჰერკულესი", "ქნარი"];
			beforeArr = [orioni, bigBear, littleBear, kasiopea, herkulesi, qnari];
			afterArr = [orioni_a, bigBear_a, littleBear_a, kasiopea_a, herkulesi_a, qnari_a];
			pointArr = [orioniPoint, bigBearPoint, littleBearPoint, kasiopeaPoint, herkulesiPoint, qnariPoint];
			
			//////////orioni
			orioniPointsArr = [pointArr[0].one, pointArr[0].two, pointArr[0].three, pointArr[0].four, pointArr[0].five, pointArr[0].six,
			pointArr[0].seven, pointArr[0].eight, pointArr[0].nine, pointArr[0].ten, pointArr[0].eleven, pointArr[0].twelve,
			pointArr[0].thirteen, pointArr[0].fourteen, pointArr[0].fifteen, pointArr[0].sixteen, pointArr[0].seventeen, 
			pointArr[0].eighteen,pointArr[0].ninghteen];
			
			OrionLineJoin = [0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10,
						10, 11, 8, 13,  5, 14, 14, 15, 15, 16, 14, 17, 17, 18, 0, 4, 2, 7];
			 
			///BigBear
			bigBearPointsArr =  [pointArr[1].zero, pointArr[1].one, pointArr[1].two, pointArr[1].three, pointArr[1].four,
			pointArr[1].five, pointArr[1].six, pointArr[1].seven, pointArr[1].eight, pointArr[1].nine, pointArr[1].ten,
			pointArr[1].eleven, pointArr[1].twelve, pointArr[1].thirdteen, pointArr[1].fourteen, pointArr[1].fifteen, pointArr[1].sixteen];
			
			bigBearLineJoin = [0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 6, 8, 6, 9, 9, 10, 
							   9, 11, 9, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 4];
			
			/////LittleBear
			littleBearPointsArr = [pointArr[2].zero, pointArr[2].one, pointArr[2].two, pointArr[2].three, pointArr[2].four,
			pointArr[2].five, pointArr[2].six, pointArr[2].seven, pointArr[2].eight];
			
			littleBearLineJoin = [0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 3];
			
			////Kasiopea
			kasiopeaPointArr = [pointArr[3].zero, pointArr[3].one, pointArr[3].two, pointArr[3].three, pointArr[3].four];
			
			kasiopeaLineJoin = [0, 1, 1, 2, 2, 3, 3, 4];
			
			///herkulesi
			herkulesiPointArr = [pointArr[4].zero, pointArr[4].one, pointArr[4].two, pointArr[4].three, pointArr[4].four,
			pointArr[4].five, pointArr[4].six, pointArr[4].seven, pointArr[4].eight, pointArr[4].nine, pointArr[4].ten,
			pointArr[4].eleven, pointArr[4].twelve, pointArr[4].thirteen, pointArr[4].fourteen];
			
			herkulesiLineJoin = [0, 1, 1, 2, 1, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 4, 9, 9, 10, 10, 11, 9, 12, 3, 12, 12, 13, 13, 14];
			
			///qnari
			qnariPointArr = [pointArr[5].zero, pointArr[5].one, pointArr[5].two, pointArr[5].three, pointArr[5].four];
			
			qnariLineJoin = [0, 1, 1, 2, 2, 3, 3, 4, 4, 1];
			
			
			///
			AllPointsArr = [orioniPointsArr, bigBearPointsArr, littleBearPointsArr, kasiopeaPointArr, herkulesiPointArr, qnariPointArr];
			AllJoinArr = [OrionLineJoin, bigBearLineJoin, littleBearLineJoin, kasiopeaLineJoin, herkulesiLineJoin, qnariLineJoin];
			
			
			//NextSrat
			all.addChild(beforeArr[INDEX]);
			all.nameTb.text = textBoxArr[INDEX];
			setTimeout(point_mc, 2000);
			trace("INDEX" + INDEX)
			tj = new TwoPointJoiner (pointArr[INDEX], AllPointsArr[INDEX], AllJoinArr[INDEX]);
			addChild(tj);			
			tj.addEventListener(DataEvent.DATA, nextStar, false, 0, true);
		}		
		
		
		private function point_mc():void
		{
			all.removeChild(beforeArr[INDEX]);
			beforeArr[INDEX] = null;
			all.addChild(pointArr[INDEX]);
		}
	
		private function nextStar(ev:DataEvent):void
		{
			if (ev.data == "endStar")
			{
				trace("endStar")
				all.removeChild(pointArr[INDEX]);
				pointArr[INDEX] = 0;
				all.addChild(afterArr[INDEX]);
				setTimeout(next, 1500);
			}
		}
		
		private function next():void
		{
			all.removeChild(afterArr[INDEX])
			afterArr[INDEX] = null;
			INDEX++;
			asd();
		}
		
		
	}
	
}
