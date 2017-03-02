echo "Enter table prefix with underline_, leave empty for f5sites_"
read WP_PREFIX

if [ "$WP_PREFIX"=="" ]; then
echo "Using default table prefix: f5sites_"
WP_PREFIX="f5sites_"
fi
