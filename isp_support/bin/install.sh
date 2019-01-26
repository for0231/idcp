#!/bin/bash
# Install system

#sed -i 's/^include/#include/' sites/default/settings.php

drush si -y --account-pass=admin --db-url=mysql://drupal:drupal@mysql/drupal

drupal moi memcache
#sed -i 's/^#include/include/' sites/default/settings.php

# Fix Plugin (language) instance class "\Drupal\language\DefaultLanguageItem" does not exist.
drush cr

drush pmu -y contextual dblog toolbar

drupal moi block_class role_frontpage role_menu small_title user_plus

# enable it in prod.
#drupal moi -y memcache memcache_admin
## Install for dev
drupal moi -y devel kint webprofiler
drush pmu -y toolbar

#drush views:slideshow:lib
drush cset system.performance js.preprocess 0 -y
drush cset system.performance css.preprocess 0 -y
drush cset user.settings password_strength false -y
drush cset user.settings register visitors -y
drush cset user.settings verify_mail false -y


drupal thi smart -y
drush cset -y system.theme default smart
drush cset -y system.theme admin smart

#drush language-add zh-hans

# isp modules
drush en -y comp

