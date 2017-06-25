$ ->
  $( "#product-search-box" ).autocomplete
    source: "/admin/shopify_products/"
    minLength: 2
    select: ( event, ui ) ->
      $.post(
        '/admin/carousel_items',
        {
          carousel_item:
            shopify_product_id: ui.item.id
            product_title: ui.item.value
        },
        ((res) ->
          $('#carousel-items-list').html(res.carousel_items_content);
          $('input#product-search-box').val('');
        )
      )
