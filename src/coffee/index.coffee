combokeys = new (require "combokeys") document

openPage = ($page) ->
  return if $page.length is 0
  $prevPage = ($ ".page.show").first()
  closePage $prevPage
  $page.addClass "show"
  $inner = $page.find ">.inner"
  height = $inner[0].offsetHeight
  $inner.css top: (window.innerHeight - height)/2

closePage = ($page) ->
  $page.removeClass "show"

next = ->
  openPage ($ ".page.show").next()

prev = ->
  openPage ($ ".page.show").prev()

openPage ($ ".page").first()

combokeys.bind "right", next
combokeys.bind "left", prev
combokeys.bind "down", next
combokeys.bind "up", prev
combokeys.bind "shift+right", -> openPage $ ".page:last-child"
combokeys.bind "shift+left", -> openPage $ ".page:first-child"
combokeys.bind "shift+down", -> openPage $ ".page:last-child"
combokeys.bind "shift+up", -> openPage $ ".page:first-child"
