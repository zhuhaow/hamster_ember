`import Ember from 'ember'`

AddressInput = Ember.Component.extend
  value: undefined
  validated: Ember.computed 'value', () ->
    if @get('value')
      return @get('value').match(/^((https?):\/\/)[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@\#\/%=~_|]/)?
    else
      return true

  actions:
    submit: () ->
      @get('onSubmit')(@get('value'))
      return

`export default AddressInput`
