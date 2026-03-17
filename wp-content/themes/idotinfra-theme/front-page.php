<?php
/**
 * Template Name: Home Page
 * Front page template for I-Dot Infra
 */
get_header();
?>

<!-- Hero Section -->
<?php
$hero_bg_url = idotinfra_get_hero_image_url();
$hero_classes = 'idot-hero';
$hero_style = '';
if ($hero_bg_url) {
    $hero_classes .= ' has-bg-image';
    $hero_style = 'background-image:url(' . esc_url($hero_bg_url) . ');';
}
?>
<section class="<?php echo esc_attr($hero_classes); ?>"<?php if ($hero_style) echo ' style="' . esc_attr($hero_style) . '"'; ?>>
    <div class="idot-hero-content">
        <h1>i-<span>DOT</span> Infra</h1>
        <p class="tagline"><strong>T</strong>rust, <strong>O</strong>pportunity, <strong>D</strong>reams, <strong>I</strong>nnovation</p>
        <p class="hero-desc">Building affordable homes with quality construction in the heart of Hooghly. Your dream home is just a step away.</p>
        <div class="idot-hero-buttons">
            <a href="<?php echo esc_url(get_permalink(get_page_by_path('projects'))); ?>" class="idot-btn idot-btn-primary">View Projects</a>
            <a href="<?php echo esc_url(get_permalink(get_page_by_path('contact-us'))); ?>" class="idot-btn idot-btn-outline">Contact Us</a>
        </div>
    </div>
</section>

<!-- About Snippet -->
<section class="idot-about-snippet">
    <div class="about-image">
        <?php
        $logo_path = get_stylesheet_directory_uri() . '/assets/logo.png';
        ?>
        <img src="<?php echo esc_url($logo_path); ?>" alt="I-Dot Infra" style="padding: 40px; background: #fff;">
    </div>
    <div class="about-text">
        <span class="idot-section-label">About Us</span>
        <h2>Building Dreams, Creating Homes</h2>
        <p>I-Dot Infra is a trusted real estate developer specializing in affordable residential and commercial projects in the Bhadreswar and Hooghly region of West Bengal. With a commitment to quality construction and customer satisfaction, we have successfully delivered multiple projects that families proudly call home.</p>
        <p>Our mission is to make homeownership accessible to everyone through thoughtfully designed, well-constructed, and strategically located properties.</p>
        <a href="<?php echo esc_url(get_permalink(get_page_by_path('about-us'))); ?>" class="idot-btn idot-btn-primary">Know More</a>
    </div>
</section>

<!-- Completed Projects -->
<section class="idot-section-alt">
    <div class="idot-section">
        <span class="idot-section-label">Our Portfolio</span>
        <h2 class="idot-section-title">Completed Projects</h2>
        <p class="idot-section-subtitle">Explore our successfully delivered residential and commercial projects in the Hooghly district.</p>

        <div class="idot-projects-grid">
            <?php
            $projects = new WP_Query(array(
                'post_type'      => 'project',
                'posts_per_page' => -1,
                'orderby'        => 'menu_order',
                'order'          => 'ASC',
                'meta_query'     => array(
                    array(
                        'key'   => 'project_status',
                        'value' => 'Completed',
                    ),
                ),
            ));

            if ($projects->have_posts()) :
                while ($projects->have_posts()) : $projects->the_post();
                    $location = get_post_meta(get_the_ID(), 'project_location', true);
                    $config   = get_post_meta(get_the_ID(), 'project_config', true);
                    $status   = get_post_meta(get_the_ID(), 'project_status', true);
                    $area     = get_post_meta(get_the_ID(), 'project_area', true);
            ?>
            <a href="<?php the_permalink(); ?>" class="idot-project-card">
                <div class="card-image">
                    <?php if (has_post_thumbnail()) : ?>
                        <?php the_post_thumbnail('large'); ?>
                    <?php else : ?>
                        <div style="height:100%;background:linear-gradient(135deg,#1B3A5C,#0D2137);display:flex;align-items:center;justify-content:center;color:#fff;font-size:24px;font-weight:700;"><?php the_title(); ?></div>
                    <?php endif; ?>
                    <span class="card-badge"><?php echo esc_html($status ?: 'Completed'); ?></span>
                </div>
                <div class="card-body">
                    <h3><?php the_title(); ?></h3>
                    <?php if ($location) : ?>
                    <div class="card-location">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>
                        <?php echo esc_html($location); ?>
                    </div>
                    <?php endif; ?>
                    <?php if ($config) : ?>
                    <div class="card-config"><?php echo esc_html($config); ?></div>
                    <?php endif; ?>
                    <?php if ($area) : ?>
                    <div style="font-size:13px;color:#888;margin-top:5px;"><?php echo esc_html($area); ?></div>
                    <?php endif; ?>
                </div>
                <div class="card-footer">
                    <span class="view-link">View Details &rarr;</span>
                </div>
            </a>
            <?php
                endwhile;
                wp_reset_postdata();
            else :
            ?>
                <p style="text-align:center;grid-column:1/-1;color:#888;">Projects coming soon.</p>
            <?php endif; ?>
        </div>
    </div>
