package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_161:String = "hex";
      
      public static const const_54:String = "int";
      
      public static const const_269:String = "uint";
      
      public static const const_230:String = "Number";
      
      public static const const_48:String = "Boolean";
      
      public static const const_91:String = "String";
      
      public static const const_200:String = "Point";
      
      public static const const_217:String = "Rectangle";
      
      public static const const_150:String = "Array";
      
      public static const const_243:String = "Map";
       
      
      private var var_549:String;
      
      private var var_158:Object;
      
      private var _type:String;
      
      private var var_2231:Boolean;
      
      private var var_2602:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         this.var_549 = param1;
         this.var_158 = param2;
         this._type = param3;
         this.var_2231 = param4;
         this.var_2602 = param3 == const_243 || param3 == const_150 || param3 == const_200 || param3 == const_217;
      }
      
      public function get key() : String
      {
         return this.var_549;
      }
      
      public function get value() : Object
      {
         return this.var_158;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get valid() : Boolean
      {
         return this.var_2231;
      }
      
      public function toString() : String
      {
         switch(this._type)
         {
            case const_161:
               return "0x" + uint(this.var_158).toString(16);
            case const_48:
               return Boolean(this.var_158) == true ? "HabboWindowManagerCom_habbo_window_alert_xml" : "false";
            case const_200:
               return "Point(" + Point(this.var_158).x + ", " + Point(this.var_158).y + ")";
            case const_217:
               return "Rectangle(" + Rectangle(this.var_158).x + ", " + Rectangle(this.var_158).y + ", " + Rectangle(this.var_158).width + ", " + Rectangle(this.var_158).height + ")";
            default:
               return String(this.value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(this._type)
         {
            case const_243:
               _loc3_ = this.var_158 as Map;
               _loc1_ = "<var key=\"" + this.var_549 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_150:
               _loc4_ = this.var_158 as Array;
               _loc1_ = "<var key=\"" + this.var_549 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_200:
               _loc5_ = this.var_158 as Point;
               _loc1_ = "<var key=\"" + this.var_549 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_217:
               _loc6_ = this.var_158 as Rectangle;
               _loc1_ = "<var key=\"" + this.var_549 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_161:
               _loc1_ = "<var key=\"" + this.var_549 + "\" value=\"" + "0x" + uint(this.var_158).toString(16) + "\" type=\"" + this._type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + this.var_549 + "\" value=\"" + this.var_158 + "\" type=\"" + this._type + "\" />";
         }
         return _loc1_;
      }
   }
}
