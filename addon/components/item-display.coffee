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

  labelClicked: (context) ->
    if context.get 'collapsible'
      context.toggleProperty('collapsed')
    context.sendAction('handleLabelClicked', context)
  valueClicked: (context) ->
    context.sendAction('handleValueClicked', context)
  actions:
    handleLabelClicked: (context) ->
      # we send the context of this item, not the one received as parameter
      @get('helpers.labelClicked')(@)
    handleLoadingClicked: (context) ->
      # we send the context of this item, not the one received as parameter
      @get('helpers.loadingClicked')(@)
    handleValueClicked: (context) ->
      # we send the context of this item, not the one received as parameter
      @get('helpers.valueClicked')(@)


`export default ItemDisplayComponent`
