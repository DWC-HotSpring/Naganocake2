# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#address_zipcode").jpostal({
    postcode : [ "#address_zipcode" ],


    # 入力項目フォーマット
    #   %3  都道府県
    #   %4  市区町村
    #   %5  町域
    #   %6  番地
    address  : {
                  "#order_new_add_prefecture_code" : "%3",
                  "#address_city"            : "%4%5",
                  "#address_block"          : "%6%7"
                }
  })
