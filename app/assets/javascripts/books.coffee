# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $('.grid.books').masonry({
    columnWidth: '.grid-sizer',
    itemSelector: '.grid-item',
    # percentPosition: true,
    gutter: 5,
    fitWidth: true
  });
  $('.grid.pages').masonry({
    columnWidth: '.grid-sizer',
    itemSelector: '.grid-item',
    # percentPosition: true,
    gutter: 5,
    fitWidth: true
  });
