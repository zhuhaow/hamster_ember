`import Ember from 'ember';`

ImageSelector = Ember.Component.extend
  remotePath: Ember.computed.alias 'config.parent_path'
  actions:
    selectAll: ->
      @get("images").forEach (item) ->
        item.set("isSelected", true)
    deselectAll: ->
      @get("images").forEach (item) ->
        item.set("isSelected", false)
    crawl: ->
      @get("onCrawl")()
    cancel: ->
      @get("onCancel")()

`export default ImageSelector`
