<?php
/**
 * I-Dot Infra Theme Functions
 */

// Enqueue parent (Astra) and child theme styles with cache-busting
function idotinfra_enqueue_styles() {
    $parent_style = 'astra-theme-css';

    wp_enqueue_style(
        $parent_style,
        get_template_directory_uri() . '/style.css',
        array(),
        wp_get_theme('astra')->get('Version')
    );

    wp_enqueue_style(
        'idotinfra-style',
        get_stylesheet_directory_uri() . '/style.css',
        array($parent_style),
        filemtime(get_stylesheet_directory() . '/style.css')
    );
}
add_action('wp_enqueue_scripts', 'idotinfra_enqueue_styles', 15);

// Inject critical header/footer overrides after all Astra inline styles
function idotinfra_header_footer_overrides() {
    ?>
    <style id="idotinfra-header-footer-overrides">
        #masthead .site-logo-img img,
        #masthead .custom-logo-link img,
        #masthead .custom-logo,
        .site-header .site-logo-img img,
        .site-header .custom-logo {
            max-height: 50px !important;
            width: auto !important;
            height: auto !important;
            max-width: 200px !important;
        }
        #masthead .ast-site-title-wrap,
        .site-header .ast-site-title-wrap,
        .ast-logo-title-inline .ast-site-title-wrap {
            display: none !important;
        }
        .ast-small-footer,
        .site-footer {
            display: none !important;
        }
        .site-content > .ast-container {
            display: block !important;
        }
    </style>
    <?php
}
add_action('wp_head', 'idotinfra_header_footer_overrides', 999);

// Theme setup
function idotinfra_theme_setup() {
    add_theme_support('title-tag');
    add_theme_support('post-thumbnails');
    add_theme_support('custom-logo', array(
        'height'      => 100,
        'width'       => 300,
        'flex-height' => true,
        'flex-width'  => true,
    ));

    register_nav_menus(array(
        'primary' => __('Primary Menu', 'idotinfra'),
        'footer'  => __('Footer Menu', 'idotinfra'),
    ));
}
add_action('after_setup_theme', 'idotinfra_theme_setup');

// Register Project custom post type
function idotinfra_register_project_cpt() {
    $labels = array(
        'name'               => 'Projects',
        'singular_name'      => 'Project',
        'menu_name'          => 'Projects',
        'add_new'            => 'Add New Project',
        'add_new_item'       => 'Add New Project',
        'edit_item'          => 'Edit Project',
        'new_item'           => 'New Project',
        'view_item'          => 'View Project',
        'search_items'       => 'Search Projects',
        'not_found'          => 'No projects found',
    );

    $args = array(
        'labels'             => $labels,
        'public'             => true,
        'has_archive'        => false,
        'menu_icon'          => 'dashicons-building',
        'supports'           => array('title', 'editor', 'thumbnail', 'custom-fields'),
        'rewrite'            => array('slug' => 'project'),
        'show_in_rest'       => true,
    );

    register_post_type('project', $args);
}
add_action('init', 'idotinfra_register_project_cpt');

// Add project meta boxes
function idotinfra_project_meta_boxes() {
    add_meta_box(
        'idotinfra_project_details',
        'Project Details',
        'idotinfra_project_meta_callback',
        'project',
        'normal',
        'high'
    );
}
add_action('add_meta_boxes', 'idotinfra_project_meta_boxes');

function idotinfra_project_meta_callback($post) {
    wp_nonce_field('idotinfra_project_meta', 'idotinfra_project_nonce');

    if (!has_post_thumbnail($post->ID)) {
        echo '<div style="background:#fff3cd;border:1px solid #ffc107;padding:12px 16px;border-radius:4px;margin-bottom:16px;">';
        echo '<strong>Tip:</strong> Set a <em>Featured Image</em> (in the right sidebar) for this project. It will be used as the project card thumbnail and hero banner on the project page.';
        echo '</div>';
    }

    $fields = array(
        'project_type'       => 'Project Type (e.g., Residential Apartment)',
        'project_location'   => 'Location',
        'project_config'     => 'Configuration (e.g., 2 BHK, 3 BHK)',
        'project_area'       => 'Area Range (e.g., 635-893 sq ft)',
        'project_status'     => 'Status (Completed / Ongoing)',
        'project_proximity'  => 'Proximity Info',
        'project_amenities'  => 'Amenities (comma-separated)',
        'project_specs'      => 'Specifications (JSON or comma-separated key:value)',
    );

    echo '<table class="form-table">';
    foreach ($fields as $key => $label) {
        $value = get_post_meta($post->ID, $key, true);
        echo '<tr><th><label for="' . $key . '">' . $label . '</label></th>';
        if ($key === 'project_amenities' || $key === 'project_specs') {
            echo '<td><textarea name="' . $key . '" id="' . $key . '" rows="4" class="large-text">' . esc_textarea($value) . '</textarea></td>';
        } else {
            echo '<td><input type="text" name="' . $key . '" id="' . $key . '" value="' . esc_attr($value) . '" class="regular-text" /></td>';
        }
        echo '</tr>';
    }
    echo '</table>';
}

