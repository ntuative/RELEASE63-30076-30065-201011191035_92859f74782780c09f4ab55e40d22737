package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
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
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_810:String = "avatar";
      
      private static const const_536:Number = -0.01;
      
      private static const const_535:Number = -0.409;
      
      private static const const_811:int = 2;
      
      private static const const_1129:Array = [0,0,0];
       
      
      private var var_519:AvatarVisualizationData = null;
      
      private var var_480:Map;
      
      private var var_1119:int = 0;
      
      private var var_783:Boolean;
      
      private var var_574:String;
      
      private var var_849:String;
      
      private var var_1118:int = 0;
      
      private var var_521:BitmapDataAsset;
      
      private var var_769:BitmapDataAsset;
      
      private var var_1472:int = -1;
      
      private var var_1476:int = -1;
      
      private var var_1471:int = -1;
      
      private const const_812:int = 0;
      
      private const const_1537:int = 1;
      
      private const const_1502:int = 2;
      
      private const const_1503:int = 3;
      
      private const const_1128:int = 4;
      
      private var var_1559:int = -1;
      
      private var var_218:String = "";
      
      private var _postureParameter:String = "";
      
      private var var_1475:Boolean = false;
      
      private var var_1474:Boolean = false;
      
      private var var_1477:Boolean = false;
      
      private var var_1197:Boolean = false;
      
      private var var_815:Boolean = false;
      
      private var var_1194:int = 0;
      
      private var var_1195:int = 0;
      
      private var var_1989:int = 0;
      
      private var var_1198:int = 0;
      
      private var var_638:int = 0;
      
      private var var_520:int = 0;
      
      private var var_1196:int = 0;
      
      private var var_950:Boolean = false;
      
      private var var_1473:Boolean = false;
      
      private var var_949:int = 0;
      
      private var var_770:int = 0;
      
      private var var_51:IAvatarImage = null;
      
      private var var_921:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_480 = new Map();
         this.var_783 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_480 != null)
         {
            this.resetImages();
            this.var_480.dispose();
            this.var_480 = null;
         }
         this.var_519 = null;
         this.var_521 = null;
         this.var_769 = null;
         super.dispose();
         this.var_921 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_921;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_519 = param1 as AvatarVisualizationData;
         createSprites(this.const_1128);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_212)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_206) > 0 && param3);
            if(_loc5_ != this.var_1475)
            {
               this.var_1475 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_235) > 0;
            if(_loc5_ != this.var_1474)
            {
               this.var_1474 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_466) > 0;
            if(_loc5_ != this.var_1477)
            {
               this.var_1477 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_579) > 0 && param3);
            if(_loc5_ != this.var_1197)
            {
               this.var_1197 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_993) > 0;
            if(_loc5_ != this.var_815)
            {
               this.var_815 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_267);
            if(_loc6_ != this.var_1194)
            {
               this.var_1194 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_494);
            if(_loc7_ != this.var_218)
            {
               this.var_218 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_741);
            if(_loc7_ != this._postureParameter)
            {
               this._postureParameter = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_985);
            if(_loc6_ != this.var_1195)
            {
               this.var_1195 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_506);
            if(_loc6_ != this.var_1198)
            {
               this.var_1198 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_446);
            if(_loc6_ != this.var_638)
            {
               this.var_638 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_369);
            if(_loc6_ != this.var_520)
            {
               this.var_520 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_344);
            if(_loc6_ != this.var_1472)
            {
               this.var_1472 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_638 > 0 && param1.getNumber(RoomObjectVariableEnum.const_369) > 0)
            {
               if(this.var_520 != this.var_638)
               {
                  this.var_520 = this.var_638;
                  _loc4_ = true;
               }
            }
            else if(this.var_520 != 0)
            {
               this.var_520 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_764);
            if(_loc6_ != this.var_949)
            {
               this.var_949 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_894);
            if(_loc7_ != this.var_849)
            {
               this.var_849 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_175);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            var_212 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this.var_574 != param1)
         {
            this.var_574 = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_480)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_480.reset();
         this.var_51 = null;
         _loc2_ = getSprite(this.const_812);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1197 = false;
         }
         if(this.var_218 == "sit" || this.var_218 == "lay")
         {
            this.var_1196 = param1 / 2;
         }
         else
         {
            this.var_1196 = 0;
         }
         this.var_1473 = false;
         this.var_950 = false;
         if(this.var_218 == "lay")
         {
            this.var_950 = true;
            _loc2_ = int(this._postureParameter);
            if(_loc2_ < 0)
            {
               this.var_1473 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = this.var_480.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = this.var_519.getAvatar(this.var_574,param1,this.var_849,this);
            if(_loc3_ != null)
            {
               this.var_480.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_403 != param1.getUpdateID() || this.var_1559 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_1472;
            if(this.var_218 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_1476 || param4)
            {
               _loc5_ = true;
               this.var_1476 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_51.setDirectionAngle(AvatarSetType.const_32,_loc6_);
            }
            if(_loc7_ != this.var_1471 || param4)
            {
               _loc5_ = true;
               this.var_1471 = _loc7_;
               if(this.var_1471 != this.var_1476)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_51.setDirectionAngle(AvatarSetType.const_43,_loc7_);
               }
            }
            var_403 = param1.getUpdateID();
            this.var_1559 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1537);
         this.var_521 = null;
         if(this.var_218 == "mv" || this.var_218 == "std")
         {
            _loc2_.visible = true;
            if(this.var_521 == null || param1 != var_251)
            {
               _loc3_ = 0;
               _loc4_ = 0;
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
               if(this.var_521 != null)
               {
                  _loc2_.asset = this.var_521.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_521 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_769 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1502);
         if(this.var_815)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_769 = this.var_519.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_769 = this.var_519.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_218 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_218 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_769 != null)
            {
               _loc2_.asset = this.var_769.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_1503);
         if(this.var_949 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_519.getAvatarRendererAsset("number_" + this.var_949 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_519.getAvatarRendererAsset("number_" + this.var_949 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_218 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_218 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_770 = 1;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_770 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1503);
         var _loc3_:int = _loc2_.alpha;
         if(this.var_770 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_770 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_770 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_770 = 0;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            else if(param1 < 48)
            {
               _loc2_.offsetY -= 2;
            }
            else
            {
               _loc2_.offsetY -= 4;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return false;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:* = null;
         var _loc29_:* = null;
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
         var _loc6_:Number = param1.scale;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = this.updateModel(_loc5_,_loc6_,param3);
         if(this.animateNumberBubble(_loc6_))
         {
            increaseUpdateId();
         }
         if(_loc10_ || _loc6_ != var_251 || this.var_51 == null)
         {
            if(_loc6_ != var_251)
            {
               _loc8_ = true;
               this.validateActions(_loc6_);
            }
            if(_loc8_ || this.var_51 == null)
            {
               this.var_51 = this.getAvatarImage(_loc6_);
               if(this.var_51 == null)
               {
                  return;
               }
               _loc7_ = true;
               _loc13_ = getSprite(this.const_812);
               if(_loc13_ && this.var_51 && this.var_51.isPlaceholder())
               {
                  _loc13_.alpha = 150;
               }
               else if(_loc13_)
               {
                  _loc13_.alpha = 255;
               }
            }
            if(this.var_51 == null)
            {
               return;
            }
            this.updateShadow(_loc6_);
            if(_loc8_)
            {
               this.updateTypingBubble(_loc6_);
               this.updateNumberBubble(_loc6_);
            }
            _loc9_ = this.updateObject(_loc4_,param1,param3,true);
            this.updateActions(this.var_51);
            var_251 = _loc6_;
         }
         else
         {
            _loc9_ = this.updateObject(_loc4_,param1,param3);
         }
         var _loc11_:Boolean = _loc9_ || _loc10_ || _loc8_;
         var _loc12_:Boolean = (this.var_783 || this.var_1118 > 0) && param3;
         if(_loc11_)
         {
            this.var_1118 = const_811;
         }
         if(_loc11_ || _loc12_)
         {
            increaseUpdateId();
            --this.var_1118;
            --this.var_1119;
            if(!(this.var_1119 <= 0 || _loc8_ || _loc10_ || _loc7_))
            {
               return;
            }
            this.var_51.updateAnimationByFrames(1);
            this.var_1119 = const_811;
            _loc15_ = this.var_51.getCanvasOffsets();
            if(_loc15_ == null || _loc15_.length < 3)
            {
               _loc15_ = const_1129;
            }
            _loc14_ = getSprite(this.const_812);
            if(_loc14_ != null)
            {
               _loc18_ = this.var_51.getImage(AvatarSetType.const_32,false);
               if(_loc18_ != null)
               {
                  _loc14_.asset = _loc18_;
               }
               if(_loc14_.asset)
               {
                  _loc14_.offsetX = -1 * _loc6_ / 2 + _loc15_[0];
                  _loc14_.offsetY = -_loc14_.asset.height + _loc6_ / 4 + _loc15_[1] + this.var_1196;
               }
               if(this.var_950)
               {
                  if(this.var_1473)
                  {
                     _loc14_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc14_.relativeDepth = const_535 + _loc15_[2];
                  }
               }
               else
               {
                  _loc14_.relativeDepth = const_536 + _loc15_[2];
               }
            }
            _loc14_ = getSprite(this.const_1502);
            if(_loc14_ != null && _loc14_.visible)
            {
               if(!this.var_950)
               {
                  _loc14_.relativeDepth = const_536 - 0.01 + _loc15_[2];
               }
               else
               {
                  _loc14_.relativeDepth = const_535 - 0.01 + _loc15_[2];
               }
            }
            this.var_783 = this.var_51.isAnimating();
            _loc16_ = this.const_1128;
            for each(_loc17_ in this.var_51.getSprites())
            {
               if(_loc17_.id == const_810)
               {
                  _loc14_ = getSprite(this.const_812);
                  _loc19_ = this.var_51.getLayerData(_loc17_);
                  _loc20_ = _loc17_.getDirectionOffsetX(this.var_51.getDirection());
                  _loc21_ = _loc17_.getDirectionOffsetY(this.var_51.getDirection());
                  if(_loc19_ != null)
                  {
                     _loc20_ += _loc19_.dx;
                     _loc21_ += _loc19_.dy;
                  }
                  if(_loc6_ < 48)
                  {
                     _loc20_ /= 2;
                     _loc21_ /= 2;
                  }
                  _loc14_.offsetX += _loc20_;
                  _loc14_.offsetY += _loc21_;
               }
               else
               {
                  _loc14_ = getSprite(_loc16_);
                  if(_loc14_ != null)
                  {
                     _loc14_.capturesMouse = false;
                     _loc14_.visible = true;
                     _loc22_ = this.var_51.getLayerData(_loc17_);
                     _loc23_ = 0;
                     _loc24_ = _loc17_.getDirectionOffsetX(this.var_51.getDirection());
                     _loc25_ = _loc17_.getDirectionOffsetY(this.var_51.getDirection());
                     _loc26_ = _loc17_.getDirectionOffsetZ(this.var_51.getDirection());
                     _loc27_ = 0;
                     if(_loc17_.hasDirections)
                     {
                        _loc27_ = this.var_51.getDirection();
                     }
                     if(_loc22_ != null)
                     {
                        _loc23_ = _loc22_.animationFrame;
                        _loc24_ += _loc22_.dx;
                        _loc25_ += _loc22_.dy;
                        _loc27_ += _loc22_.directionOffset;
                     }
                     if(_loc6_ < 48)
                     {
                        _loc24_ /= 2;
                        _loc25_ /= 2;
                     }
                     if(_loc27_ < 0)
                     {
                        _loc27_ += 8;
                     }
                     else if(_loc27_ > 7)
                     {
                        _loc27_ -= 8;
                     }
                     _loc28_ = this.var_51.getScale() + "_" + _loc17_.member + "_" + _loc27_ + "_" + _loc23_;
                     _loc29_ = this.var_51.getAsset(_loc28_);
                     if(_loc29_ == null)
                     {
                        continue;
                     }
                     _loc14_.asset = _loc29_.content as BitmapData;
                     _loc14_.offsetX = -_loc29_.offset.x - _loc6_ / 2 + _loc24_;
                     _loc14_.offsetY = -_loc29_.offset.y + _loc25_ + this.var_1196;
                     if(this.var_950)
                     {
                        _loc14_.relativeDepth = const_535 - 0.001 * spriteCount * _loc26_;
                     }
                     else
                     {
                        _loc14_.relativeDepth = const_536 - 0.001 * spriteCount * _loc26_;
                     }
                     if(_loc17_.ink == 33)
                     {
                        _loc14_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc14_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc16_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_318,this.var_218,this._postureParameter);
         if(this.var_1194 > 0)
         {
            param1.appendAction(AvatarAction.const_299,AvatarAction.const_1372[this.var_1194]);
         }
         if(this.var_1195 > 0)
         {
            param1.appendAction(AvatarAction.const_765,this.var_1195);
         }
         if(this.var_1989 > 0)
         {
            param1.appendAction(AvatarAction.const_593,this.var_1989);
         }
         if(this.var_638 > 0)
         {
            param1.appendAction(AvatarAction.const_732,this.var_638);
         }
         if(this.var_520 > 0)
         {
            param1.appendAction(AvatarAction.const_663,this.var_520);
         }
         if(this.var_1475)
         {
            param1.appendAction(AvatarAction.const_293);
         }
         if(this.var_1477 || this.var_1197)
         {
            param1.appendAction(AvatarAction.const_411);
         }
         if(this.var_1474)
         {
            param1.appendAction(AvatarAction.const_211);
         }
         if(this.var_1198 > 0)
         {
            param1.appendAction(AvatarAction.const_285,this.var_1198);
         }
         param1.endActionAppends();
         this.var_783 = param1.isAnimating();
         var _loc2_:int = this.const_1128;
         for each(_loc3_ in this.var_51.getSprites())
         {
            if(_loc3_.id != const_810)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}
