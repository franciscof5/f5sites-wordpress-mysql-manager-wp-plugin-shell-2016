echo "Enter table prefix with underline_, leave empty for f5sites_"
read WP_PREFIX

if [ "$WP_PREFIX"=="" ]; then
echo "Using default table prefix: $DETAULT_TABLE_PREFIX"
WP_PREFIX="$DETAULT_TABLE_PREFIX"
fi
