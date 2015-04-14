Snapt.Models.Photo = Backbone.Model.extend({
  urlRoot: '/api/photos',

  parse: function (resp) {
    if (resp.comments) {
      this.comments().set(resp.comments, { parse: true });
      delete resp.comments
    }
    return resp;
  },

  comments: function () {
    if (!this._comments) {
      this._comments = new Snapt.Collections.Comments(
        [], { photo: this }
      )
    }

    return this._comments
  },

  isAuthor: function() {
    return Snapt.currentUser.id === this.get('author_id');
  },

  cloudinaryUrl: function(options) {
    var params = {
      width: 800,
      height: 600,
      crop: 'fill',
    }

    return (
      $.cloudinary.image(
        this.escape('public_id'),
        params
      )[0].outerHTML
    )
  }
});