function idotinfra_save_project_meta($post_id) {
    if (!isset($_POST['idotinfra_project_nonce']) || !wp_verify_nonce($_POST['idotinfra_project_nonce'], 'idotinfra_project_meta')) {
        return;
    }
    if (defined('DOING_AUTOSAVE') && DOING_AUTOSAVE) return;
    if (!current_user_can('edit_post', $post_id)) return;

    $fields = array('project_type', 'project_location', 'project_config', 'project_area', 'project_status', 'project_proximity', 'project_amenities', 'project_specs');
    foreach ($fields as $key) {
        if (isset($_POST[$key])) {
            update_post_meta($post_id, $key, sanitize_textarea_field($_POST[$key]));
        }
    }
}
add_action('save_post_project', 'idotinfra_save_project_meta');

// WhatsApp floating button
function idotinfra_whatsapp_button() {
    ?>
    <a href="https://wa.me/919999999999" class="idot-whatsapp-float" target="_blank" rel="noopener" aria-label="Chat on WhatsApp">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z"/></svg>
    </a>
    <?php
}
add_action('wp_footer', 'idotinfra_whatsapp_button');

// Helper: get project gallery images from custom field
function idotinfra_get_project_gallery($post_id) {
    $gallery = get_post_meta($post_id, 'project_gallery', true);
    if ($gallery) {
        return array_map('trim', explode(',', $gallery));
    }
    return array();
}

// Helper: get project floor plan images from custom field
function idotinfra_get_project_floorplans($post_id) {
    $plans = get_post_meta($post_id, 'project_floorplans', true);
    if ($plans) {
        return array_map('trim', explode(',', $plans));
    }
    return array();
}

// Disable Astra's default page title on custom template pages and projects
function idotinfra_disable_astra_title($display) {
    if (is_singular('project') || is_page_template('page-projects.php') || is_page_template('page-about.php') || is_front_page()) {
        return false;
    }
    return $display;
}
add_filter('astra_the_title_enabled', 'idotinfra_disable_astra_title');

// Use full-width layout for our custom pages
function idotinfra_astra_page_layout($layout) {
    if (is_singular('project') || is_page_template('page-projects.php') || is_page_template('page-about.php') || is_front_page()) {
        return 'plain-container';
    }
    return $layout;
}
add_filter('astra_page_layout', 'idotinfra_astra_page_layout');

// Disable sidebar on custom pages
function idotinfra_astra_sidebar($layout) {
    if (is_singular('project') || is_page_template('page-projects.php') || is_page_template('page-about.php') || is_front_page()) {
        return 'no-sidebar';
    }
    return $layout;
}
add_filter('astra_page_layout', 'idotinfra_astra_sidebar', 20);

// Customizer: Hero image and flagship project settings
function idotinfra_customize_register($wp_customize) {
    $wp_customize->add_section('idotinfra_hero_section', array(
        'title'    => 'Homepage Hero',
        'priority' => 30,
    ));

    $wp_customize->add_setting('idotinfra_hero_image', array(
        'default'           => '',
        'sanitize_callback' => 'esc_url_raw',
    ));

    $wp_customize->add_control(new WP_Customize_Image_Control($wp_customize, 'idotinfra_hero_image', array(
        'label'   => 'Hero Background Image',
        'section' => 'idotinfra_hero_section',
    )));

    $wp_customize->add_setting('idotinfra_hero_project_id', array(
        'default'           => '',
        'sanitize_callback' => 'absint',
    ));

    $projects = get_posts(array(
        'post_type'      => 'project',
        'posts_per_page' => -1,
        'orderby'        => 'title',
        'order'          => 'ASC',
    ));
    $choices = array('' => '-- None (use uploaded image) --');
    foreach ($projects as $p) {
        $choices[$p->ID] = $p->post_title;
    }

    $wp_customize->add_control('idotinfra_hero_project_id', array(
        'label'   => 'Or use Featured Image from Project',
        'section' => 'idotinfra_hero_section',
        'type'    => 'select',
        'choices' => $choices,
    ));
}
add_action('customize_register', 'idotinfra_customize_register');

function idotinfra_get_hero_image_url() {
    $project_id = get_theme_mod('idotinfra_hero_project_id');
    if ($project_id && has_post_thumbnail($project_id)) {
        return get_the_post_thumbnail_url($project_id, 'full');
    }
    $hero_image = get_theme_mod('idotinfra_hero_image');
    if ($hero_image) {
        return $hero_image;
    }
    return '';
}

// Dynamically populate the CF7 project dropdown from the database
function idotinfra_cf7_dynamic_project_select($tag, $unused) {
    if ($tag['name'] !== 'project') {
        return $tag;
    }

    $projects = get_posts(array(
        'post_type'      => 'project',
        'posts_per_page' => -1,
        'orderby'        => 'title',
        'order'          => 'ASC',
        'post_status'    => 'publish',
    ));

    $tag['raw_values'] = array('Select a Project');
    $tag['values']     = array('');
    $tag['labels']     = array('Select a Project');

    foreach ($projects as $p) {
        $tag['raw_values'][] = $p->post_title;
        $tag['values'][]     = $p->post_title;
        $tag['labels'][]     = $p->post_title;
    }

    $tag['raw_values'][] = 'Other';
    $tag['values'][]     = 'Other';
    $tag['labels'][]     = 'Other';

    return $tag;
}
add_filter('wpcf7_form_tag', 'idotinfra_cf7_dynamic_project_select', 10, 2);

// Flush rewrite rules on theme activation
function idotinfra_rewrite_flush() {
    idotinfra_register_project_cpt();
    flush_rewrite_rules();
}
add_action('after_switch_theme', 'idotinfra_rewrite_flush');
