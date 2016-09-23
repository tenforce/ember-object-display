`import Ember from 'ember'`
`import layout from '../templates/components/items-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`

ItemsDisplayComponent = Ember.Component.extend MixinsContainerMixin,
  layout:layout
  defaultTagName: 'div'
  defaultClassNames: ['items-display']
  defaultClassNameBindings: ['collapsed:collapsed:open']
  defaultCollapsible: false
  defaultCollapsed: false

  arrayLength: Ember.computed 'object', 'model.values.length', ->
    @get('model.values.length')

  emptyItems: 0
  cleanState: () ->
    @set('emptyItems', 0)

  checkEmptyItems: Ember.observer('object', 'arrayLength', 'emptyItems', () ->
    if @get('arrayLength') is @get('emptyItems') then @set('empty', true)
  ).on('init')

  actions:
    handleHideItem: (context, index) ->
      context.set('model._shouldHide', true)
      @incrementProperty('emptyItems')

`export default ItemsDisplayComponent`
