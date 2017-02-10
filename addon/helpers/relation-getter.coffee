`import Ember from 'ember'`

# This function receives the params `params, hash`
relationGetter = (params) ->
  # DEPRECATED
  return new Ember.RSVP.Promise (resolve) ->
    resolve(params[0].get(params[1].value))

RelationGetterHelper = Ember.Helper.helper relationGetter

`export { relationGetter }`

`export default RelationGetterHelper`
