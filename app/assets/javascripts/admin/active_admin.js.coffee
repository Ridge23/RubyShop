#= require active_admin/base

sendSortRequestOfModel = (model_name) ->
  formData = $('#index_table_' + model_name + ' tbody').sortable('serialize')
  formData += "&" + $('meta[name=csrf-param]').attr("content") + "=" + encodeURIComponent($('meta[name=csrf-token]').attr("content"))
  $.ajax
    type: 'post'
    data: formData
    dataType: 'script'
    url: '/admin/' + model_name + '/sort'

jQuery ($) ->

  # home page slides
    $( "#index_table_main_items tbody" ).disableSelection()
    $( "#index_table_main_items tbody" ).sortable
      axis: 'y'
      cursor: 'move'
      update: (event, ui) ->
        sendSortRequestOfModel("main_items")