</section>

<!-- Why Choose Us -->
<section class="idot-section">
    <span class="idot-section-label">Why Choose Us</span>
    <h2 class="idot-section-title">Building With Trust</h2>
    <p class="idot-section-subtitle">We are committed to delivering quality homes that families love, at prices they can afford.</p>

    <div class="idot-usp-grid">
        <div class="idot-usp-item">
            <div class="usp-icon">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/></svg>
            </div>
            <h4>Affordable Housing</h4>
            <p>Quality homes designed for middle-class families, priced to make homeownership a reality for everyone.</p>
        </div>
        <div class="idot-usp-item">
            <div class="usp-icon">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 1L3 5v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V5l-9-4zm-2 16l-4-4 1.41-1.41L10 14.17l6.59-6.59L18 9l-8 8z"/></svg>
            </div>
            <h4>Quality Construction</h4>
            <p>Built with premium materials and supervised by experienced engineers ensuring lasting durability.</p>
        </div>
        <div class="idot-usp-item">
            <div class="usp-icon">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>
            </div>
            <h4>Prime Locations</h4>
            <p>Strategically located near railway stations, schools, hospitals, and major transportation hubs.</p>
        </div>
        <div class="idot-usp-item">
            <div class="usp-icon">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M16 11c1.66 0 2.99-1.34 2.99-3S17.66 5 16 5c-1.66 0-3 1.34-3 3s1.34 3 3 3zm-8 0c1.66 0 2.99-1.34 2.99-3S9.66 5 8 5C6.34 5 5 6.34 5 8s1.34 3 3 3zm0 2c-2.33 0-7 1.17-7 3.5V19h14v-2.5c0-2.33-4.67-3.5-7-3.5zm8 0c-.29 0-.62.02-.97.05 1.16.84 1.97 1.97 1.97 3.45V19h6v-2.5c0-2.33-4.67-3.5-7-3.5z"/></svg>
            </div>
            <h4>Trusted Builder</h4>
            <p>Multiple successfully completed projects with happy homeowners across the Hooghly district.</p>
        </div>
    </div>
</section>

<!-- Contact CTA -->
<section class="idot-cta">
    <h2>Ready to Find Your Dream Home?</h2>
    <p>Get in touch with us today and take the first step towards owning your perfect home.</p>
    <a href="tel:+919999999999" class="cta-phone">+91 99999 99999</a>
    <a href="<?php echo esc_url(get_permalink(get_page_by_path('contact-us'))); ?>" class="idot-btn idot-btn-primary">Get In Touch</a>
</section>

<?php get_footer(); ?>
