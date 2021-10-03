package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.room.events.RoomObjectMoveEvent;
   import com.sulake.habbo.room.messages.RoomObjectAvatarCarryObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarDanceUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarEffectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFlatControlUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarGestureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPlayerValueUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSignUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarTypingUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUseObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarWaveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class AvatarLogic extends MovingObjectLogic
   {
      
      private static const const_834:Number = 1.5;
      
      private static const const_833:int = 28;
      
      private static const const_832:int = 29;
      
      private static const const_835:int = 500;
      
      private static const const_1178:int = 999999999;
       
      
      private var var_178:Boolean = false;
      
      private var var_453:Vector3d = null;
      
      private var var_823:int = 0;
      
      private var var_1627:int = 0;
      
      private var var_1274:int = 0;
      
      private var var_824:int = 0;
      
      private var var_670:int = 0;
      
      private var var_1040:int = 0;
      
      private var var_1272:int = 0;
      
      private var var_1270:int = 0;
      
      private var var_825:int = 0;
      
      private var var_1629:Boolean = false;
      
      private var var_1273:int = 0;
      
      private var var_1628:int = 0;
      
      private var var_1271:int = 0;
      
      public function AvatarLogic()
      {
         super();
         this.var_1628 = getTimer() + this.getBlinkInterval();
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_178 && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc1_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_422,object.getId(),object.getType());
               eventDispatcher.dispatchEvent(_loc1_);
            }
         }
         super.dispose();
         this.var_453 = null;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         if(param1 == null || object == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         var _loc2_:IRoomObjectModelController = object.getModelController();
         if(param1 is RoomObjectAvatarPostureUpdateMessage)
         {
            _loc3_ = param1 as RoomObjectAvatarPostureUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_494,_loc3_.postureType);
            _loc2_.setString(RoomObjectVariableEnum.const_741,_loc3_.parameter);
            return;
         }
         if(param1 is RoomObjectAvatarChatUpdateMessage)
         {
            _loc4_ = param1 as RoomObjectAvatarChatUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_206,1);
            this.var_1274 = getTimer() + _loc4_.numberOfWords * 1000;
            return;
         }
         if(param1 is RoomObjectAvatarTypingUpdateMessage)
         {
            _loc5_ = param1 as RoomObjectAvatarTypingUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_993,Number(_loc5_.isTyping));
            return;
         }
         if(param1 is RoomObjectAvatarUpdateMessage)
         {
            _loc6_ = param1 as RoomObjectAvatarUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_344,_loc6_.dirHead);
            return;
         }
         if(param1 is RoomObjectAvatarGestureUpdateMessage)
         {
            _loc7_ = param1 as RoomObjectAvatarGestureUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_267,_loc7_.gesture);
            this.var_1272 = getTimer() + 3000;
            return;
         }
         if(param1 is RoomObjectAvatarWaveUpdateMessage)
         {
            _loc8_ = param1 as RoomObjectAvatarWaveUpdateMessage;
            if(_loc8_.isWaving)
            {
               _loc2_.setNumber(RoomObjectVariableEnum.const_235,1);
               this.var_1040 = getTimer() + 0;
            }
            else
            {
               _loc2_.setNumber(RoomObjectVariableEnum.const_235,0);
               this.var_1040 = 0;
            }
            return;
         }
         if(param1 is RoomObjectAvatarDanceUpdateMessage)
         {
            _loc9_ = param1 as RoomObjectAvatarDanceUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_985,_loc9_.danceStyle);
            return;
         }
         if(param1 is RoomObjectAvatarSleepUpdateMessage)
         {
            _loc10_ = param1 as RoomObjectAvatarSleepUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_466,Number(_loc10_.isSleeping));
            return;
         }
         if(param1 is RoomObjectAvatarPlayerValueUpdateMessage)
         {
            _loc11_ = param1 as RoomObjectAvatarPlayerValueUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_764,_loc11_.value);
            this.var_1271 = getTimer() + 3000;
            return;
         }
         if(param1 is RoomObjectAvatarEffectUpdateMessage)
         {
            _loc12_ = param1 as RoomObjectAvatarEffectUpdateMessage;
            _loc13_ = _loc12_.effect;
            this.updateEffect(_loc13_,_loc2_);
            return;
         }
         if(param1 is RoomObjectAvatarCarryObjectUpdateMessage)
         {
            _loc14_ = param1 as RoomObjectAvatarCarryObjectUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_446,_loc14_.itemType);
            if(_loc14_.itemType < const_1178)
            {
               this.var_825 = getTimer() + 100000;
               this.var_1629 = true;
            }
            else
            {
               this.var_825 = getTimer() + 1500;
               this.var_1629 = false;
            }
            return;
         }
         if(param1 is RoomObjectAvatarUseObjectUpdateMessage)
         {
            _loc15_ = param1 as RoomObjectAvatarUseObjectUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_369,_loc15_.itemType);
            return;
         }
         if(param1 is RoomObjectAvatarSignUpdateMessage)
         {
            _loc16_ = param1 as RoomObjectAvatarSignUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_1063,_loc16_.signType);
            this.var_1270 = getTimer() + 5000;
            return;
         }
         if(param1 is RoomObjectAvatarFlatControlUpdateMessage)
         {
            _loc17_ = param1 as RoomObjectAvatarFlatControlUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_578,_loc17_.rawData);
            _loc2_.setNumber(RoomObjectVariableEnum.const_1258,Number(_loc17_.isAdmin));
            return;
         }
         if(param1 is RoomObjectAvatarFigureUpdateMessage)
         {
            _loc18_ = param1 as RoomObjectAvatarFigureUpdateMessage;
            _loc19_ = _loc2_.getString(RoomObjectVariableEnum.const_175);
            _loc20_ = _loc18_.figure;
            _loc21_ = _loc18_.gender;
            if(_loc19_ != null && _loc19_.indexOf(".bds-") != -1)
            {
               _loc20_ += _loc19_.substr(_loc19_.indexOf(".bds-"));
            }
            _loc2_.setString(RoomObjectVariableEnum.const_175,_loc20_);
            _loc2_.setString(RoomObjectVariableEnum.const_894,_loc21_);
            return;
         }
         if(param1 is RoomObjectAvatarSelectedMessage)
         {
            _loc22_ = param1 as RoomObjectAvatarSelectedMessage;
            this.var_178 = _loc22_.selected;
            this.var_453 = null;
            return;
         }
      }
      
      private function updateEffect(param1:int, param2:IRoomObjectModelController) : void
      {
         if(param1 == const_833)
         {
            this.var_823 = getTimer() + const_835;
            this.var_1627 = const_832;
         }
         else if(param2.getNumber(RoomObjectVariableEnum.const_506) == const_832)
         {
            this.var_823 = getTimer() + const_835;
            this.var_1627 = param1;
            param1 = const_833;
         }
         else
         {
            this.var_823 = 0;
         }
         param2.setNumber(RoomObjectVariableEnum.const_506,param1);
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(object == null || param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case MouseEvent.CLICK:
               _loc3_ = object.getId();
               _loc4_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc5_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_234,param1.eventId,_loc3_,_loc4_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc5_);
               }
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.update(param1);
         if(this.var_178 && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc2_ = object.getLocation();
               if(this.var_453 == null || this.var_453.x != _loc2_.x || this.var_453.y != _loc2_.y || this.var_453.z != _loc2_.z)
               {
                  if(this.var_453 == null)
                  {
                     this.var_453 = new Vector3d();
                  }
                  this.var_453.assign(_loc2_);
                  _loc3_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_420,object.getId(),object.getType());
                  eventDispatcher.dispatchEvent(_loc3_);
               }
            }
         }
         if(object != null && object.getModelController() != null)
         {
            this.updateActions(param1,object.getModelController());
         }
      }
      
      private function updateActions(param1:int, param2:IRoomObjectModelController) : void
      {
         if(this.var_1274 > 0)
         {
            if(param1 > this.var_1274)
            {
               param2.setNumber(RoomObjectVariableEnum.const_206,0);
               this.var_1274 = 0;
               this.var_670 = 0;
               this.var_824 = 0;
            }
            else if(this.var_824 == 0 && this.var_670 == 0)
            {
               this.var_670 = param1 + this.getTalkingPauseInterval();
               this.var_824 = this.var_670 + this.getTalkingPauseLength();
            }
            else if(this.var_670 > 0 && param1 > this.var_670)
            {
               param2.setNumber(RoomObjectVariableEnum.const_206,0);
               this.var_670 = 0;
            }
            else if(this.var_824 > 0 && param1 > this.var_824)
            {
               param2.setNumber(RoomObjectVariableEnum.const_206,1);
               this.var_824 = 0;
            }
         }
         if(this.var_1040 > 0 && param1 > this.var_1040)
         {
            param2.setNumber(RoomObjectVariableEnum.const_235,0);
            this.var_1040 = 0;
         }
         if(this.var_1272 > 0 && param1 > this.var_1272)
         {
            param2.setNumber(RoomObjectVariableEnum.const_267,0);
            this.var_1272 = 0;
         }
         if(this.var_1270 > 0 && param1 > this.var_1270)
         {
            param2.setNumber(RoomObjectVariableEnum.const_1063,0);
            this.var_1270 = 0;
         }
         if(this.var_825 > 0)
         {
            if(param1 > this.var_825)
            {
               param2.setNumber(RoomObjectVariableEnum.const_446,0);
               this.var_825 = 0;
            }
            else if((this.var_825 - param1) % 10000 < 1000 && this.var_1629)
            {
               param2.setNumber(RoomObjectVariableEnum.const_369,1);
            }
            else
            {
               param2.setNumber(RoomObjectVariableEnum.const_369,0);
            }
         }
         if(param1 > this.var_1628)
         {
            param2.setNumber(RoomObjectVariableEnum.const_579,1);
            this.var_1628 = param1 + this.getBlinkInterval();
            this.var_1273 = param1 + this.getBlinkLength();
         }
         if(this.var_1273 > 0 && param1 > this.var_1273)
         {
            param2.setNumber(RoomObjectVariableEnum.const_579,0);
            this.var_1273 = 0;
         }
         if(this.var_823 > 0 && param1 > this.var_823)
         {
            param2.setNumber(RoomObjectVariableEnum.const_506,this.var_1627);
            this.var_823 = 0;
         }
         if(this.var_1271 > 0 && param1 > this.var_1271)
         {
            param2.setNumber(RoomObjectVariableEnum.const_764,0);
            this.var_1271 = 0;
         }
      }
      
      private function getTalkingPauseInterval() : int
      {
         return 100 + Math.random() * 200;
      }
      
      private function getTalkingPauseLength() : int
      {
         return 75 + Math.random() * 75;
      }
      
      private function getBlinkInterval() : int
      {
         return 4500 + Math.random() * 1000;
      }
      
      private function getBlinkLength() : int
      {
         return 50 + Math.random() * 200;
      }
      
      private function targetIsWarping(param1:IVector3d) : Boolean
      {
         var _loc2_:IVector3d = object.getLocation();
         if(param1 == null)
         {
            return false;
         }
         if(_loc2_.x == 0 && _loc2_.y == 0)
         {
            return false;
         }
         if(Math.abs(_loc2_.x - param1.x) > const_834 || Math.abs(_loc2_.y - param1.y) > const_834)
         {
            return true;
         }
         return false;
      }
   }
}
