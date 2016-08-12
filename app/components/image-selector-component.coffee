`import Ember from 'ember';`

ImageSelectorComponent =  Ember.Component.extend
  classNames: ['card']
  actions:
    toggleSelection: ->
      image = @get('image').toggleProperty('isSelected')
      return

`export default ImageSelectorComponent;`
