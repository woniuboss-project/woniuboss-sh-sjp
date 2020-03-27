Action()
{
	//denglu
	lr_think_time(3);
	web_reg_save_param_json(
		"ParamName=logindata",
		"QueryString=$.error",
		SEARCH_FILTERS,
		"Scope=BODY",
		LAST);


	web_submit_data("login_request",
		"Action=https://snailpet.com/v2/Passport/login",
		"Method=POST",
		"TargetFrame=",
		"Referer=",
		ITEMDATA,
		"Name=phone", "Value={phone}", ENDITEM,
		"Name=password", "Value={password}", ENDITEM,
		"Name=shop_id", "Value=null", ENDITEM,
		LAST);
	

	lr_output_message(lr_eval_string("{logindata}"));
	if(atoi(lr_eval_string("{logindata}")) == 1){
		lr_output_message("login_success");
	}else{
		lr_output_message("login_fail");
	}
 
	lr_think_time(3);

	//xinzengyonghu
	web_reg_save_param_json(
		"ParamName=addcheckpoint",
		"QueryString=$.error",
		SEARCH_FILTERS,
		"Scope=BODY",
		LAST);
	
	web_custom_request("add_customer",
		"URL=https://snailpet.com/v2/Shop/setMemberLevel",
		"Method=post",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"Body={\"name\":\"jtt\",\"minPrice\":\10\,\"enablePlus\":\0\,\"background\":\0\,\"discount\":\10\,\"discountForService\":\10\,\"discount_for_combination\":\10\,\"shopId\":\17529\,\"shop_id\":\17529\}",LAST);
  
  
	lr_output_message(lr_eval_string("{addcheckpoint}"));
	if(atoi(lr_eval_string("{addcheckpoint}")) == 1){
		lr_output_message("add_success");
	}else{
		lr_output_message("add_fail");
	}
	
	lr_think_time(5);
 
  //xiaofei zhichu
  	web_reg_save_param_json(
		"ParamName=salescheckpoint",
		"QueryString=$.error",
		SEARCH_FILTERS,
		"Scope=BODY",
		LAST);
	

	web_submit_data("sales",
		"Action=https://snailpet.com/v2/Shop/addSpending",
		"Method=POST",
		"TargetFrame=",
		"Referer=",
		ITEMDATA,
		"Name=actionTime", "Value=1000000000", ENDITEM,
		"Name=type", "Value=11", ENDITEM,
		"Name=mark", "Value=wu", ENDITEM,
		"Name=amount", "Value=100", ENDITEM,
		"Name=shopId", "Value=17529", ENDITEM,
		"Name=shop_id", "Value=17529", ENDITEM,
		LAST);

  		lr_output_message(lr_eval_string("{salescheckpoint}"));
	if(atoi(lr_eval_string("{salescheckpoint}")) == 0){
		lr_output_message("sales_success");
	}else{
		lr_output_message("sales_fail");
	}
  		
  	lr_think_time(5);
  		
	//goods kucun
  	web_reg_save_param_json(
		"ParamName=goodscheckpoint",
		"QueryString=$.error",
		SEARCH_FILTERS,
		"Scope=BODY",
		LAST);
  		
  	web_submit_data("queryGoods",
		"Action=https://snailpet.com/v2/Product/getList?page=1&statistics=1&keywords=11111&categoryId=0&tags=&tag_is_in=1&order_by=updated&is_order_asc=0&shopId=17529&shop_id=17529",
		"Method=GET",
		"TargetFrame=",
		"Referer=",
		ITEMDATA,
		LAST); 	
  		
  	 lr_output_message(lr_eval_string("{goodscheckpoint}"));
	if(atoi(lr_eval_string("{goodscheckpoint}")) == 0){
		lr_output_message("queryGoods_success");
	}else{
		lr_output_message("queryGoods_fail");
	}

  	 //goods 
  	 
  	 web_reg_save_param_json(
		"ParamName=salesgoodscheckpoint",
		"QueryString=$.error",
		SEARCH_FILTERS,
		"Scope=BODY",
		LAST);
  	 
	 web_custom_request("sales_goods",
		"URL=https://snailpet.com/v2/product/update/stocks",
		"Method=post",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"Body={\"productId\":\2133552\,\"shopId\":\17529\,\"number\":\-2\,\"mark\": \"\",\"shelf_life\":\0\,\"production_time\":\null\,\"exp_time\":\null\,\"out_of_price\":\100\,\"shop_id\":\17529\}",LAST);
  	
  	lr_output_message(lr_eval_string("{salesgoodscheckpoint}"));
	if(atoi(lr_eval_string("{salesgoodscheckpoint}")) == 0){
		lr_output_message("sales_goods_sucessful");
	}else{
		lr_output_message("sales_goods_fail");
	}
	return 0;
}
