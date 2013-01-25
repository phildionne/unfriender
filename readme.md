# Unfriender
A tiny ruby app to speed up facebook unfriending

## Getting started
1. Go to `https://developers.facebook.com/docs/reference/api/examples/`
2. Get all your facebook friends: `https://graph.facebook.com/me/friends?access_token=ACCESS_TOKEN` and select the ids of those you'd like to unfriend
3. Set `FACEBOOK_USERNAME` and `FACEBOOK_PASSWORD` environment variables
4. Run:

```
bundle install
ruby app.rb
```

---

# Author
[Philippe Dionne](http://phildionne.com)

# Copyright and license

Copyright 2012 Philippe Dionne

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this work except in compliance with the License. You may obtain a copy of the License in the LICENSE file, or at:

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
