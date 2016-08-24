import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('test-addon-thing', 'Integration | Component | test addon thing', {
  integration: true
});

test('it renders', function(assert) {
  // Set any properties with this.set('myProperty', 'value');
  // Handle any actions with this.on('myAction', function(val) { ... });"

  this.render(hbs`{{test-addon-thing}}`);

  assert.equal(this.$().text().trim(), '');

  // Template block usage:"
  this.render(hbs`
    {{#test-addon-thing}}
      template block text
    {{/test-addon-thing}}
  `);

  assert.equal(this.$().text().trim(), 'template block text');
});
