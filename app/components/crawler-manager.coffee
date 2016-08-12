`import Ember from 'ember'`

Image = Ember.Object.extend
  init: ->
    @set('isSelected', true)

Config = Ember.Object.extend()

CrawlerManager = Ember.Component.extend
    isInputShowing: true
    images: []
    config: null
    selectedImages: Ember.computed 'images.@each.selected', ->
      @get('images').filterBy('isSelected', true)
    error: ''

    actions:
      onSubmit: (url) ->
        @set('error', '')
        Ember.$.ajax
          type: "POST"
          url: "api/crawl/parse"
          data: {url: url}
          success: (data) =>
            image_data = data.images
            @set("config", Config.create data.config)
            images = image_data.map (item) ->
              Image.create item
            @set("images", images)
          error: (xhr) =>
            @set('error', xhr.responseJSON.info)
          datatype: "json"
        return
      onCrawl: () ->
        Ember.$.ajax
          type: "POST"
          url: "api/crawl/crawl"
          data: JSON.stringify({"images": @get("selectedImages"), "config": @get("config")})
      onCancel: ->
        @set("images", [])

`export default CrawlerManager`
