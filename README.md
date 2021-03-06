# [Snapt][snapt]

[snapt]: http://www.snapt.io

Snapt is a clone of Instagram built on Rails and Backbone.

## Minimum Viable Product

Users can:

<!-- This is a Markdown checklist. Use it to keep track of your progress! -->

- [x] Create accounts
- [x] Create sessions (log in)
- [x] Upload photos
- [x] Crop photos uploaded from desktop
- [x] Upload photos from mobile
- [x] View other users
- [x] Follow users
- [x] Search by username (will match partial names)
- [x] Add comments to photos
- [x] View a feed of followed users
- [x] Like photos
- [ ] Add tags to photos
- [ ] Tag users in photos/comments
- [ ] Search for photos by tag
- [ ] Search for posts by tag

## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Photo Uploading (~1 day)
I will implement user authentication in Rails based on the practices learned at
App Academy. By the end of this phase, users will be able to create upload photos using
a simple form in a Rails view. The most important part of this phase will
be pushing the app to Heroku and ensuring that everything works before moving on
to phase 2.

[Details][phase-one]

### Phase 2: Viewing Blogs and Posts (~2 days)
I will add API routes to serve photo and comment data as JSON, then add Backbone
models and collections that fetch data from those routes. By the end of this
phase, users will be able to comment photos and view both comments and photos, all
inside a single Backbone app.

[Details][phase-two]

<!-- ### Phase 3: Editing and Displaying Posts (~2 days)
I plan to use third-party libraries to add functionality to the `PostForm` and
`PostShow` views in this phase. First I'll need to add a Markdown editor to the
`PostForm`, and make sure that the Markdown is properly escaped and formatted in
the `PostShow` view. I also plan to integrate Filepicker for file upload so
users can add images to blog posts.

[Details][phase-three]

### Phase 4: User Feeds (~1-2 days)
I'll start by adding a `feed` route that uses the `current_user`'s
`subscribed_blogs` association to serve a list of blog posts ordered
chronologically. On the Backbone side, I'll make a `FeedShow` view whose `posts`
collection fetches from the new route.  Ultimately, this will be the page users
see after logging in.

[Details][phase-four]

### Phase 5: Searching for Blogs and Posts (~2 days)
I'll need to add `search` routes to both the Blogs and Posts controllers. On the
Backbone side, there will be a `SearchResults` composite view has `BlogsIndex`
and `PostsIndex` subviews. These views will use plain old `blogs` and `posts`
collections, but they will fetch from the new `search` routes.

[Details][phase-five] -->

### Bonus Features (TBD)
<!-- - [ ] "Like" button and counter for posts
- [ ] Custom blog urls
- [ ] Pagination/infinite scroll
- [ ] Activity history (e.g. likes, reblogs, taggings)
- [ ] Post types (image posts, quote posts, etc)
- [ ] Reblogging
- [ ] Multiple sessions/session management
- [ ] User avatars
- [ ] Typeahead search bar -->

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
