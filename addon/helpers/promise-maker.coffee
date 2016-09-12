`import Ember from 'ember'`

# This function receives the params `params, hash`
promiseMaker = (params) ->
  return new Ember.RSVP.Promise (resolve) ->
    resolve(params[0])

PromiseMakerHelper = Ember.Helper.helper promiseMaker

`export { promiseMaker }`

`export default PromiseMakerHelper`
