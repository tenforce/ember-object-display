`import Ember from 'ember'`
`import layout from '../templates/components/items-display'`
`import MixinsContainerMixin from '../mixins/mixins-container'`

ItemsDisplayComponent = Ember.Component.extend MixinsContainerMixin,
  layout:layout

  actions:
    handleHideItem: (context, index) ->
      console.log "model : "+JSON.stringify(context.get('model'))
      console.log "index : "+index

`export default ItemsDisplayComponent`
