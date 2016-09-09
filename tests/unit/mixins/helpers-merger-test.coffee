`import Ember from 'ember'`
`import HelpersMergerMixin from '../../../mixins/helpers-merger'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | helpers merger'

# Replace this with your real tests.
test 'it works', (assert) ->
  HelpersMergerObject = Ember.Object.extend HelpersMergerMixin
  subject = HelpersMergerObject.create()
  assert.ok subject
