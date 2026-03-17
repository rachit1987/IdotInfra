<?php
/**
 * Template for displaying single Project posts
 */
get_header();

while (have_posts()) : the_post();
    $project_type      = get_post_meta(get_the_ID(), 'project_type', true);
    $project_location  = get_post_meta(get_the_ID(), 'project_location', true);
    $project_config    = get_post_meta(get_the_ID(), 'project_config', true);
    $project_area      = get_post_meta(get_the_ID(), 'project_area', true);
    $project_status    = get_post_meta(get_the_ID(), 'project_status', true);
    $project_proximity = get_post_meta(get_the_ID(), 'project_proximity', true);
    $project_amenities = get_post_meta(get_the_ID(), 'project_amenities', true);
    $project_specs     = get_post_meta(get_the_ID(), 'project_specs', true);
    $gallery_ids       = idotinfra_get_project_gallery(get_the_ID());
    $floorplan_ids     = idotinfra_get_project_floorplans(get_the_ID());
?>

<!-- Project Hero -->
<?php
$hero_bg = '';
$hero_cls = 'idot-project-hero';
if (has_post_thumbnail()) {
    $hero_bg = get_the_post_thumbnail_url(get_the_ID(), 'full');
    $hero_cls .= ' has-bg-image';
}
?>
<section class="<?php echo esc_attr($hero_cls); ?>"<?php if ($hero_bg) echo ' style="background-image:url(' . esc_url($hero_bg) . ');"'; ?>>
    <div class="project-hero-overlay"></div>
    <div class="project-hero-content">
        <div class="project-type"><?php echo esc_html($project_type); ?></div>
        <h1><?php the_title(); ?></h1>
        <?php if ($project_location) : ?>
            <div class="project-location">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="width:16px;height:16px;fill:#F37021;vertical-align:middle;margin-right:4px;"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>
                <?php echo esc_html($project_location); ?>
            </div>
        <?php endif; ?>
        <?php if ($project_config || $project_area) : ?>
            <div style="margin-top:10px;font-size:16px;opacity:0.85;">
                <?php if ($project_config) echo esc_html($project_config); ?>
                <?php if ($project_config && $project_area) echo ' | '; ?>
                <?php if ($project_area) echo esc_html($project_area); ?>
            </div>
        <?php endif; ?>
    </div>
</section>

<!-- Gallery -->
<?php if (!empty($gallery_ids)) : ?>
<section class="idot-project-gallery">
    <?php foreach ($gallery_ids as $img_id) :
        $img_url = wp_get_attachment_image_url(intval($img_id), 'large');
        if ($img_url) :
    ?>
        <img src="<?php echo esc_url($img_url); ?>" alt="<?php the_title(); ?> Gallery Image">
    <?php endif; endforeach; ?>
</section>
<?php endif; ?>

<!-- About Project -->
<section class="idot-project-about">
    <h2>About Project</h2>
    <?php the_content(); ?>
    <?php if ($project_proximity) : ?>
        <p style="color:var(--idot-accent);font-weight:600;margin-top:20px;"><?php echo esc_html($project_proximity); ?></p>
    <?php endif; ?>
</section>

<!-- Specifications -->
<?php if ($project_specs) : ?>
<section class="idot-section-alt" style="padding:60px 0;">
    <div class="idot-section" style="padding-bottom:0;">
        <span class="idot-section-label">Details</span>
        <h2 class="idot-section-title">Specifications</h2>
    </div>
    <div class="idot-specs-grid" style="padding-top:30px;padding-bottom:60px;">
        <?php
        $spec_icons = array(
            'Foundation' => '🏗️',
            'Walls'      => '🧱',
            'Flooring'   => '🏠',
            'Windows'    => '🪟',
            'Doors'      => '🚪',
            'Kitchen'    => '🍳',
            'Bathroom'   => '🚿',
            'Toilet'     => '🚽',
            'Electrical' => '⚡',
            'Water Supply' => '💧',
        );
        $specs_arr = array_map('trim', explode(',', $project_specs));
        foreach ($specs_arr as $spec) :
            $parts = explode(':', $spec, 2);
            if (count($parts) === 2) :
                $key = trim($parts[0]);
                $val = trim($parts[1]);
                $icon = isset($spec_icons[$key]) ? $spec_icons[$key] : '📋';
        ?>
        <div class="idot-spec-item">
            <span class="spec-icon"><?php echo $icon; ?></span>
            <h4><?php echo esc_html($key); ?></h4>
            <p><?php echo esc_html($val); ?></p>
        </div>
        <?php endif; endforeach; ?>
    </div>
</section>
<?php endif; ?>

<!-- Amenities -->
<?php if ($project_amenities) : ?>
<section style="padding:60px 0;">
    <div class="idot-section" style="padding-bottom:0;">
        <span class="idot-section-label">Features</span>
        <h2 class="idot-section-title">Amenities</h2>
    </div>
    <div class="idot-amenities-list" style="padding-top:30px;">
        <?php
        $amenities_arr = array_map('trim', explode(',', $project_amenities));
        foreach ($amenities_arr as $amenity) :
            if (!empty($amenity)) :
        ?>
        <div class="idot-amenity-item">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
            <span><?php echo esc_html($amenity); ?></span>
        </div>
        <?php endif; endforeach; ?>
    </div>
</section>
<?php endif; ?>

<!-- Floor Plans -->
<?php if (!empty($floorplan_ids)) : ?>
<section class="idot-section-alt" style="padding:60px 0;">
    <div class="idot-section" style="padding-bottom:0;">
        <span class="idot-section-label">Layout</span>
        <h2 class="idot-section-title">Floor Plans</h2>
    </div>
    <div class="idot-floorplans" style="padding-top:30px;padding-bottom:40px;">
        <?php foreach ($floorplan_ids as $fp_id) :
            $fp_url = wp_get_attachment_image_url(intval($fp_id), 'full');
            if ($fp_url) :
        ?>
            <img src="<?php echo esc_url($fp_url); ?>" alt="<?php the_title(); ?> Floor Plan">
        <?php endif; endforeach; ?>
    </div>
</section>
<?php endif; ?>

<!-- Enquiry CTA -->
<section class="idot-cta">
    <h2>Interested in <?php the_title(); ?>?</h2>
    <p>Contact us to learn more about availability, pricing, and site visits.</p>
    <a href="<?php echo esc_url(get_permalink(get_page_by_path('contact-us'))); ?>?project=<?php echo urlencode(get_the_title()); ?>" class="idot-btn idot-btn-primary">Enquire Now</a>
</section>

<?php endwhile; ?>

<?php get_footer(); ?>
