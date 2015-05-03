# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "upload:start", "form", (e) ->
  $(this).find("input[type=submit]").attr("disabled", true)
  $(this).find('.progress').removeClass('hidden')

$(document).on "upload:complete", "form", (e) ->
  if !$(this).find("input.uploading").length
    $(this).find("input[type=submit]").removeAttr("disabled")
    $(this).find('.progress').addClass('hidden')

$(document).on "upload:progress", "form", (e) ->
  detail = e.originalEvent.detail
  if detail.lengthComputable
    progress = parseInt(detail.loaded / detail.total * 100)
    $(this).find('.progress-bar').html("#{progress}% uploaded")
    $(this).find('.progress-bar').width("#{progress}%")
