import Ember from 'ember';

export default Ember.Mixin.create({
    didInsertElement: function() {
        this._super();
        Ember.run.later(function() {
            // implement this hook in your own subclasses and run your jQuery logic there

            Ember.$.each(Ember.$('textarea'), function() {
                var offset = this.offsetHeight - this.clientHeight;
                console.log(this.offsetHeight);
                console.log(this.clientHeight);

                var resizeTextarea = function(el) {
                    Ember.$(el).css('height', 'auto').css('height', el.scrollHeight + offset);
                };
                Ember.$(this).on('keyup input', function() {
                    resizeTextarea(this);
                }).removeAttr('data-autoresize');
            });
        });
    }
});
