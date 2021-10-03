package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_693:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_921)
         {
            _structure = null;
            _assets = null;
            var_217 = null;
            var_250 = null;
            var_574 = null;
            var_500 = null;
            var_281 = null;
            if(!var_1153 && var_39)
            {
               var_39.dispose();
            }
            var_39 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_690 = null;
            var_921 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_693[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_693[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_318:
               switch(_loc3_)
               {
                  case AvatarAction.const_791:
                  case AvatarAction.const_481:
                  case AvatarAction.const_325:
                  case AvatarAction.const_726:
                  case AvatarAction.const_361:
                  case AvatarAction.const_553:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_285:
            case AvatarAction.const_765:
            case AvatarAction.const_211:
            case AvatarAction.const_593:
            case AvatarAction.const_732:
            case AvatarAction.const_663:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
