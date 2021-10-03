package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_354:int = 1;
      
      public static const const_209:int = 2;
      
      public static const const_286:int = 3;
      
      public static const const_348:int = 4;
      
      public static const const_224:int = 5;
      
      public static const const_322:int = 1;
      
      public static const const_684:int = 2;
      
      public static const const_581:int = 3;
      
      public static const const_677:int = 4;
      
      public static const const_231:int = 5;
      
      public static const const_640:int = 6;
      
      public static const const_777:int = 7;
      
      public static const const_197:int = 8;
      
      public static const const_372:int = 9;
      
      public static const const_1684:int = 10;
      
      public static const const_769:int = 11;
      
      public static const const_432:int = 12;
       
      
      private var var_385:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_385 = new Array();
         this.var_385.push(new Tab(this._navigator,const_354,const_432,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_418));
         this.var_385.push(new Tab(this._navigator,const_209,const_322,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_418));
         this.var_385.push(new Tab(this._navigator,const_348,const_769,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1017));
         this.var_385.push(new Tab(this._navigator,const_286,const_231,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_418));
         this.var_385.push(new Tab(this._navigator,const_224,const_197,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_657));
         this.setSelectedTab(const_354);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_348;
      }
      
      public function get tabs() : Array
      {
         return this.var_385;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_385)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_385)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_385)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
