package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1382:String = "pricing_model_unknown";
      
      public static const const_440:String = "pricing_model_single";
      
      public static const const_531:String = "pricing_model_multi";
      
      public static const const_508:String = "pricing_model_bundle";
      
      public static const const_1025:String = "price_type_none";
      
      public static const const_392:String = "price_type_credits";
      
      public static const const_607:String = "price_type_activitypoints";
      
      public static const const_666:String = "price_type_credits_and_activitypoints";
       
      
      private var var_721:String;
      
      private var var_1115:String;
      
      private var _offerId:int;
      
      private var var_1788:String;
      
      private var var_1116:int;
      
      private var var_1117:int;
      
      private var var_1654:int;
      
      private var var_369:ICatalogPage;
      
      private var var_722:IProductContainer;
      
      private var var_2500:int;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this._offerId = param1.offerId;
         this.var_1788 = param1.localizationId;
         this.var_1116 = param1.priceInCredits;
         this.var_1117 = param1.priceInActivityPoints;
         this.var_1654 = param1.activityPointType;
         this.var_369 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         this.analyzePricingModel(_loc3_);
         this.analyzePriceType();
         this.createProductContainer(_loc3_);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_369;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1788;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1116;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1117;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1654;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_722;
      }
      
      public function get pricingModel() : String
      {
         return this.var_721;
      }
      
      public function get priceType() : String
      {
         return this.var_1115;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2500;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2500 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1788 = "";
         this.var_1116 = 0;
         this.var_1117 = 0;
         this.var_1654 = 0;
         this.var_369 = null;
         if(this.var_722 != null)
         {
            this.var_722.dispose();
            this.var_722 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_721)
         {
            case const_440:
               this.var_722 = new SingleProductContainer(this,param1);
               break;
            case const_531:
               this.var_722 = new MultiProductContainer(this,param1);
               break;
            case const_508:
               this.var_722 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_721);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_721 = const_440;
            }
            else
            {
               this.var_721 = const_531;
            }
         }
         else if(param1.length > 1)
         {
            this.var_721 = const_508;
         }
         else
         {
            this.var_721 = const_1382;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1116 > 0 && this.var_1117 > 0)
         {
            this.var_1115 = const_666;
         }
         else if(this.var_1116 > 0)
         {
            this.var_1115 = const_392;
         }
         else if(this.var_1117 > 0)
         {
            this.var_1115 = const_607;
         }
         else
         {
            this.var_1115 = const_1025;
         }
      }
   }
}
