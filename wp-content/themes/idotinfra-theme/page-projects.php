<?php
/**
 * Template Name: Projects Listing
 * Displays all projects in a grid layout
 */
get_header();
?>

<section class="idot-project-hero" style="padding:60px 40px 50px;">
    <h1>Our Projects</h1>
    <p style="opacity:0.8;font-size:18px;max-width:600px;margin:10px auto 0;">Explore our portfolio of residential and commercial developments in the Hooghly district.</p>
</section>

<div class="idot-projects-listing">
    <!-- Completed Projects -->
    <div style="margin-bottom:60px;">
        <span class="idot-section-label">Delivered</span>
        <h2 class="idot-section-title">Completed Projects</h2>
        <p class="idot-section-subtitle">Successfully delivered homes that families proudly call their own.</p>

        <div class="idot-projects-grid">
            <?php
            $completed = new WP_Query(array(
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

            if ($completed->have_posts()) :
                while ($completed->have_posts()) : $completed->the_post();
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
                <p style="text-align:center;grid-column:1/-1;color:#888;">No completed projects found.</p>
            <?php endif; ?>
        </div>
    </div>

    <!-- Ongoing Projects -->
    <?php
    $ongoing = new WP_Query(array(
        'post_type'      => 'project',
        'posts_per_page' => -1,
        'orderby'        => 'menu_order',
        'order'          => 'ASC',
        'meta_query'     => array(
            array(
                'key'   => 'project_status',
                'value' => 'Ongoing',
            ),
        ),
    ));
    ?>
    <div>
        <span class="idot-section-label">In Progress</span>
        <h2 class="idot-section-title">Ongoing Projects</h2>
        <p class="idot-section-subtitle">Our current developments that will soon welcome new homeowners.</p>

        <div class="idot-projects-grid">
            <?php if ($ongoing->have_posts()) :
                while ($ongoing->have_posts()) : $ongoing->the_post();
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
                        <div style="height:100%;background:linear-gradient(135deg,#F37021,#E05500);display:flex;align-items:center;justify-content:center;color:#fff;font-size:24px;font-weight:700;"><?php the_title(); ?></div>
                    <?php endif; ?>
                    <span class="card-badge" style="background:#25D366;">Ongoing</span>
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
            <?php endwhile; wp_reset_postdata();
            else : ?>
            <div class="idot-project-card idot-coming-soon-card">
                <div class="card-image coming-soon-placeholder">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48" height="48"><path d="M19 9.3V4h-3v2.6L12 3 2 12h3v8h5v-6h4v6h5v-8h3l-3-2.7zm-9 .7c0-1.1.9-2 2-2s2 .9 2 2h-4z" fill="currentColor"/></svg>
                    <h3>New Projects Coming Soon!</h3>
                    <p>Stay tuned for exciting new developments.</p>
                </div>
                <div class="card-footer" style="justify-content:center;">
                    <a href="<?php echo esc_url(get_permalink(get_page_by_path('contact-us'))); ?>" class="view-link">Get Notified &rarr;</a>
                </div>
            </div>
            <?php endif; ?>
        </div>
    </div>
</div>

<!-- CTA -->
<section class="idot-cta">
    <h2>Looking for Your Dream Home?</h2>
    <p>Get in touch with us to explore available options and schedule a site visit.</p>
    <a href="<?php echo esc_url(get_permalink(get_page_by_path('contact-us'))); ?>" class="idot-btn idot-btn-primary">Contact Us</a>
</section>

<?php get_footer(); ?>
