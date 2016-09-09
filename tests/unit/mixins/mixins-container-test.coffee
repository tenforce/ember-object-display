`import Ember from 'ember'`
`import MixinsContainerMixin from '../../../mixins/mixins-container'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | mixins container'

# Replace this with your real tests.
test 'it works', (assert) ->
  MixinsContainerObject = Ember.Object.extend MixinsContainerMixin
  subject = MixinsContainerObject.create()
  assert.ok subject
