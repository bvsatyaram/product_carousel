$ ->
  $( "#product-search-box" ).autocomplete
    source: "/shopify_products/",
    minLength: 2,
    select: ( event, ui ) ->
      $.post(
        '/carousel_items',
        {
          carousel_item:
            shopify_product_id: ui.item.id
            product_title: ui.item.value
        },
        (res) ->
          $('#carousel-items').append("<li class='list-group-item'>" + res.product.name + "</li>");
          $('input#product-search-box').val('');
      )
