`import Ember from 'ember'`
`import layout from '../templates/components/item-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`

ItemDisplayComponent = Ember.Component.extend MixinsContainerMixin,
  layout:layout
  defaultTagName: 'div'
  defaultClassNames: ['object-display']
  defaultClassNameBindings: ['collapsed:collapsed:open']
  defaultCollapsible: false
  defaultCollapsed: false
  #classNames: ['testtest']
  init: ->
    @._super()
    console.log "init item display1"
    @setAttributes()
    console.log "init item display2"
  actions:
    labelClicked: (object, model) ->
      if @get 'collapsible'
        @toggleProperty('collapsed')
      @sendAction('labelClicked', object, model)
    valueClicked: (object, model) ->
      @sendAction('valueClicked', object, model)


`export default ItemDisplayComponent`
