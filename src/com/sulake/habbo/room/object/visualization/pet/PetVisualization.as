package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IPetImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class PetVisualization extends RoomObjectSpriteVisualization implements IPetImageListener
   {
      
      private static const const_811:int = 2;
      
      private static const const_1129:Array = [0,0,0];
       
      
      private var var_519:PetVisualizationData = null;
      
      private var var_480:Map;
      
      private var var_1119:int = 0;
      
      private var var_501:int = 0;
      
      private var var_783:Boolean;
      
      private var var_574:String;
      
      private var var_1118:int = 0;
      
      private var _updateTimes:Array;
      
      private var var_521:BitmapDataAsset;
      
      private var var_386:ExperienceData;
      
      private var var_921:Boolean = false;
      
      private var var_1789:Boolean = false;
      
      private const const_1801:int = 3;
      
      private var var_1559:int = -1;
      
      private const const_812:int = 0;
      
      private const const_1537:int = 1;
      
      private const const_1502:int = 2;
      
      private const const_1128:int = 3;
      
      private var var_51:IAvatarImage = null;
      
      private var var_218:String = "";
      
      private var _postureParameter:String = "";
      
      private var var_1477:Boolean = false;
      
      private var var_1197:Boolean = false;
      
      private var var_1473:Boolean = false;
      
      private var var_950:Boolean = false;
      
      private var var_1790:Boolean = false;
      
      private var var_1194:String = "";
      
      private var var_1368:int = 0;
      
      private var var_2093:int = 0;
      
      private var var_1472:Number = NaN;
      
      private var var_1476:int = -1;
      
      private var var_1471:int = -1;
      
      public function PetVisualization()
      {
         super();
         this._updateTimes = new Array();
         this.var_480 = new Map();
         this.var_783 = false;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_921;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.dispose();
         if(this.var_480 != null)
         {
            _loc1_ = this.var_480.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = this.var_480.getValue(_loc2_) as IAvatarImage;
               _loc3_.dispose();
            }
         }
         this.var_480.dispose();
         if(this.var_386)
         {
            this.var_386.dispose();
         }
         this.var_386 = null;
         this.var_519 = null;
         this.var_921 = true;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_519 = param1 as PetVisualizationData;
         createSprites(this.const_1128);
         this.var_386 = new ExperienceData(this.var_519);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         if(param1.getUpdateID() != var_212)
         {
            this.var_1477 = param1.getNumber(RoomObjectVariableEnum.const_466) > 0;
            this.var_1194 = param1.getString(RoomObjectVariableEnum.const_267);
            this.var_218 = param1.getString(RoomObjectVariableEnum.const_494);
            this._postureParameter = param1.getString(RoomObjectVariableEnum.const_741);
            this.var_1472 = param1.getNumber(RoomObjectVariableEnum.const_344);
            this.var_1368 = param1.getNumber(RoomObjectVariableEnum.const_937);
            this.var_2093 = param1.getNumber(RoomObjectVariableEnum.const_902);
            this.validateActions();
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_175);
            if(this.var_574 != _loc3_)
            {
               this.var_574 = _loc3_;
               this.resetAvatarImages();
            }
            var_212 = param1.getUpdateID();
            return true;
         }
         return false;
      }
      
      private function resetAvatarImages() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_480)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_480.reset();
         this.var_51 = null;
      }
      
      private function validateActions() : void
      {
         var _loc1_:int = 0;
         this.var_1790 = false;
         switch(this.var_218)
         {
            case AvatarAction.const_481:
            case AvatarAction.const_930:
            case AvatarAction.const_951:
            case AvatarAction.const_998:
            case AvatarAction.const_935:
            case AvatarAction.const_964:
            case AvatarAction.const_679:
            case AvatarAction.const_293:
            case AvatarAction.const_211:
               this.var_1790 = true;
         }
         this.var_1473 = false;
         this.var_950 = false;
         if(this.var_218 == "lay")
         {
            this.var_950 = true;
            _loc1_ = int(this._postureParameter);
            if(_loc1_ < 0)
            {
               this.var_1473 = true;
            }
         }
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean = false) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param3 || var_403 != param1.getUpdateID() || this.var_1559 != param2.updateId)
         {
            _loc4_ = param1.getDirection().x - param2.direction.x;
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = this.var_1472;
            if(isNaN(this.var_1472))
            {
               _loc5_ = _loc4_;
            }
            else
            {
               _loc5_ -= param2.direction.x;
               _loc5_ = (_loc5_ % 360 + 360) % 360;
            }
            if(_loc4_ != this.var_1476 || param3)
            {
               this.var_1476 = _loc4_;
               _loc4_ -= 112.5;
               _loc4_ = (_loc4_ + 360) % 360;
               this.var_51.setDirectionAngle(AvatarSetType.const_32,_loc4_);
            }
            if(_loc5_ != this.var_1471 || param3)
            {
               this.var_1471 = _loc5_;
               _loc5_ -= 112.5;
               _loc5_ = (_loc5_ + 360) % 360;
               this.var_51.setDirectionAngle(AvatarSetType.const_43,_loc5_);
            }
            var_403 = param1.getUpdateID();
            this.var_1559 = param2.updateId;
            return true;
         }
         return false;
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = this.var_480.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = this.var_519.getAvatar(this.var_574,param1,this);
            if(_loc3_ != null)
            {
               this.var_480.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1537);
         this.var_521 = null;
         _loc2_ = getSprite(this.const_1537);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 < 48)
         {
            this.var_521 = this.var_51.getAsset("sh_std_sd_1_0_0");
            _loc3_ = -8;
            _loc4_ = -3;
         }
         else
         {
            this.var_521 = this.var_51.getAsset("h_std_sd_1_0_0");
            _loc3_ = -17;
            _loc4_ = -7;
         }
         if(this.var_521)
         {
            _loc2_.asset = this.var_521.content as BitmapData;
            _loc2_.offsetX = _loc3_;
            _loc2_.offsetY = _loc4_;
            _loc2_.alpha = 50;
            _loc2_.relativeDepth = 1;
         }
         else
         {
            _loc2_.asset = null;
         }
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:* = null;
         var _loc4_:IRoomObject = object;
         if(_loc4_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_519 == null)
         {
            return;
         }
         var _loc5_:IRoomObjectModel = _loc4_.getModel();
         if(this.var_1789)
         {
            this.var_1789 = false;
            this.var_1119 = 0;
            this.var_1118 = 1;
            this.resetAvatarImages();
         }
         var _loc6_:Number = param1.scale;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = this.updateModel(_loc5_,_loc6_);
         if(_loc9_ || _loc6_ != var_251 || this.var_51 == null)
         {
            if(_loc6_ != var_251)
            {
               var_251 = _loc6_;
               _loc7_ = true;
            }
            if(_loc7_ || this.var_51 == null)
            {
               this.var_51 = this.getAvatarImage(_loc6_);
            }
            if(this.var_51 == null)
            {
               return;
            }
            if(_loc7_)
            {
               this.updateShadow(_loc6_);
            }
            _loc8_ = this.updateObject(_loc4_,param1,true);
            this.updateActions(this.var_51);
         }
         else
         {
            _loc8_ = this.updateObject(_loc4_,param1);
         }
         var _loc10_:Boolean = _loc8_ || _loc9_ || _loc7_;
         var _loc11_:Boolean = this.var_783 || this.var_1118 > 0 || this.var_1790;
         this.var_386.alpha = 0;
         if(this.var_1368 > 0)
         {
            _loc12_ = param2 - this.var_1368;
            if(_loc12_ < AvatarAction.const_992)
            {
               this.var_386.alpha = int(Math.sin(_loc12_ / 0 * 0) * 255);
               this.var_386.setExperience(this.var_2093);
               this.var_1118 = this.const_1801;
            }
            else
            {
               this.var_1368 = 0;
            }
            _loc13_ = getSprite(this.const_1502);
            if(_loc13_ != null)
            {
               if(this.var_386.alpha > 0)
               {
                  _loc13_.asset = this.var_386.image;
                  _loc13_.offsetX = -20;
                  _loc13_.offsetY = -80;
                  _loc13_.alpha = this.var_386.alpha;
                  _loc13_.visible = true;
               }
               else
               {
                  _loc13_.asset = null;
                  _loc13_.visible = false;
               }
            }
         }
         if(_loc10_ || _loc11_)
         {
            increaseUpdateId();
            --this.var_1118;
            ++this.var_501;
            --this.var_1119;
            if(!(this.var_1119 <= 0 || _loc7_))
            {
               return;
            }
            this.var_51.updateAnimationByFrames(1);
            this.var_1119 = const_811;
            this.var_783 = this.var_51.isAnimating();
            _loc14_ = this.var_51.getCanvasOffsets();
            if(_loc14_ == null || _loc14_.length < 3)
            {
               _loc14_ = const_1129;
            }
            _loc15_ = 0;
            if(object.getLocation().z > 0)
            {
               _loc15_ = Math.min(_loc6_ / 2.75,0);
            }
            _loc13_ = getSprite(this.const_812);
            if(_loc13_)
            {
               _loc18_ = this.var_51.getImage(AvatarSetType.const_32,false);
               if(_loc18_ != null)
               {
                  _loc13_.asset = _loc18_;
               }
               if(_loc6_ < 48)
               {
                  _loc13_.offsetX = -16 + _loc14_[0];
                  _loc13_.offsetY = -_loc13_.asset.height + 8 + _loc14_[1] + _loc15_;
               }
               else
               {
                  _loc13_.offsetX = -32 + _loc14_[0];
                  _loc13_.offsetY = -_loc13_.asset.height + 16 + _loc14_[1] + _loc15_;
               }
            }
            _loc16_ = this.const_1128;
            for each(_loc17_ in this.var_51.getSprites())
            {
               _loc13_ = getSprite(_loc16_);
               if(_loc13_ != null)
               {
                  _loc19_ = this.var_51.getLayerData(_loc17_);
                  _loc20_ = 0;
                  _loc21_ = _loc17_.getDirectionOffsetX(this.var_51.getDirection());
                  _loc22_ = _loc17_.getDirectionOffsetY(this.var_51.getDirection());
                  _loc23_ = _loc17_.getDirectionOffsetZ(this.var_51.getDirection());
                  _loc24_ = 0;
                  if(_loc17_.hasDirections)
                  {
                     _loc24_ = this.var_51.getDirection();
                  }
                  if(_loc19_ != null)
                  {
                     _loc20_ = _loc19_.animationFrame;
                     _loc21_ += _loc19_.dx;
                     _loc22_ += _loc19_.dy;
                     _loc24_ += _loc19_.directionOffset;
                  }
                  if(_loc6_ < 48)
                  {
                     _loc21_ /= 2;
                     _loc22_ /= 2;
                  }
                  if(_loc24_ < 0)
                  {
                     _loc24_ += 8;
                  }
                  if(_loc24_ > 7)
                  {
                     _loc24_ -= 8;
                  }
                  _loc25_ = this.var_51.getScale() + "_" + _loc17_.member + "_" + _loc24_ + "_" + _loc20_;
                  _loc26_ = this.var_51.getAsset(_loc25_);
                  if(_loc26_ != null)
                  {
                     _loc13_.asset = _loc26_.content as BitmapData;
                     _loc13_.offsetX = -1 * _loc26_.offset.x - _loc6_ / 2 + _loc21_;
                     _loc13_.offsetY = -1 * _loc26_.offset.y + _loc22_;
                     _loc13_.relativeDepth = -0.01 - 0.1 * _loc16_ * _loc23_;
                     if(_loc17_.ink == 33)
                     {
                        _loc13_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc13_.blendMode = BlendMode.NORMAL;
                     }
                     _loc16_++;
                  }
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_318,this.var_218,this._postureParameter);
         if(this.var_1194 != null && this.var_1194 != "")
         {
            param1.appendAction(AvatarAction.const_299,this.var_1194);
         }
         if(this.var_1477 || this.var_1197)
         {
            param1.appendAction(AvatarAction.const_411);
         }
         param1.endActionAppends();
         var _loc2_:int = param1.getSprites().length + this.const_1128;
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function imageReady() : void
      {
         this.var_1789 = true;
      }
      
      public function petImageReady(param1:String) : void
      {
         this.resetAvatarImages();
      }
   }
}
